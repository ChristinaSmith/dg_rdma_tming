//
// Generated by Bluespec Compiler, version 2013.01.beta5 (build 30325, 2013-01-23)
//
// On Wed Jun 26 17:46:06 CDT 2013
//
// Method conflict info:
// Method: datagram_put
// Conflict-free: mesg_get
// Conflicts: datagram_put
//
// Method: mesg_get
// Conflict-free: datagram_put
// Conflicts: mesg_get
//
//
// Ports:
// Name                         I/O  size props
// RDY_datagram_put               O     1 reg
// mesg_get                       O   129 reg
// RDY_mesg_get                   O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// datagram_put                   I   134 reg
// EN_datagram_put                I     1
// EN_mesg_get                    I     1
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

module mkReceiver(CLK,
		  RST_N,

		  datagram_put,
		  EN_datagram_put,
		  RDY_datagram_put,

		  EN_mesg_get,
		  mesg_get,
		  RDY_mesg_get);
  input  CLK;
  input  RST_N;

  // action method datagram_put
  input  [133 : 0] datagram_put;
  input  EN_datagram_put;
  output RDY_datagram_put;

  // actionvalue method mesg_get
  input  EN_mesg_get;
  output [128 : 0] mesg_get;
  output RDY_mesg_get;

  // signals for module outputs
  wire [128 : 0] mesg_get;
  wire RDY_datagram_put, RDY_mesg_get;

  // inlined wires
  reg [4 : 0] byteShifter_delta_deq_wget;
  wire [127 : 0] byteShifter_new_data_wget;
  wire byteShifter_delta_deq_whas, byteShifter_delta_enq_whas;

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

  // register bytesToDeq
  reg [15 : 0] bytesToDeq;
  wire [15 : 0] bytesToDeq_D_IN;
  wire bytesToDeq_EN;

  // register bytesValid
  reg bytesValid;
  wire bytesValid_D_IN, bytesValid_EN;

  // register fds
  reg [1 : 0] fds;
  reg [1 : 0] fds_D_IN;
  wire fds_EN;

  // register fh
  reg [79 : 0] fh;
  wire [79 : 0] fh_D_IN;
  wire fh_EN;

  // register madeMeta
  reg madeMeta;
  wire madeMeta_D_IN, madeMeta_EN;

  // register mh
  reg [191 : 0] mh;
  wire [191 : 0] mh_D_IN;
  wire mh_EN;

  // register mhFirst
  reg [95 : 0] mhFirst;
  wire [95 : 0] mhFirst_D_IN;
  wire mhFirst_EN;

  // register mhPhase
  reg mhPhase;
  wire mhPhase_D_IN, mhPhase_EN;

  // ports of submodule datagramIngressF
  wire [133 : 0] datagramIngressF_D_IN, datagramIngressF_D_OUT;
  wire datagramIngressF_CLR,
       datagramIngressF_DEQ,
       datagramIngressF_EMPTY_N,
       datagramIngressF_ENQ,
       datagramIngressF_FULL_N;

  // ports of submodule mesgEgressF
  wire [128 : 0] mesgEgressF_D_IN, mesgEgressF_D_OUT;
  wire mesgEgressF_CLR,
       mesgEgressF_DEQ,
       mesgEgressF_EMPTY_N,
       mesgEgressF_ENQ,
       mesgEgressF_FULL_N;

  // ports of submodule nbValF
  wire [4 : 0] nbValF_D_IN;
  wire nbValF_CLR, nbValF_DEQ, nbValF_EMPTY_N, nbValF_ENQ, nbValF_FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_byteShifter_update,
       CAN_FIRE_RL_loadBS,
       CAN_FIRE_RL_rmFrmHead,
       CAN_FIRE_RL_rmMsgData16,
       CAN_FIRE_RL_rmMsgDataLT16,
       CAN_FIRE_RL_rmMsgHead,
       CAN_FIRE_RL_rmMsgMeta,
       CAN_FIRE_datagram_put,
       CAN_FIRE_mesg_get,
       WILL_FIRE_RL_byteShifter_update,
       WILL_FIRE_RL_loadBS,
       WILL_FIRE_RL_rmFrmHead,
       WILL_FIRE_RL_rmMsgData16,
       WILL_FIRE_RL_rmMsgDataLT16,
       WILL_FIRE_RL_rmMsgHead,
       WILL_FIRE_RL_rmMsgMeta,
       WILL_FIRE_datagram_put,
       WILL_FIRE_mesg_get;

  // inputs to muxes for submodule ports
  wire [128 : 0] MUX_mesgEgressF_enq_1__VAL_1, MUX_mesgEgressF_enq_1__VAL_2;
  wire [15 : 0] MUX_bytesToDeq_write_1__VAL_1, MUX_bytesToDeq_write_1__VAL_2;
  wire [1 : 0] MUX_fds_write_1__VAL_2, MUX_fds_write_1__VAL_3;
  wire MUX_bytesToDeq_write_1__PSEL_1,
       MUX_bytesToDeq_write_1__SEL_1,
       MUX_bytesToDeq_write_1__SEL_2,
       MUX_bytesValid_write_1__SEL_2,
       MUX_bytesValid_write_1__SEL_3,
       MUX_mesgEgressF_enq_1__SEL_1,
       MUX_mesgEgressF_enq_1__SEL_2,
       MUX_mhPhase_write_1__VAL_1;

  // remaining internal signals
  wire [383 : 0] _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64,
		 byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69;
  wire [127 : 0] x__h16339;
  wire [31 : 0] x_fv__h56211;
  wire [15 : 0] x__h51324, x__h52524;
  wire [8 : 0] x__h21068;
  wire [7 : 0] x__h39337;
  wire [4 : 0] IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9,
	       IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4;
  wire bytesToDeq_62_ULT_16___d187,
       mesgEgressF_i_notFull__53_AND_NOT_byteShifter__ETC___d159;

  // action method datagram_put
  assign RDY_datagram_put = datagramIngressF_FULL_N ;
  assign CAN_FIRE_datagram_put = datagramIngressF_FULL_N ;
  assign WILL_FIRE_datagram_put = EN_datagram_put ;

  // actionvalue method mesg_get
  assign mesg_get = mesgEgressF_D_OUT ;
  assign RDY_mesg_get = mesgEgressF_EMPTY_N ;
  assign CAN_FIRE_mesg_get = mesgEgressF_EMPTY_N ;
  assign WILL_FIRE_mesg_get = EN_mesg_get ;

  // submodule datagramIngressF
  FIFO2 #(.width(32'd134), .guarded(32'd1)) datagramIngressF(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(datagramIngressF_D_IN),
							     .ENQ(datagramIngressF_ENQ),
							     .DEQ(datagramIngressF_DEQ),
							     .CLR(datagramIngressF_CLR),
							     .D_OUT(datagramIngressF_D_OUT),
							     .FULL_N(datagramIngressF_FULL_N),
							     .EMPTY_N(datagramIngressF_EMPTY_N));

  // submodule mesgEgressF
  FIFO2 #(.width(32'd129), .guarded(32'd1)) mesgEgressF(.RST(RST_N),
							.CLK(CLK),
							.D_IN(mesgEgressF_D_IN),
							.ENQ(mesgEgressF_ENQ),
							.DEQ(mesgEgressF_DEQ),
							.CLR(mesgEgressF_CLR),
							.D_OUT(mesgEgressF_D_OUT),
							.FULL_N(mesgEgressF_FULL_N),
							.EMPTY_N(mesgEgressF_EMPTY_N));

  // submodule nbValF
  FIFO2 #(.width(32'd5), .guarded(32'd1)) nbValF(.RST(RST_N),
						 .CLK(CLK),
						 .D_IN(nbValF_D_IN),
						 .ENQ(nbValF_ENQ),
						 .DEQ(nbValF_DEQ),
						 .CLR(nbValF_CLR),
						 .D_OUT(),
						 .FULL_N(nbValF_FULL_N),
						 .EMPTY_N(nbValF_EMPTY_N));

  // rule RL_loadBS
  assign CAN_FIRE_RL_loadBS = byteShifter_delta_enq_whas ;
  assign WILL_FIRE_RL_loadBS = byteShifter_delta_enq_whas ;

  // rule RL_rmFrmHead
  assign CAN_FIRE_RL_rmFrmHead =
	     fds == 2'd0 && byteShifter_num_full >= 6'd10 ;
  assign WILL_FIRE_RL_rmFrmHead = CAN_FIRE_RL_rmFrmHead ;

  // rule RL_rmMsgHead
  assign CAN_FIRE_RL_rmMsgHead = MUX_bytesToDeq_write_1__PSEL_1 ;
  assign WILL_FIRE_RL_rmMsgHead = MUX_bytesToDeq_write_1__PSEL_1 ;

  // rule RL_rmMsgMeta
  assign CAN_FIRE_RL_rmMsgMeta = MUX_mesgEgressF_enq_1__SEL_2 ;
  assign WILL_FIRE_RL_rmMsgMeta = MUX_mesgEgressF_enq_1__SEL_2 ;

  // rule RL_rmMsgData16
  assign CAN_FIRE_RL_rmMsgData16 = MUX_bytesToDeq_write_1__SEL_2 ;
  assign WILL_FIRE_RL_rmMsgData16 = MUX_bytesToDeq_write_1__SEL_2 ;

  // rule RL_rmMsgDataLT16
  assign CAN_FIRE_RL_rmMsgDataLT16 =
	     byteShifter_num_full != 6'd0 && mesgEgressF_FULL_N &&
	     nbValF_EMPTY_N &&
	     fds == 2'd2 &&
	     byteShifter_num_full >= bytesToDeq[5:0] &&
	     bytesValid &&
	     bytesToDeq_62_ULT_16___d187 &&
	     bytesToDeq != 16'd0 ;
  assign WILL_FIRE_RL_rmMsgDataLT16 =
	     CAN_FIRE_RL_rmMsgDataLT16 && !WILL_FIRE_RL_rmMsgMeta ;

  // rule RL_byteShifter_update
  assign CAN_FIRE_RL_byteShifter_update = 1'd1 ;
  assign WILL_FIRE_RL_byteShifter_update = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_bytesToDeq_write_1__PSEL_1 =
	     fds == 2'd1 && byteShifter_num_full >= 6'd12 ;
  assign MUX_bytesToDeq_write_1__SEL_1 = WILL_FIRE_RL_rmMsgHead && mhPhase ;
  assign MUX_bytesToDeq_write_1__SEL_2 =
	     byteShifter_num_full != 6'd0 && mesgEgressF_FULL_N &&
	     (bytesToDeq != 16'd16 || nbValF_EMPTY_N) &&
	     fds == 2'd2 &&
	     byteShifter_num_full >= 6'd16 &&
	     bytesValid &&
	     !bytesToDeq_62_ULT_16___d187 ;
  assign MUX_bytesValid_write_1__SEL_2 =
	     WILL_FIRE_RL_rmMsgData16 && bytesToDeq == 16'd16 ;
  assign MUX_bytesValid_write_1__SEL_3 =
	     WILL_FIRE_RL_rmMsgDataLT16 || WILL_FIRE_RL_rmMsgMeta ;
  assign MUX_mesgEgressF_enq_1__SEL_1 =
	     WILL_FIRE_RL_rmMsgDataLT16 || WILL_FIRE_RL_rmMsgData16 ;
  assign MUX_mesgEgressF_enq_1__SEL_2 =
	     byteShifter_num_full != 6'd0 &&
	     mesgEgressF_i_notFull__53_AND_NOT_byteShifter__ETC___d159 &&
	     fds == 2'd2 &&
	     byteShifter_num_full >= bytesToDeq[5:0] &&
	     bytesToDeq == 16'd8 &&
	     bytesValid &&
	     !madeMeta ;
  assign MUX_bytesToDeq_write_1__VAL_1 =
	     { byteShifter_vec[71:64], byteShifter_vec[79:72] } ;
  assign MUX_bytesToDeq_write_1__VAL_2 = bytesToDeq - 16'd16 ;
  assign MUX_fds_write_1__VAL_2 = mhPhase ? 2'd2 : 2'd1 ;
  assign MUX_fds_write_1__VAL_3 =
	     ({ x__h51324, byteShifter_vec[23:16], byteShifter_vec[31:24] } ==
	      32'd0) ?
	       2'd0 :
	       2'd1 ;
  assign MUX_mesgEgressF_enq_1__VAL_1 = { 1'd1, byteShifter_vec[127:0] } ;
  assign MUX_mesgEgressF_enq_1__VAL_2 =
	     { 89'h0AAAAAAAAAAAAAAAAAAAAAA,
	       x__h51324,
	       byteShifter_vec[23:16],
	       byteShifter_vec[31:24],
	       byteShifter_vec[39:32] } ;
  assign MUX_mhPhase_write_1__VAL_1 = mhPhase + 1'd1 ;

  // inlined wires
  assign byteShifter_delta_enq_whas =
	     byteShifter_num_empty != 6'd0 && datagramIngressF_EMPTY_N &&
	     (!datagramIngressF_D_OUT[0] || nbValF_FULL_N) &&
	     byteShifter_num_empty >= { 1'd0, datagramIngressF_D_OUT[5:1] } ;
  always@(WILL_FIRE_RL_rmMsgDataLT16 or
	  bytesToDeq or
	  WILL_FIRE_RL_rmMsgMeta or
	  WILL_FIRE_RL_rmFrmHead or
	  WILL_FIRE_RL_rmMsgHead or WILL_FIRE_RL_rmMsgData16)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rmMsgDataLT16:
	  byteShifter_delta_deq_wget = bytesToDeq[4:0];
      WILL_FIRE_RL_rmMsgMeta: byteShifter_delta_deq_wget = 5'd8;
      WILL_FIRE_RL_rmFrmHead: byteShifter_delta_deq_wget = 5'd10;
      WILL_FIRE_RL_rmMsgHead: byteShifter_delta_deq_wget = 5'd12;
      WILL_FIRE_RL_rmMsgData16: byteShifter_delta_deq_wget = 5'd16;
      default: byteShifter_delta_deq_wget = 5'b01010 /* unspecified value */ ;
    endcase
  end
  assign byteShifter_delta_deq_whas =
	     WILL_FIRE_RL_rmMsgDataLT16 || WILL_FIRE_RL_rmMsgMeta ||
	     WILL_FIRE_RL_rmFrmHead ||
	     WILL_FIRE_RL_rmMsgHead ||
	     WILL_FIRE_RL_rmMsgData16 ;
  assign byteShifter_new_data_wget = datagramIngressF_D_OUT[133:6] ;

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
	     { (byteShifter_delta_enq_whas ?
		  _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64[383:8] :
		  376'd0) |
	       byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69[383:8],
	       (byteShifter_delta_enq_whas ?
		  _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64[7:0] :
		  8'd0) |
	       byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69[7:0] } ;
  assign byteShifter_vec_EN = 1'd1 ;

  // register bytesToDeq
  assign bytesToDeq_D_IN =
	     MUX_bytesToDeq_write_1__SEL_1 ?
	       MUX_bytesToDeq_write_1__VAL_1 :
	       MUX_bytesToDeq_write_1__VAL_2 ;
  assign bytesToDeq_EN =
	     WILL_FIRE_RL_rmMsgHead && mhPhase || WILL_FIRE_RL_rmMsgData16 ;

  // register bytesValid
  assign bytesValid_D_IN =
	     !MUX_bytesValid_write_1__SEL_2 &&
	     !MUX_bytesValid_write_1__SEL_3 ;
  assign bytesValid_EN =
	     WILL_FIRE_RL_rmMsgHead && mhPhase ||
	     WILL_FIRE_RL_rmMsgData16 && bytesToDeq == 16'd16 ||
	     WILL_FIRE_RL_rmMsgDataLT16 ||
	     WILL_FIRE_RL_rmMsgMeta ;

  // register fds
  always@(WILL_FIRE_RL_rmMsgHead or
	  MUX_fds_write_1__VAL_2 or
	  WILL_FIRE_RL_rmMsgMeta or
	  MUX_fds_write_1__VAL_3 or
	  MUX_bytesValid_write_1__SEL_2 or
	  WILL_FIRE_RL_rmMsgDataLT16 or WILL_FIRE_RL_rmFrmHead)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rmMsgHead: fds_D_IN = MUX_fds_write_1__VAL_2;
      WILL_FIRE_RL_rmMsgMeta: fds_D_IN = MUX_fds_write_1__VAL_3;
      MUX_bytesValid_write_1__SEL_2 || WILL_FIRE_RL_rmMsgDataLT16:
	  fds_D_IN = 2'd0;
      WILL_FIRE_RL_rmFrmHead: fds_D_IN = 2'd1;
      default: fds_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fds_EN =
	     WILL_FIRE_RL_rmMsgData16 && bytesToDeq == 16'd16 ||
	     WILL_FIRE_RL_rmMsgHead ||
	     WILL_FIRE_RL_rmMsgMeta ||
	     WILL_FIRE_RL_rmMsgDataLT16 ||
	     WILL_FIRE_RL_rmFrmHead ;

  // register fh
  assign fh_D_IN =
	     { x__h51324,
	       x__h52524,
	       byteShifter_vec[39:32],
	       byteShifter_vec[47:40],
	       byteShifter_vec[55:48],
	       byteShifter_vec[63:56],
	       byteShifter_vec[71:64],
	       byteShifter_vec[79:72] } ;
  assign fh_EN = fds == 2'd0 && byteShifter_num_full >= 6'd10 ;

  // register madeMeta
  assign madeMeta_D_IN = !WILL_FIRE_RL_rmFrmHead ;
  assign madeMeta_EN = WILL_FIRE_RL_rmFrmHead || WILL_FIRE_RL_rmMsgMeta ;

  // register mh
  assign mh_D_IN =
	     { mhFirst[7:0],
	       mhFirst[15:8],
	       mhFirst[23:16],
	       mhFirst[31:24],
	       mhFirst[39:32],
	       mhFirst[47:40],
	       mhFirst[55:48],
	       mhFirst[63:56],
	       x_fv__h56211,
	       x__h51324,
	       x__h52524,
	       byteShifter_vec[39:32],
	       byteShifter_vec[47:40],
	       byteShifter_vec[55:48],
	       byteShifter_vec[63:56],
	       byteShifter_vec[71:64],
	       byteShifter_vec[79:72],
	       byteShifter_vec[87:80],
	       byteShifter_vec[95:88] } ;
  assign mh_EN = MUX_bytesToDeq_write_1__SEL_1 ;

  // register mhFirst
  assign mhFirst_D_IN = byteShifter_vec[95:0] ;
  assign mhFirst_EN = WILL_FIRE_RL_rmMsgHead && !mhPhase ;

  // register mhPhase
  assign mhPhase_D_IN = WILL_FIRE_RL_rmMsgHead && MUX_mhPhase_write_1__VAL_1 ;
  assign mhPhase_EN = WILL_FIRE_RL_rmMsgHead || WILL_FIRE_RL_rmMsgMeta ;

  // submodule datagramIngressF
  assign datagramIngressF_D_IN = datagram_put ;
  assign datagramIngressF_ENQ = EN_datagram_put ;
  assign datagramIngressF_DEQ = byteShifter_delta_enq_whas ;
  assign datagramIngressF_CLR = 1'b0 ;

  // submodule mesgEgressF
  assign mesgEgressF_D_IN =
	     MUX_mesgEgressF_enq_1__SEL_1 ?
	       MUX_mesgEgressF_enq_1__VAL_1 :
	       MUX_mesgEgressF_enq_1__VAL_2 ;
  assign mesgEgressF_ENQ =
	     WILL_FIRE_RL_rmMsgDataLT16 || WILL_FIRE_RL_rmMsgData16 ||
	     WILL_FIRE_RL_rmMsgMeta ;
  assign mesgEgressF_DEQ = EN_mesg_get ;
  assign mesgEgressF_CLR = 1'b0 ;

  // submodule nbValF
  assign nbValF_D_IN = datagramIngressF_D_OUT[5:1] ;
  assign nbValF_ENQ = WILL_FIRE_RL_loadBS && datagramIngressF_D_OUT[0] ;
  assign nbValF_DEQ =
	     WILL_FIRE_RL_rmMsgMeta &&
	     { x__h51324, byteShifter_vec[23:16], byteShifter_vec[31:24] } ==
	     32'd0 ||
	     WILL_FIRE_RL_rmMsgData16 && bytesToDeq == 16'd16 ||
	     WILL_FIRE_RL_rmMsgDataLT16 ;
  assign nbValF_CLR = 1'b0 ;

  // remaining internal signals
  assign IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 =
	     byteShifter_delta_deq_whas ? byteShifter_delta_deq_wget : 5'd0 ;
  assign IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 =
	     byteShifter_delta_enq_whas ? datagramIngressF_D_OUT[5:1] : 5'd0 ;
  assign _0_CONCAT_byteShifter_new_data_wget__6_BITS_127_ETC___d64 =
	     { 256'd0, x__h16339 } << x__h21068 ;
  assign byteShifter_vec_7_SRL_IF_byteShifter_delta_deq_ETC___d69 =
	     byteShifter_vec >> x__h39337 ;
  assign bytesToDeq_62_ULT_16___d187 = bytesToDeq < 16'd16 ;
  assign mesgEgressF_i_notFull__53_AND_NOT_byteShifter__ETC___d159 =
	     mesgEgressF_FULL_N &&
	     ({ x__h51324, byteShifter_vec[23:16], byteShifter_vec[31:24] } !=
	      32'd0 ||
	      nbValF_EMPTY_N) ;
  assign x__h16339 =
	     { byteShifter_new_data_wget[127:8] &
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
	       byteShifter_new_data_wget[7:0] &
	       ((IF_byteShifter_delta_enq_whas_THEN_byteShifter_ETC___d4 ==
		 5'd0) ?
		  8'd0 :
		  8'd255) } ;
  assign x__h21068 =
	     { byteShifter_num_full -
	       { 1'd0,
		 IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9 },
	       3'd0 } ;
  assign x__h39337 =
	     { IF_byteShifter_delta_deq_whas_THEN_byteShifter_ETC___d9,
	       3'd0 } ;
  assign x__h51324 = { byteShifter_vec[7:0], byteShifter_vec[15:8] } ;
  assign x__h52524 = { byteShifter_vec[23:16], byteShifter_vec[31:24] } ;
  assign x_fv__h56211 =
	     { mhFirst[71:64],
	       mhFirst[79:72],
	       mhFirst[87:80],
	       mhFirst[95:88] } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        byteShifter_num_empty <= `BSV_ASSIGNMENT_DELAY 6'd48;
	byteShifter_num_full <= `BSV_ASSIGNMENT_DELAY 6'd0;
	byteShifter_vec <= `BSV_ASSIGNMENT_DELAY 384'd0;
	bytesToDeq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bytesValid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fds <= `BSV_ASSIGNMENT_DELAY 2'd0;
	fh <= `BSV_ASSIGNMENT_DELAY 80'd0;
	madeMeta <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mh <= `BSV_ASSIGNMENT_DELAY 192'd0;
	mhPhase <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
	if (bytesToDeq_EN)
	  bytesToDeq <= `BSV_ASSIGNMENT_DELAY bytesToDeq_D_IN;
	if (bytesValid_EN)
	  bytesValid <= `BSV_ASSIGNMENT_DELAY bytesValid_D_IN;
	if (fds_EN) fds <= `BSV_ASSIGNMENT_DELAY fds_D_IN;
	if (fh_EN) fh <= `BSV_ASSIGNMENT_DELAY fh_D_IN;
	if (madeMeta_EN) madeMeta <= `BSV_ASSIGNMENT_DELAY madeMeta_D_IN;
	if (mh_EN) mh <= `BSV_ASSIGNMENT_DELAY mh_D_IN;
	if (mhPhase_EN) mhPhase <= `BSV_ASSIGNMENT_DELAY mhPhase_D_IN;
      end
    if (mhFirst_EN) mhFirst <= `BSV_ASSIGNMENT_DELAY mhFirst_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    byteShifter_num_empty = 6'h2A;
    byteShifter_num_full = 6'h2A;
    byteShifter_vec =
	384'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    bytesToDeq = 16'hAAAA;
    bytesValid = 1'h0;
    fds = 2'h2;
    fh = 80'hAAAAAAAAAAAAAAAAAAAA;
    madeMeta = 1'h0;
    mh = 192'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    mhFirst = 96'hAAAAAAAAAAAAAAAAAAAAAAAA;
    mhPhase = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_loadBS && datagramIngressF_D_OUT[0])
	$display("Receiver");
  end
  // synopsys translate_on
endmodule  // mkReceiver
