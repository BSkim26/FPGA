`timescale 1ns / 1ps

module top_seg(
    input   clk_ref, rst, start, stop,                                              //input으로 clk_ref, rst,en, up, down 선언
    (*mark_debug=1*)output  [1:0]   seg_en,                                         // output으로 2bit seg_en 선언
   (*mark_debug=1*)output  [6:0]   seg_ab,                                          // output으로 seg_ab 선언
   (*mark_debug=1*)output  [6:0]   seg_cd                                           // output으로 seg_cd 선언
    );
    
    wire    clk_125M = clk_ref;                                                      // wire 타입으로 clk_125M 선언, clk_125M = clk_ref 
    wire    clk_100M,clk_1M,clk_10K,clk_100;                                         // wire 타입으로 clk_100M, clk_1M, clk_10k, clk_100 선언
    //wire    s_start, s_stop, d_start,d_stop;                                         // wire 타입으로 s_start, s_stop, d_start,d_stop 선언
    wire    [15:0] time_data;                                                       // wire 타입으로 16bit time_data 선언
    wire    [3:0] hexa,hexb,hexc,hexd;                                               // wire 타입으로 4bit hexa,hexb,hexc,hexd 선언
    wire    [6:0] sega,segb,segc,segd;                                               // wire 타입으로 7bit sega,segb,segc,segd 선언
        
    clk_wiz_0        u0 (.clk_out1(clk_100M), .reset(rst), .clk_in1(clk_125M));        //clk_wiz_0을 이용해 100MHz 신호 clk_100M에 연결
    freq_div_100     f_d1 (clk_100M, rst, clk_1M);                                    //frequency Divider로 1MHz 신호 clk_1M에 연결
    freq_div_100     f_d2 (clk_1M, rst, clk_10K);                                     //frequency Divider로 10kHz 신호 clk_10K에 연결
    freq_div_100     f_d3 (clk_10K, rst, clk_100);                                    //frequency Divider로 100Hz 신호 clk_100에 연결
    
    //synchronizer     s_c1 (.clk(clk_100),.async_in(start),.sync_out(s_start));                                    // synchronizer로 start, clk_100과 동기화 시켜 s_start에 연결
    //synchronizer     s_c2 (.clk(clk_100),.async_in(stop),.sync_out(s_stop));                                      // synchronizer로 stop, clk_100과 동기화 시켜 s_stop에 연결
    //    
    //debouncer        d_b1(.clk(clk_100),.noisy(s_start), .debounced(d_start));                                   //debouncer로 s_start신호 debounce하여 d_start에 연결
    //debouncer        d_b2 (.clk(clk_100),.noisy(s_stop), .debounced(d_stop));                                     //debouncer로 s_stop신호 debounce하여 d_stop에 연결
    
    timer timer1(.clk(clk_100), .rst(rst), .start(start), .stop(stop), .out(time_data));  // timer에 clk_100, rst, d_start, d_stop, time_data 연결
    
    hex hex0(.hex(hexa), .seg(sega));                   // hex에 hexa, sega 연결
    hex hex1(.hex(hexb), .seg(segb));                   // hex에 hexb, segb 연결
    hex hex2(.hex(hexc), .seg(segc));                   // hex에 hexc, segc 연결
    hex hex3(.hex(hexd), .seg(segd));                   // hex에 hexd, segd 연결
    
    assign  {hexa,hexb,hexc,hexd}=time_data;            // time_data를 4개로 나누어 hexa, hexb, hexc, hexd에 입력
    assign  seg_en=clk_1M ? 2'b11:2'b00;                // seg_en을 clk_1M값에 따라 변경
    assign  seg_ab=clk_1M ? sega:segb;                  // seg_ab를 clk_1M값에 따라 변경
    assign  seg_cd=clk_1M ? segc:segd;                  //  seg_cd를 clk_1M값에 따라 변경
    
endmodule
