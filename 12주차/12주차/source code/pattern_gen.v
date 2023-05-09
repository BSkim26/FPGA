module pattern_gen(
   input clk,                           //input���� clk, reset_n, 2bit pattern_select ����
   input reset_n,                  
   input [1:0] pattern_select,    

   output        o_vs,                  //output���� o_vs(Vsync), o_hs(Hsync) ����
   output        o_hs,                          
   //output        o_de,
   ////Color data out for Zybo 7000
   /*
   output [4:0] o_r_data,
   output [5:0] o_g_data,
   output [4:0] o_b_data
   */
   ////Color data out for Zybo 7010 or Zybo 7020
   output [3:0] o_r_data,               //output���� 4bit o_r_data(Red), o_g_data(Green),o_b_data(Blue) ����
   output [3:0] o_g_data,               
   output [3:0] o_b_data                
   
);
//   =======================================
//   Parameters
//   =======================================
////1280 x 720 // 74.25 MHz @ 60Hz
//parameter h_front_porch  = 32'd110;
//parameter h_sync_width   = 32'd40;
//parameter h_back_porch   = 32'd220;
//parameter h_active       = 32'd1280;
//
//parameter v_front_porch  = 32'd5;
//parameter v_sync_width   = 32'd5;
//parameter v_back_porch   = 32'd20;
//parameter v_active       = 32'd720;

//640 x 480 // 25.2 MHz @ 60Hz
//horizon
parameter h_front_porch  = 32'd16  ;    //Horizon_front porch = 16
parameter h_sync_width   = 32'd96  ;    //Horizon_sync width = 96
parameter h_back_porch   = 32'd48  ;    //Horizon_back porch = 48
parameter h_active       = 32'd640 ;    //Horizon_visible area = 640
//vertical
parameter v_front_porch  = 32'd10 ;     //Verticla_front porch = 10
parameter v_sync_width   = 32'd2  ;     //Vertical_sync width = 2
parameter v_back_porch   = 32'd33 ;     //Verticla_back porch = 33
parameter v_active       = 32'd480;     //Vertical_visible area = 480

parameter h_total        = h_front_porch + h_sync_width + h_back_porch + h_active;  //total horizon(�ѱ���) = 800
parameter v_total        = v_front_porch + v_sync_width + v_back_porch + v_active;  //total vertical(�ѱ���) = 525

parameter init_cnt_top = 32'h0000_0fff; //������

//   =======================================
//   Reg, Wires
//   =======================================
reg [31:0] init_cnt;    //count
reg [31:0] h_cnt;       //horizon_count

wire h_sync_hit        ;    //check_horizon_sync_hit
wire h_back_porch_hit  ;    //check_horizon_back_porch_hit
wire h_active_hit      ;    //check_horizon_active_hit
wire h_front_porch_hit ;    //check_horizon_front_porch_hit

reg [31:0] line_cnt;    //line_count
wire active_line;       //active_line

reg vs;                 //vertical_sign
reg hs;                 //hoirizion_sign
reg de;                 //de_sign

reg [15:0] de_cnt;      //de_count

//   =======================================
//   Structural Coding
//   =======================================
//Inintal Waiting
always @ (posedge clk, negedge reset_n)     //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����, reset�� �ణ�� �ð� delay
   if(~reset_n)                             //reset_n�� 0�� ���
      init_cnt <= 32'b0;                    //init_cnt 0���� �ʱ�ȭ
   else if(init_cnt == init_cnt_top)        //init_cnt = init_cnt_top�̸�
      init_cnt <= init_cnt;                 //init_cnt �� ����
   else                                     //�� ������ �ƴϸ�
      init_cnt <= init_cnt + 1'b1;          //init_cnt + 1

//Horizon Count
always @ (posedge clk, negedge reset_n)     //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
   if(~reset_n)                             //reset_n�� 0�� ���
      h_cnt <= 32'b0;                       //h_cnt 0���� �ʱ�ȭ
   else if(h_cnt == h_total - 1'b1)         //h_cnt = h_total - 1�̸�
      h_cnt <= 32'b0;                       //h_cnt 0���� �ʱ�ȭ
   else if(init_cnt == init_cnt_top)        //init_cnt = init_cnt_top �̸�
      h_cnt <= h_cnt + 1'b1;                //h_cnt + 1

//Horizon hit point
assign h_sync_hit        = (h_cnt == h_sync_width - 1'b1) ? 1'b1 : 1'b0;                                          //h_cnt = h_sync_width - 1�̸�                                            h_sync_hit = 1, �ƴϸ� 0
assign h_back_porch_hit  = (h_cnt == h_sync_width + h_back_porch - 1'b1) ? 1'b1 : 1'b0;                           //h_cnt = h_sync_width + h_back_porch - 1�̸�                             h_back_porch_hit = 1, �ƴϸ� 0 
assign h_active_hit      = (h_cnt == h_sync_width + h_back_porch + h_active - 1'b1) ? 1'b1 : 1'b0;                //h_cnt = h_sync_width + h_back_porch + h_active - 1�̸�                  h_active_hit = 1, �ƴϸ� 0
assign h_front_porch_hit = (h_cnt == h_sync_width + h_back_porch + h_active + h_front_porch- 1'b1) ? 1'b1 : 1'b0; //h_cnt = h_sync_width + h_back_porch + h_active + h_front_porch- 1�̸�   h_front_porch_hit = 1, �ƴϸ� 0

//Vertical Count
always @ (posedge clk, negedge reset_n)                                 //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
   if(~reset_n)                                                         //reset_n�� 0�� ���
      line_cnt <= 32'b0;                                                //line_cnt 0���� �ʱ�ȭ
   else if(h_front_porch_hit && (line_cnt == v_total - 1'b1))           //(h_front_porch_hit�� 1�̰� line_cnt = v_total - 1�� ���  (���� ������)
      line_cnt <= 32'b0;                                                //line_cnt 0���� �ʱ�ȭ                                    
   else if(h_front_porch_hit)                                           //h_front_porch_hit = 1�� ���
      line_cnt <= line_cnt + 1'b1;                                      //line_cnt <= line_cnt + 1  (�ٹٲ��� ����)

//Vertical active line ���� ����
assign active_line = ((line_cnt > v_sync_width + v_back_porch - 1'b1) && (line_cnt < v_sync_width + v_back_porch + v_active)) ? 1'b1 : 1'b0;    //line_cnt > v_sync_width + v_back_porch - 1�̰� line_cnt < v_sync_width + v_back_porch + v_active�� ���
                                                                                                                                                //active_line = 1 �ƴϸ� 0
//Make VSYHC
always @ (posedge clk, negedge reset_n)                               //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
   if(~reset_n)                                                       //reset_n�� 0�� ���
      vs <= 1'b0;                                                     //vs = 0���� �ʱ�ȭ
   else if((line_cnt == v_total - 1'b1) && (h_front_porch_hit))       //line_cnt = v_total - 1 �̰� h_front_porch_hit = 1�̸�
      vs <= 1'b0;                                                     //vs = 0          Sync Pulse
   else if((line_cnt == v_sync_width - 1'b1) && (h_front_porch_hit))  //line_cnt = v_sync_width - 1 �̰� h_front_porch_hit = 1�̸�
      vs <= 1'b1;                                                     //vs = 1          Active of Line

//Make HSYHC
always @ (posedge clk, negedge reset_n)                               //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
   if(~reset_n)                                                       //reset_n�� 0�� ���
      hs <= 1'b0;                                                     //hs = 0���� �ʱ�ȭ
   else if(h_front_porch_hit)                                         //h_front_porch_hit = 1�� ���
//   else if(h_front_porch_hit & active_line)  // If you want it,
      hs <= 1'b0;                                                     //hs = 0          Sync Pulse
   else if(h_sync_hit)                                                //h_sync_hit = 1�� ���
      hs <= 1'b1;                                                     //hs = 1          Active of Pixel

// Make Data Enable Signal
always @ (posedge clk, negedge reset_n)                               //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
   if(~reset_n)                                                       //reset_n�� 0�� ���
      de <= 1'b0;                                                     //de = 0���� �ʱ�ȭ
   else if(active_line)                                               //active_line�� 1�� ���
      if(h_back_porch_hit)                                            //h_back_porch_hit = 1�� ���
         de <= 1'b1;                                                  //de = 1
      else if(h_active_hit)                                           //h_active_hit = 1�� ���
         de <= 1'b0;                                                  //de = 0���� �ʱ�ȭ
         
//output����
assign o_vs = vs;                                                     //o_vs = vs ����
assign o_hs = hs;                                                     //o_hs = hs ����
//assign o_de = de;

always @ (posedge clk, negedge reset_n)                               //clk�� ��� edge�� reset_n�� �ϰ� edge���� ����
  if(~reset_n)                                                        //reset_n�� 0�� ���
    de_cnt <= 16'b0;                                                  //de_cnt = 0���� �ʱ�ȭ
  else if(~de)                                                        //de�� 0�� ���
    de_cnt <= 16'b0;                                                  //de_cnt = 0���� �ʱ�ȭ
  else if(de)                                                         //de�� 1�� ���
    de_cnt <= de_cnt + 1'b1;                                          //de_cnt + 1

//// RGB Vdieo Pattern Code ////
//Pattern 0 (White / Black)
wire p0_r_en = ( de_cnt <  (h_active*1/2));                                                                 //�������� ���� ���� �� 0~1/2���� red
wire p0_g_en = ( de_cnt <  (h_active*1/2));                                                                 //�������� ���� ���� �� 0~1/2���� green
wire p0_b_en = ( de_cnt <  (h_active*1/2));                                                                 //�������� ���� ���� �� 0~1/2���� blue
//Pattern 1 (White / Red / Green / Blue)
wire p1_r_en = ( de_cnt <  (h_active*2/4));                                                                 //�������� ���� ���� �� 0~1/2���� red
wire p1_g_en = ((de_cnt <  (h_active*1/4)) || (de_cnt >=  (h_active*2/4))) && (de_cnt < (h_active*3/4));    //�������� ���� ���� �� 0~1/4�� 1/2~3/4���� green
wire p1_b_en = ((de_cnt <  (h_active*1/4)) || (de_cnt >=  (h_active*3/4)));                                 //�������� ���� ���� �� 0~1/4�� 3/4~������ blue
//Pattern 2 (Red / Green / Blue / Black / White)
wire p2_r_en = ( de_cnt <  (h_active*1/5)) || (de_cnt >= (h_active*4/5));                                   //�������� ���� ���� �� 0~1/5�� 4/5~������ red
wire p2_g_en = ((de_cnt >= (h_active*1/5)) && (de_cnt <  (h_active*2/5))) || (de_cnt >= (h_active*4/5));    //�������� ���� ���� �� 1/5~2/5�� 4/5~������ green
wire p2_b_en = ((de_cnt >= (h_active*2/5)) && (de_cnt <  (h_active*3/5))) || (de_cnt >= (h_active*4/5));    //�������� ���� ���� �� 2/5~3/5�� 4/5~������ blue
//Pattern 3 
wire p3_r_en = (line_cnt <  (v_sync_width+v_back_porch+v_active*1/2));                                      //�������� ���� ���� �� ������ ���� 0~1/2���� red
wire p3_g_en = (de_cnt  <   (h_active*1/2));                                                                //�������� ���� ���� �� 0~1/2���� green
wire p3_b_en = ((line_cnt >= (v_sync_width+v_back_porch+v_active*1/2)) && (de_cnt >= (h_active*1/2)) || ((de_cnt <(h_active*1/2))&&(line_cnt<(v_sync_width+v_back_porch+v_active*1/2))));
                                                                                                            //2��и�, 4��и鿡 blue
//���Ͽ� ���� �� ����
wire r_en = (pattern_select == 2'd0)?    p0_r_en :          //pattern_select = 00�� ��� pattern0
            (pattern_select == 2'd1)?    p1_r_en :          //pattern_select = 01�� ��� pattern1
            (pattern_select == 2'd2)?    p2_r_en : p3_r_en; //pattern_select = 10�� ��� pattern2, �� ��� ��� �ƴϸ� pattern3

wire g_en = (pattern_select == 2'd0)?    p0_g_en :          //pattern_select = 00�� ��� pattern0                         
            (pattern_select == 2'd1)?    p1_g_en :          //pattern_select = 01�� ��� pattern1                         
            (pattern_select == 2'd2)?    p2_g_en : p3_g_en; //pattern_select = 10�� ��� pattern2, �� ��� ��� �ƴϸ� pattern3   

wire b_en = (pattern_select == 2'd0)?    p0_b_en :          //pattern_select = 00�� ��� pattern0                         
            (pattern_select == 2'd1)?    p1_b_en :          //pattern_select = 01�� ��� pattern1                         
            (pattern_select == 2'd2)?    p2_b_en : p3_b_en; //pattern_select = 10�� ��� pattern2, �� ��� ��� �ƴϸ� pattern3   
////// Color data out assign
////Color data out for Zybo 7000
/*
assign o_r_data = (de & r_en) ? 5'd31 : 8'b0;
assign o_g_data = (de & g_en) ? 6'd63 : 8'b0;
assign o_b_data = (de & b_en) ? 5'd31 : 8'b0;
*/
////Color data out for Zybo 7010 or Zybo 7020
assign o_r_data = (de & r_en) ? 4'd15 : 8'b0;   //Zybo 7010���� red_led
assign o_g_data = (de & g_en) ? 4'd15 : 8'b0;   //Zybo 7010���� green_led
assign o_b_data = (de & b_en) ? 4'd15 : 8'b0;   //Zybo 7010���� blue_led

endmodule