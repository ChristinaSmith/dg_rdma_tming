//
// Generated by Bluespec Compiler, version 2013.01.beta5 (build 30325, 2013-01-23)
//
// On Sun Jun 16 13:35:16 CDT 2013
//
// Method conflict info:
// Method: datagram_get
// Conflict-free: mesg_put
// Conflicts: datagram_get
//
// Method: mesg_put
// Conflict-free: datagram_get
// Conflicts: mesg_put
//
//
// Ports:
// Name                         I/O  size props
// datagram_get                   O   134 reg
// RDY_datagram_get               O     1 reg
// RDY_mesg_put                   O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// mesg_put                       I   129 reg
// EN_mesg_put                    I     1
// EN_datagram_get                I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkSenderDM1(CLK,
		   RST_N,

		   EN_datagram_get,
		   datagram_get,
		   RDY_datagram_get,

		   mesg_put,
		   EN_mesg_put,
		   RDY_mesg_put);
  input  CLK;
  input  RST_N;

  // actionvalue method datagram_get
  input  EN_datagram_get;
  output [133 : 0] datagram_get;
  output RDY_datagram_get;

  // action method mesg_put
  input  [128 : 0] mesg_put;
  input  EN_mesg_put;
  output RDY_mesg_put;

  // signals for module outputs
  wire [133 : 0] datagram_get;
  wire RDY_datagram_get, RDY_mesg_put;

  // inlined wires
  wire [4 : 0] byteShifter_delta_deq_wget;

  // register byteOut
  reg [7 : 0] byteOut;
  wire [7 : 0] byteOut_D_IN;
  wire byteOut_EN;

  // register byteShifter_num_empty
  reg [5 : 0] byteShifter_num_empty;
  wire [5 : 0] byteShifter_num_empty_D_IN;
  wire byteShifter_num_empty_EN;

  // register byteShifter_num_full
  reg [5 : 0] byteShifter_num_full;
  wire [5 : 0] byteShifter_num_full_D_IN;
  wire byteShifter_num_full_EN;

  // register byteShifter_vec
  reg [383 : 0] byteShifter_vec;
  wire [383 : 0] byteShifter_vec_D_IN;
  wire byteShifter_vec_EN;

  // register bytesDeqd
  reg [15 : 0] bytesDeqd;
  wire [15 : 0] bytesDeqd_D_IN;
  wire bytesDeqd_EN;

  // register bytesInFrame
  reg [15 : 0] bytesInFrame;
  reg [15 : 0] bytesInFrame_D_IN;
  wire bytesInFrame_EN;

  // register bytesRemainMD
  reg [15 : 0] bytesRemainMD;
  wire [15 : 0] bytesRemainMD_D_IN;
  wire bytesRemainMD_EN;

  // register bytesToDeq
  reg [15 : 0] bytesToDeq;
  wire [15 : 0] bytesToDeq_D_IN;
  wire bytesToDeq_EN;

  // register bytesToEnqR
  reg [15 : 0] bytesToEnqR;
  wire [15 : 0] bytesToEnqR_D_IN;
  wire bytesToEnqR_EN;

  // register bytesValid
  reg bytesValid;
  wire bytesValid_D_IN, bytesValid_EN;

  // register eof
  reg eof;
  wire eof_D_IN, eof_EN;

  // register fcs
  reg [1 : 0] fcs;
  reg [1 : 0] fcs_D_IN;
  wire fcs_EN;

  // register fh
  reg [79 : 0] fh;
  wire [79 : 0] fh_D_IN;
  wire fh_EN;

  // register fhValid
  reg fhValid;
  wire fhValid_D_IN, fhValid_EN;

  // register frameCompCnt
  reg [15 : 0] frameCompCnt;
  wire [15 : 0] frameCompCnt_D_IN;
  wire frameCompCnt_EN;

  // register frameSrcCnt
  reg [15 : 0] frameSrcCnt;
  wire [15 : 0] frameSrcCnt_D_IN;
  wire frameSrcCnt_EN;

  // register madeMeta
  reg madeMeta;
  wire madeMeta_D_IN, madeMeta_EN;

  // register mesgDataLen
  reg [15 : 0] mesgDataLen;
  wire [15 : 0] mesgDataLen_D_IN;
  wire mesgDataLen_EN;

  // register mh
  reg [191 : 0] mh;
  wire [191 : 0] mh_D_IN;
  wire mh_EN;

  // register mhPhase
  reg mhPhase;
  wire mhPhase_D_IN, mhPhase_EN;

  // register mhValid
  reg mhValid;
  wire mhValid_D_IN, mhValid_EN;

  // ports of submodule bsEnqF
  reg [132 : 0] bsEnqF_D_IN;
  wire [132 : 0] bsEnqF_D_OUT;
  wire bsEnqF_CLR, bsEnqF_DEQ, bsEnqF_EMPTY_N, bsEnqF_ENQ, bsEnqF_FULL_N;

  // ports of submodule datagramEgressF
  wire [133 : 0] datagramEgressF_D_IN, datagramEgressF_D_OUT;
  wire datagramEgressF_CLR,
       datagramEgressF_DEQ,
       datagramEgressF_EMPTY_N,
       datagramEgressF_ENQ,
       datagramEgressF_FULL_N;

  // ports of submodule fcF
  wire [15 : 0] fcF_D_IN, fcF_D_OUT;
  wire fcF_CLR, fcF_DEQ, fcF_EMPTY_N, fcF_ENQ, fcF_FULL_N;

  // ports of submodule mesgIngressF
  wire [128 : 0] mesgIngressF_D_IN, mesgIngressF_D_OUT;
  wire mesgIngressF_CLR,
       mesgIngressF_DEQ,
       mesgIngressF_EMPTY_N,
       mesgIngressF_ENQ,
       mesgIngressF_FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_byteShifter_update,
       CAN_FIRE_RL_enqByteShifter,
       CAN_FIRE_RL_enqFH,
       CAN_FIRE_RL_enqMD,
       CAN_FIRE_RL_enqMH,
       CAN_FIRE_RL_frameSourceComplete,
       CAN_FIRE_RL_frameSourcePump,
       CAN_FIRE_RL_genFH,
       CAN_FIRE_RL_genMH,
       CAN_FIRE_datagram_get,
       CAN_FIRE_mesg_put,
       WILL_FIRE_RL_byteShifter_update,
       WILL_FIRE_RL_enqByteShifter,
       WILL_FIRE_RL_enqFH,
       WILL_FIRE_RL_enqMD,
       WILL_FIRE_RL_enqMH,
       WILL_FIRE_RL_frameSourceComplete,
       WILL_FIRE_RL_frameSourcePump,
       WILL_FIRE_RL_genFH,
       WILL_FIRE_RL_genMH,
       WILL_FIRE_datagram_get,
       WILL_FIRE_mesg_put;

  // inputs to muxes for submodule ports
  wire [132 : 0] MUX_bsEnqF_enq_1__VAL_1,
		 MUX_bsEnqF_enq_1__VAL_2,
		 MUX_bsEnqF_enq_1__VAL_3;
  wire [15 : 0] MUX_bytesInFrame_write_1__VAL_1,
		MUX_bytesInFrame_write_1__VAL_2,
		MUX_bytesInFrame_write_1__VAL_3,
		MUX_bytesRemainMD_write_1__VAL_2;
  wire [1 : 0] MUX_fcs_write_1__VAL_2;
  wire MUX_bytesToDeq_write_1__SEL_1, MUX_fcs_write_1__SEL_1;

  // remaining internal signals
  reg [63 : 0] v__h67262;
  wire [383 : 0] _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64,
		 byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69;
  wire [127 : 0] bsEnqFD_OUT_BITS_127_TO_0__q2, x__h16603;
  wire [95 : 0] IF_IF_mesgIngressF_first__4_BIT_128_5_THEN_DON_ETC___d134;
  wire [31 : 0] mesgIngressFD_OUT_BITS_39_TO_8__q1;
  wire [15 : 0] IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187,
		bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190,
		bytesToDeq_76_MINUS_bytesDeqd_94___d295;
  wire [8 : 0] x__h21332;
  wire [7 : 0] x__h39601, x__h52612, x__h52616, x_f__h48853;
  wire [4 : 0] IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9,
	       IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4;
  wire NOT_madeMeta_20_84_OR_NOT_bytesRemainMD_85_MIN_ETC___d197;

  // actionvalue method datagram_get
  assign datagram_get = datagramEgressF_D_OUT ;
  assign RDY_datagram_get = datagramEgressF_EMPTY_N ;
  assign CAN_FIRE_datagram_get = datagramEgressF_EMPTY_N ;
  assign WILL_FIRE_datagram_get = EN_datagram_get ;

  // action method mesg_put
  assign RDY_mesg_put = mesgIngressF_FULL_N ;
  assign CAN_FIRE_mesg_put = mesgIngressF_FULL_N ;
  assign WILL_FIRE_mesg_put = EN_mesg_put ;

  // submodule bsEnqF
  FIFO2 #(.width(32'd133), .guarded(32'd1)) bsEnqF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(bsEnqF_D_IN),
						   .ENQ(bsEnqF_ENQ),
						   .DEQ(bsEnqF_DEQ),
						   .CLR(bsEnqF_CLR),
						   .D_OUT(bsEnqF_D_OUT),
						   .FULL_N(bsEnqF_FULL_N),
						   .EMPTY_N(bsEnqF_EMPTY_N));

  // submodule datagramEgressF
  FIFO2 #(.width(32'd134), .guarded(32'd1)) datagramEgressF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(datagramEgressF_D_IN),
							    .ENQ(datagramEgressF_ENQ),
							    .DEQ(datagramEgressF_DEQ),
							    .CLR(datagramEgressF_CLR),
							    .D_OUT(datagramEgressF_D_OUT),
							    .FULL_N(datagramEgressF_FULL_N),
							    .EMPTY_N(datagramEgressF_EMPTY_N));

  // submodule fcF
  FIFO2 #(.width(32'd16), .guarded(32'd1)) fcF(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(fcF_D_IN),
					       .ENQ(fcF_ENQ),
					       .DEQ(fcF_DEQ),
					       .CLR(fcF_CLR),
					       .D_OUT(fcF_D_OUT),
					       .FULL_N(fcF_FULL_N),
					       .EMPTY_N(fcF_EMPTY_N));

  // submodule mesgIngressF
  FIFO2 #(.width(32'd129), .guarded(32'd1)) mesgIngressF(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(mesgIngressF_D_IN),
							 .ENQ(mesgIngressF_ENQ),
							 .DEQ(mesgIngressF_DEQ),
							 .CLR(mesgIngressF_CLR),
							 .D_OUT(mesgIngressF_D_OUT),
							 .FULL_N(mesgIngressF_FULL_N),
							 .EMPTY_N(mesgIngressF_EMPTY_N));

  // rule RL_genFH
  assign CAN_FIRE_RL_genFH = mesgIngressF_EMPTY_N && !fhValid ;
  assign WILL_FIRE_RL_genFH = CAN_FIRE_RL_genFH ;

  // rule RL_enqFH
  assign CAN_FIRE_RL_enqFH = bsEnqF_FULL_N && fhValid && fcs == 2'd0 ;
  assign WILL_FIRE_RL_enqFH = CAN_FIRE_RL_enqFH ;

  // rule RL_genMH
  assign CAN_FIRE_RL_genMH = mesgIngressF_EMPTY_N && !mhValid && fcs == 2'd1 ;
  assign WILL_FIRE_RL_genMH = CAN_FIRE_RL_genMH ;

  // rule RL_enqMH
  assign CAN_FIRE_RL_enqMH = bsEnqF_FULL_N && mhValid && fcs == 2'd1 ;
  assign WILL_FIRE_RL_enqMH = CAN_FIRE_RL_enqMH ;

  // rule RL_enqMD
  assign CAN_FIRE_RL_enqMD =
	     mesgIngressF_EMPTY_N && bsEnqF_FULL_N &&
	     NOT_madeMeta_20_84_OR_NOT_bytesRemainMD_85_MIN_ETC___d197 &&
	     fcs == 2'd2 ;
  assign WILL_FIRE_RL_enqMD = CAN_FIRE_RL_enqMD ;

  // rule RL_enqByteShifter
  assign CAN_FIRE_RL_enqByteShifter =
	     byteShifter_num_empty != 6'd0 && bsEnqF_EMPTY_N &&
	     byteShifter_num_empty >= { 1'd0, bsEnqF_D_OUT[132:128] } ;
  assign WILL_FIRE_RL_enqByteShifter = CAN_FIRE_RL_enqByteShifter ;

  // rule RL_frameSourceComplete
  assign CAN_FIRE_RL_frameSourceComplete =
	     fcF_EMPTY_N && bytesToDeq == 16'd0 ;
  assign WILL_FIRE_RL_frameSourceComplete = CAN_FIRE_RL_frameSourceComplete ;

  // rule RL_frameSourcePump
  assign CAN_FIRE_RL_frameSourcePump =
	     byteShifter_num_full != 6'd0 && datagramEgressF_FULL_N &&
	     (byteShifter_num_full >= 6'd16 || eof) ;
  assign WILL_FIRE_RL_frameSourcePump =
	     CAN_FIRE_RL_frameSourcePump &&
	     !WILL_FIRE_RL_frameSourceComplete ;

  // rule RL_byteShifter_update
  assign CAN_FIRE_RL_byteShifter_update = 1'd1 ;
  assign WILL_FIRE_RL_byteShifter_update = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_bytesToDeq_write_1__SEL_1 = WILL_FIRE_RL_frameSourcePump && eof ;
  assign MUX_fcs_write_1__SEL_1 = WILL_FIRE_RL_enqMH && mhPhase ;
  assign MUX_bsEnqF_enq_1__VAL_1 =
	     { 5'd10,
	       fh[55:0],
	       fh[15:8],
	       fh[23:16],
	       fh[31:24],
	       fh[39:32],
	       fh[47:40],
	       fh[55:48],
	       fh[63:56],
	       fh[71:64],
	       fh[79:72] } ;
  assign MUX_bsEnqF_enq_1__VAL_2 =
	     { 37'h0CAAAAAAAA,
	       mhPhase ? mh[7:0] : mh[103:96],
	       mhPhase ? mh[15:8] : mh[111:104],
	       mhPhase ? mh[23:16] : mh[119:112],
	       mhPhase ? mh[31:24] : mh[127:120],
	       mhPhase ? mh[39:32] : mh[135:128],
	       mhPhase ? mh[47:40] : mh[143:136],
	       mhPhase ? mh[55:48] : mh[151:144],
	       mhPhase ? mh[63:56] : mh[159:152],
	       mhPhase ? mh[71:64] : mh[167:160],
	       mhPhase ? mh[79:72] : mh[175:168],
	       mhPhase ? mh[87:80] : mh[183:176],
	       mhPhase ? mh[95:88] : mh[191:184] } ;
  assign MUX_bsEnqF_enq_1__VAL_3 =
	     { IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187[4:0],
	       mesgIngressF_D_OUT[127:64],
	       madeMeta ? mesgIngressF_D_OUT[63:56] : 8'd1,
	       madeMeta ? mesgIngressF_D_OUT[55:48] : 8'd0,
	       madeMeta ? mesgIngressF_D_OUT[47:40] : 8'd0,
	       madeMeta ? mesgIngressF_D_OUT[39:32] : mesgIngressF_D_OUT[7:0],
	       madeMeta ?
		 mesgIngressF_D_OUT[31:24] :
		 mesgIngressFD_OUT_BITS_39_TO_8__q1[7:0],
	       madeMeta ?
		 mesgIngressF_D_OUT[23:16] :
		 mesgIngressFD_OUT_BITS_39_TO_8__q1[15:8],
	       madeMeta ?
		 mesgIngressF_D_OUT[15:8] :
		 mesgIngressFD_OUT_BITS_39_TO_8__q1[23:16],
	       madeMeta ?
		 mesgIngressF_D_OUT[7:0] :
		 mesgIngressFD_OUT_BITS_39_TO_8__q1[31:24] } ;
  assign MUX_bytesInFrame_write_1__VAL_1 = bytesInFrame + 16'd10 ;
  assign MUX_bytesInFrame_write_1__VAL_2 = bytesInFrame + 16'd12 ;
  assign MUX_bytesInFrame_write_1__VAL_3 =
	     (madeMeta &&
	      bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 ==
	      16'd0 ||
	      mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ?
	       16'd0 :
	       bytesInFrame +
	       { 10'd0,
		 IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187[5:0] } ;
  assign MUX_bytesRemainMD_write_1__VAL_2 = madeMeta ? mesgDataLen : 16'd8 ;
  assign MUX_fcs_write_1__VAL_2 =
	     madeMeta ?
	       ((bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 ==
		 16'd0 ||
		 mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ?
		  2'd0 :
		  2'd2) :
	       ((mesgDataLen == 16'd0) ? 2'd0 : 2'd1) ;

  // inlined wires
  assign byteShifter_delta_deq_wget =
	     eof ? bytesToDeq_76_MINUS_bytesDeqd_94___d295[4:0] : 5'd16 ;

  // register byteOut
  assign byteOut_D_IN = 8'h0 ;
  assign byteOut_EN = 1'b0 ;

  // register byteShifter_num_empty
  assign byteShifter_num_empty_D_IN =
	     byteShifter_num_empty +
	     { 1'd0,
	       IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 } -
	     { 1'd0,
	       IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 } ;
  assign byteShifter_num_empty_EN = 1'd1 ;

  // register byteShifter_num_full
  assign byteShifter_num_full_D_IN =
	     byteShifter_num_full +
	     { 1'd0,
	       IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 } -
	     { 1'd0,
	       IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 } ;
  assign byteShifter_num_full_EN = 1'd1 ;

  // register byteShifter_vec
  assign byteShifter_vec_D_IN =
	     { (CAN_FIRE_RL_enqByteShifter ?
		  _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64[383:8] :
		  376'd0) |
	       byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69[383:8],
	       (CAN_FIRE_RL_enqByteShifter ?
		  _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64[7:0] :
		  8'd0) |
	       byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69[7:0] } ;
  assign byteShifter_vec_EN = 1'd1 ;

  // register bytesDeqd
  assign bytesDeqd_D_IN = eof ? 16'd0 : bytesDeqd + 16'd16 ;
  assign bytesDeqd_EN = WILL_FIRE_RL_frameSourcePump ;

  // register bytesInFrame
  always@(WILL_FIRE_RL_enqFH or
	  MUX_bytesInFrame_write_1__VAL_1 or
	  WILL_FIRE_RL_enqMH or
	  MUX_bytesInFrame_write_1__VAL_2 or
	  WILL_FIRE_RL_enqMD or MUX_bytesInFrame_write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_enqFH: bytesInFrame_D_IN = MUX_bytesInFrame_write_1__VAL_1;
      WILL_FIRE_RL_enqMH: bytesInFrame_D_IN = MUX_bytesInFrame_write_1__VAL_2;
      WILL_FIRE_RL_enqMD: bytesInFrame_D_IN = MUX_bytesInFrame_write_1__VAL_3;
      default: bytesInFrame_D_IN =
		   16'b1010101010101010 /* unspecified value */ ;
    endcase
  end
  assign bytesInFrame_EN =
	     WILL_FIRE_RL_enqFH || WILL_FIRE_RL_enqMH || WILL_FIRE_RL_enqMD ;

  // register bytesRemainMD
  assign bytesRemainMD_D_IN =
	     WILL_FIRE_RL_enqMD ?
	       bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 :
	       MUX_bytesRemainMD_write_1__VAL_2 ;
  assign bytesRemainMD_EN = WILL_FIRE_RL_enqMD || WILL_FIRE_RL_genMH ;

  // register bytesToDeq
  assign bytesToDeq_D_IN = MUX_bytesToDeq_write_1__SEL_1 ? 16'd0 : fcF_D_OUT ;
  assign bytesToDeq_EN =
	     WILL_FIRE_RL_frameSourcePump && eof ||
	     WILL_FIRE_RL_frameSourceComplete ;

  // register bytesToEnqR
  assign bytesToEnqR_D_IN = 16'h0 ;
  assign bytesToEnqR_EN = 1'b0 ;

  // register bytesValid
  assign bytesValid_D_IN = !MUX_bytesToDeq_write_1__SEL_1 ;
  assign bytesValid_EN =
	     WILL_FIRE_RL_frameSourcePump && eof ||
	     WILL_FIRE_RL_frameSourceComplete ;

  // register eof
  assign eof_D_IN =
	     bytesValid &&
	     bytesToDeq_76_MINUS_bytesDeqd_94___d295 <= 16'd32 &&
	     !eof ;
  assign eof_EN = WILL_FIRE_RL_frameSourcePump ;

  // register fcs
  always@(MUX_fcs_write_1__SEL_1 or
	  WILL_FIRE_RL_enqMD or MUX_fcs_write_1__VAL_2 or WILL_FIRE_RL_enqFH)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fcs_write_1__SEL_1: fcs_D_IN = 2'd2;
      WILL_FIRE_RL_enqMD: fcs_D_IN = MUX_fcs_write_1__VAL_2;
      WILL_FIRE_RL_enqFH: fcs_D_IN = 2'd1;
      default: fcs_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fcs_EN =
	     WILL_FIRE_RL_enqMH && mhPhase || WILL_FIRE_RL_enqMD ||
	     WILL_FIRE_RL_enqFH ;

  // register fh
  assign fh_D_IN = { 32'd541200450, fh[47:32] + 16'd2, 24'd0, x_f__h48853 } ;
  assign fh_EN = CAN_FIRE_RL_genFH ;

  // register fhValid
  assign fhValid_D_IN = !WILL_FIRE_RL_enqFH ;
  assign fhValid_EN = WILL_FIRE_RL_enqFH || WILL_FIRE_RL_genFH ;

  // register frameCompCnt
  assign frameCompCnt_D_IN = frameCompCnt + 16'd1 ;
  assign frameCompCnt_EN =
	     WILL_FIRE_RL_enqMD &&
	     (madeMeta &&
	      bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 ==
	      16'd0 ||
	      mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ;

  // register frameSrcCnt
  assign frameSrcCnt_D_IN = frameSrcCnt + 16'd1 ;
  assign frameSrcCnt_EN = CAN_FIRE_RL_frameSourceComplete ;

  // register madeMeta
  assign madeMeta_D_IN =
	     (!madeMeta ||
	      bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 !=
	      16'd0) &&
	     mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] != 16'd0 ;
  assign madeMeta_EN = CAN_FIRE_RL_enqMD ;

  // register mesgDataLen
  assign mesgDataLen_D_IN = mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] ;
  assign mesgDataLen_EN = WILL_FIRE_RL_enqMD || WILL_FIRE_RL_genMH ;

  // register mh
  assign mh_D_IN =
	     { madeMeta ? mh[191:160] : mh[191:160] + 32'd1,
	       64'hFEEDC0DECAFEBABE,
	       IF_IF_mesgIngressF_first__4_BIT_128_5_THEN_DON_ETC___d134 } ;
  assign mh_EN = CAN_FIRE_RL_genMH ;

  // register mhPhase
  assign mhPhase_D_IN = !mhPhase ;
  assign mhPhase_EN = CAN_FIRE_RL_enqMH ;

  // register mhValid
  assign mhValid_D_IN = !MUX_fcs_write_1__SEL_1 ;
  assign mhValid_EN = WILL_FIRE_RL_enqMH && mhPhase || WILL_FIRE_RL_genMH ;

  // submodule bsEnqF
  always@(WILL_FIRE_RL_enqFH or
	  MUX_bsEnqF_enq_1__VAL_1 or
	  WILL_FIRE_RL_enqMH or
	  MUX_bsEnqF_enq_1__VAL_2 or
	  WILL_FIRE_RL_enqMD or MUX_bsEnqF_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_enqFH: bsEnqF_D_IN = MUX_bsEnqF_enq_1__VAL_1;
      WILL_FIRE_RL_enqMH: bsEnqF_D_IN = MUX_bsEnqF_enq_1__VAL_2;
      WILL_FIRE_RL_enqMD: bsEnqF_D_IN = MUX_bsEnqF_enq_1__VAL_3;
      default: bsEnqF_D_IN =
		   133'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bsEnqF_ENQ =
	     WILL_FIRE_RL_enqFH || WILL_FIRE_RL_enqMH || WILL_FIRE_RL_enqMD ;
  assign bsEnqF_DEQ = CAN_FIRE_RL_enqByteShifter ;
  assign bsEnqF_CLR = 1'b0 ;

  // submodule datagramEgressF
  assign datagramEgressF_D_IN =
	     { byteShifter_vec[127:0],
	       eof ? bytesToDeq_76_MINUS_bytesDeqd_94___d295[4:0] : 5'd16,
	       eof } ;
  assign datagramEgressF_ENQ = WILL_FIRE_RL_frameSourcePump ;
  assign datagramEgressF_DEQ = EN_datagram_get ;
  assign datagramEgressF_CLR = 1'b0 ;

  // submodule fcF
  assign fcF_D_IN =
	     bytesInFrame +
	     { 10'd0,
	       IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187[5:0] } ;
  assign fcF_ENQ =
	     WILL_FIRE_RL_enqMD &&
	     (madeMeta &&
	      bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 ==
	      16'd0 ||
	      mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ;
  assign fcF_DEQ = CAN_FIRE_RL_frameSourceComplete ;
  assign fcF_CLR = 1'b0 ;

  // submodule mesgIngressF
  assign mesgIngressF_D_IN = mesg_put ;
  assign mesgIngressF_ENQ = EN_mesg_put ;
  assign mesgIngressF_DEQ = CAN_FIRE_RL_enqMD ;
  assign mesgIngressF_CLR = 1'b0 ;

  // remaining internal signals
  assign IF_IF_mesgIngressF_first__4_BIT_128_5_THEN_DON_ETC___d134 =
	     { (mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ?
		 16'd1 :
		 16'd2,
	       madeMeta ? 16'd0 : 16'd1,
	       32'hBEEFF00D,
	       madeMeta ? mesgDataLen : 16'd8,
	       x__h52612,
	       x__h52616 } ;
  assign IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 =
	     WILL_FIRE_RL_frameSourcePump ?
	       byteShifter_delta_deq_wget :
	       5'd0 ;
  assign IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 =
	     CAN_FIRE_RL_enqByteShifter ? bsEnqF_D_OUT[132:128] : 5'd0 ;
  assign IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187 =
	     (bytesRemainMD <= 16'd16) ? bytesRemainMD : 16'd16 ;
  assign NOT_madeMeta_20_84_OR_NOT_bytesRemainMD_85_MIN_ETC___d197 =
	     (!madeMeta ||
	      bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 !=
	      16'd0) &&
	     mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] != 16'd0 ||
	     fcF_FULL_N ;
  assign _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64 =
	     { 256'd0, x__h16603 } << x__h21332 ;
  assign bsEnqFD_OUT_BITS_127_TO_0__q2 = bsEnqF_D_OUT[127:0] ;
  assign byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69 =
	     byteShifter_vec >> x__h39601 ;
  assign bytesRemainMD_85_MINUS_0_CONCAT_IF_bytesRemain_ETC___d190 =
	     bytesRemainMD -
	     { 10'd0,
	       IF_bytesRemainMD_85_ULE_16_86_THEN_bytesRemain_ETC___d187[5:0] } ;
  assign bytesToDeq_76_MINUS_bytesDeqd_94___d295 = bytesToDeq - bytesDeqd ;
  assign mesgIngressFD_OUT_BITS_39_TO_8__q1 = mesgIngressF_D_OUT[39:8] ;
  assign x__h16603 =
	     { bsEnqFD_OUT_BITS_127_TO_0__q2[127:8] &
	       { (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd15) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd14) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd13) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd12) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd11) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd10) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd9) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd8) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd7) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd6) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd5) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd4) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd3) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd2) ?
		   8'd0 :
		   8'd255,
		 (IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 <=
		  5'd1) ?
		   8'd0 :
		   8'd255 },
	       bsEnqFD_OUT_BITS_127_TO_0__q2[7:0] &
	       ((IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 ==
		 5'd0) ?
		  8'd0 :
		  8'd255) } ;
  assign x__h21332 =
	     { byteShifter_num_full -
	       { 1'd0,
		 IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 },
	       3'd0 } ;
  assign x__h39601 =
	     { IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9,
	       3'd0 } ;
  assign x__h52612 = madeMeta ? 8'd0 : 8'd1 ;
  assign x__h52616 =
	     (madeMeta || mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ?
	       8'd0 :
	       8'd1 ;
  assign x_f__h48853 =
	     (mesgIngressFD_OUT_BITS_39_TO_8__q1[15:0] == 16'd0) ?
	       8'h0 :
	       8'h01 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        byteShifter_num_empty <= `BSV_ASSIGNMENT_DELAY 6'd48;
	byteShifter_num_full <= `BSV_ASSIGNMENT_DELAY 6'd0;
	byteShifter_vec <= `BSV_ASSIGNMENT_DELAY 384'd0;
	bytesDeqd <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesInFrame <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesRemainMD <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesToDeq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesToEnqR <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesValid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	eof <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fcs <= `BSV_ASSIGNMENT_DELAY 2'd0;
	fh <= `BSV_ASSIGNMENT_DELAY 80'd0;
	fhValid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	frameCompCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	frameSrcCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	madeMeta <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mh <= `BSV_ASSIGNMENT_DELAY 192'd0;
	mhPhase <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mhValid <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (byteShifter_num_empty_EN)
	  byteShifter_num_empty <= `BSV_ASSIGNMENT_DELAY
	      byteShifter_num_empty_D_IN;
	if (byteShifter_num_full_EN)
	  byteShifter_num_full <= `BSV_ASSIGNMENT_DELAY
	      byteShifter_num_full_D_IN;
	if (byteShifter_vec_EN)
	  byteShifter_vec <= `BSV_ASSIGNMENT_DELAY byteShifter_vec_D_IN;
	if (bytesDeqd_EN) bytesDeqd <= `BSV_ASSIGNMENT_DELAY bytesDeqd_D_IN;
	if (bytesInFrame_EN)
	  bytesInFrame <= `BSV_ASSIGNMENT_DELAY bytesInFrame_D_IN;
	if (bytesRemainMD_EN)
	  bytesRemainMD <= `BSV_ASSIGNMENT_DELAY bytesRemainMD_D_IN;
	if (bytesToDeq_EN)
	  bytesToDeq <= `BSV_ASSIGNMENT_DELAY bytesToDeq_D_IN;
	if (bytesToEnqR_EN)
	  bytesToEnqR <= `BSV_ASSIGNMENT_DELAY bytesToEnqR_D_IN;
	if (bytesValid_EN)
	  bytesValid <= `BSV_ASSIGNMENT_DELAY bytesValid_D_IN;
	if (eof_EN) eof <= `BSV_ASSIGNMENT_DELAY eof_D_IN;
	if (fcs_EN) fcs <= `BSV_ASSIGNMENT_DELAY fcs_D_IN;
	if (fh_EN) fh <= `BSV_ASSIGNMENT_DELAY fh_D_IN;
	if (fhValid_EN) fhValid <= `BSV_ASSIGNMENT_DELAY fhValid_D_IN;
	if (frameCompCnt_EN)
	  frameCompCnt <= `BSV_ASSIGNMENT_DELAY frameCompCnt_D_IN;
	if (frameSrcCnt_EN)
	  frameSrcCnt <= `BSV_ASSIGNMENT_DELAY frameSrcCnt_D_IN;
	if (madeMeta_EN) madeMeta <= `BSV_ASSIGNMENT_DELAY madeMeta_D_IN;
	if (mh_EN) mh <= `BSV_ASSIGNMENT_DELAY mh_D_IN;
	if (mhPhase_EN) mhPhase <= `BSV_ASSIGNMENT_DELAY mhPhase_D_IN;
	if (mhValid_EN) mhValid <= `BSV_ASSIGNMENT_DELAY mhValid_D_IN;
      end
    if (byteOut_EN) byteOut <= `BSV_ASSIGNMENT_DELAY byteOut_D_IN;
    if (mesgDataLen_EN) mesgDataLen <= `BSV_ASSIGNMENT_DELAY mesgDataLen_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    byteOut = 8'hAA;
    byteShifter_num_empty = 6'h2A;
    byteShifter_num_full = 6'h2A;
    byteShifter_vec =
	384'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    bytesDeqd = 16'hAAAA;
    bytesInFrame = 16'hAAAA;
    bytesRemainMD = 16'hAAAA;
    bytesToDeq = 16'hAAAA;
    bytesToEnqR = 16'hAAAA;
    bytesValid = 1'h0;
    eof = 1'h0;
    fcs = 2'h2;
    fh = 80'hAAAAAAAAAAAAAAAAAAAA;
    fhValid = 1'h0;
    frameCompCnt = 16'hAAAA;
    frameSrcCnt = 16'hAAAA;
    madeMeta = 1'h0;
    mesgDataLen = 16'hAAAA;
    mh = 192'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    mhPhase = 1'h0;
    mhValid = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_frameSourceComplete)
	begin
	  v__h67262 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_frameSourceComplete)
	$display("[%0d] Frame Source token %0d dequeued",
		 v__h67262,
		 $unsigned(frameSrcCnt));
  end
  // synopsys translate_on
endmodule  // mkSenderDM1

