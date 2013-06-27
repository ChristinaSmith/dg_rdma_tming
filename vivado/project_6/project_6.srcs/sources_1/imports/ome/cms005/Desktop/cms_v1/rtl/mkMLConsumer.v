//
// Generated by Bluespec Compiler, version 2013.01.beta5 (build 30325, 2013-01-23)
//
// On Sun Jun 16 19:22:29 CDT 2013
//
// Method conflict info:
// Method: mesgExpected_put
// Conflict-free: mesgReceived_put, incorrectCnt
// Conflicts: mesgExpected_put
//
// Method: mesgReceived_put
// Conflict-free: mesgExpected_put, incorrectCnt
// Conflicts: mesgReceived_put
//
// Method: incorrectCnt
// Conflict-free: mesgExpected_put, mesgReceived_put, incorrectCnt
//
//
// Ports:
// Name                         I/O  size props
// RDY_mesgExpected_put           O     1 reg
// RDY_mesgReceived_put           O     1 reg
// incorrectCnt                   O     4 reg
// RDY_incorrectCnt               O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// mesgExpected_put               I   129 reg
// mesgReceived_put               I   129 reg
// EN_mesgExpected_put            I     1
// EN_mesgReceived_put            I     1
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

module mkMLConsumer(CLK,
		    RST_N,

		    mesgExpected_put,
		    EN_mesgExpected_put,
		    RDY_mesgExpected_put,

		    mesgReceived_put,
		    EN_mesgReceived_put,
		    RDY_mesgReceived_put,

		    incorrectCnt,
		    RDY_incorrectCnt);
  input  CLK;
  input  RST_N;

  // action method mesgExpected_put
  input  [128 : 0] mesgExpected_put;
  input  EN_mesgExpected_put;
  output RDY_mesgExpected_put;

  // action method mesgReceived_put
  input  [128 : 0] mesgReceived_put;
  input  EN_mesgReceived_put;
  output RDY_mesgReceived_put;

  // value method incorrectCnt
  output [3 : 0] incorrectCnt;
  output RDY_incorrectCnt;

  // signals for module outputs
  wire [3 : 0] incorrectCnt;
  wire RDY_incorrectCnt, RDY_mesgExpected_put, RDY_mesgReceived_put;

  // register bytesRemain
  reg [32 : 0] bytesRemain;
  wire [32 : 0] bytesRemain_D_IN;
  wire bytesRemain_EN;

  // register cmpDataMatch
  reg cmpDataMatch;
  wire cmpDataMatch_D_IN, cmpDataMatch_EN;

  // register cmpMetaMatch
  reg cmpMetaMatch;
  wire cmpMetaMatch_D_IN, cmpMetaMatch_EN;

  // register correctData
  reg [31 : 0] correctData;
  wire [31 : 0] correctData_D_IN;
  wire correctData_EN;

  // register correctMeta
  reg [31 : 0] correctMeta;
  wire [31 : 0] correctMeta_D_IN;
  wire correctMeta_EN;

  // register incorrect
  reg [31 : 0] incorrect;
  wire [31 : 0] incorrect_D_IN;
  wire incorrect_EN;

  // register incorrectData
  reg [31 : 0] incorrectData;
  wire [31 : 0] incorrectData_D_IN;
  wire incorrectData_EN;

  // register incorrectMeta
  reg [31 : 0] incorrectMeta;
  wire [31 : 0] incorrectMeta_D_IN;
  wire incorrectMeta_EN;

  // register msgConsumeCnt
  reg [31 : 0] msgConsumeCnt;
  wire [31 : 0] msgConsumeCnt_D_IN;
  wire msgConsumeCnt_EN;

  // ports of submodule dataIngressExpF
  wire [127 : 0] dataIngressExpF_D_IN, dataIngressExpF_D_OUT;
  wire dataIngressExpF_CLR,
       dataIngressExpF_DEQ,
       dataIngressExpF_EMPTY_N,
       dataIngressExpF_ENQ,
       dataIngressExpF_FULL_N;

  // ports of submodule dataIngressRcvF
  wire [127 : 0] dataIngressRcvF_D_IN, dataIngressRcvF_D_OUT;
  wire dataIngressRcvF_CLR,
       dataIngressRcvF_DEQ,
       dataIngressRcvF_EMPTY_N,
       dataIngressRcvF_ENQ,
       dataIngressRcvF_FULL_N;

  // ports of submodule mesgIngressExpF
  wire [128 : 0] mesgIngressExpF_D_IN, mesgIngressExpF_D_OUT;
  wire mesgIngressExpF_CLR,
       mesgIngressExpF_DEQ,
       mesgIngressExpF_EMPTY_N,
       mesgIngressExpF_ENQ,
       mesgIngressExpF_FULL_N;

  // ports of submodule mesgIngressRcvF
  wire [128 : 0] mesgIngressRcvF_D_IN, mesgIngressRcvF_D_OUT;
  wire mesgIngressRcvF_CLR,
       mesgIngressRcvF_DEQ,
       mesgIngressRcvF_EMPTY_N,
       mesgIngressRcvF_ENQ,
       mesgIngressRcvF_FULL_N;

  // ports of submodule metaIngressExpF
  wire [39 : 0] metaIngressExpF_D_IN, metaIngressExpF_D_OUT;
  wire metaIngressExpF_CLR,
       metaIngressExpF_DEQ,
       metaIngressExpF_EMPTY_N,
       metaIngressExpF_ENQ,
       metaIngressExpF_FULL_N;

  // ports of submodule metaIngressRcvF
  wire [39 : 0] metaIngressRcvF_D_IN, metaIngressRcvF_D_OUT;
  wire metaIngressRcvF_CLR,
       metaIngressRcvF_DEQ,
       metaIngressRcvF_EMPTY_N,
       metaIngressRcvF_ENQ,
       metaIngressRcvF_FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_calcIncorrect,
       CAN_FIRE_RL_compareData,
       CAN_FIRE_RL_compareMeta,
       CAN_FIRE_RL_forkMesgExp,
       CAN_FIRE_RL_forkMesgRcv,
       CAN_FIRE_mesgExpected_put,
       CAN_FIRE_mesgReceived_put,
       WILL_FIRE_RL_calcIncorrect,
       WILL_FIRE_RL_compareData,
       WILL_FIRE_RL_compareMeta,
       WILL_FIRE_RL_forkMesgExp,
       WILL_FIRE_RL_forkMesgRcv,
       WILL_FIRE_mesgExpected_put,
       WILL_FIRE_mesgReceived_put;

  // inputs to muxes for submodule ports
  wire [32 : 0] MUX_bytesRemain_write_1__VAL_1,
		MUX_bytesRemain_write_1__VAL_2;
  wire MUX_bytesRemain_write_1__SEL_1, MUX_bytesRemain_write_1__SEL_2;

  // remaining internal signals
  reg [63 : 0] v__h13101, v__h16227, v__h19492, v__h7431, v__h7472;
  wire [31 : 0] bytesRemain_BITS_31_TO_0__q1;
  wire [7 : 0] x__h11048,
	       x__h11178,
	       x__h11308,
	       x__h11438,
	       x__h11568,
	       x__h11698,
	       x__h11828,
	       x__h11958,
	       x__h12088,
	       x__h12218,
	       x__h12348,
	       x__h12478,
	       x__h12608,
	       x__h12738,
	       x__h12868,
	       x__h9572,
	       y__h11049,
	       y__h11179,
	       y__h11309,
	       y__h11439,
	       y__h11569,
	       y__h11699,
	       y__h11829,
	       y__h11959,
	       y__h12089,
	       y__h12219,
	       y__h12349,
	       y__h12479,
	       y__h12609,
	       y__h12739,
	       y__h12869,
	       y__h9573;
  wire [4 : 0] IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66;
  wire IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d104,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d110,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d116,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d122,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d128,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d134,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d140,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d146,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d152,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d158,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d164,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d170,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d176,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d74,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d80,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d86,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d92,
       IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d98,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d105,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d111,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d117,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d123,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d129,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d135,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d141,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d147,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d153,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d159,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d75,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d81,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d87,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d93,
       IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d99,
       IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51,
       NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d221,
       NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d227,
       NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d230,
       NOT_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_ETC___d59,
       metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33,
       metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36;

  // action method mesgExpected_put
  assign RDY_mesgExpected_put = mesgIngressExpF_FULL_N ;
  assign CAN_FIRE_mesgExpected_put = mesgIngressExpF_FULL_N ;
  assign WILL_FIRE_mesgExpected_put = EN_mesgExpected_put ;

  // action method mesgReceived_put
  assign RDY_mesgReceived_put = mesgIngressRcvF_FULL_N ;
  assign CAN_FIRE_mesgReceived_put = mesgIngressRcvF_FULL_N ;
  assign WILL_FIRE_mesgReceived_put = EN_mesgReceived_put ;

  // value method incorrectCnt
  assign incorrectCnt = incorrect[3:0] ;
  assign RDY_incorrectCnt = 1'd1 ;

  // submodule dataIngressExpF
  FIFO2 #(.width(32'd128), .guarded(32'd1)) dataIngressExpF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(dataIngressExpF_D_IN),
							    .ENQ(dataIngressExpF_ENQ),
							    .DEQ(dataIngressExpF_DEQ),
							    .CLR(dataIngressExpF_CLR),
							    .D_OUT(dataIngressExpF_D_OUT),
							    .FULL_N(dataIngressExpF_FULL_N),
							    .EMPTY_N(dataIngressExpF_EMPTY_N));

  // submodule dataIngressRcvF
  FIFO2 #(.width(32'd128), .guarded(32'd1)) dataIngressRcvF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(dataIngressRcvF_D_IN),
							    .ENQ(dataIngressRcvF_ENQ),
							    .DEQ(dataIngressRcvF_DEQ),
							    .CLR(dataIngressRcvF_CLR),
							    .D_OUT(dataIngressRcvF_D_OUT),
							    .FULL_N(dataIngressRcvF_FULL_N),
							    .EMPTY_N(dataIngressRcvF_EMPTY_N));

  // submodule mesgIngressExpF
  FIFO2 #(.width(32'd129), .guarded(32'd1)) mesgIngressExpF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(mesgIngressExpF_D_IN),
							    .ENQ(mesgIngressExpF_ENQ),
							    .DEQ(mesgIngressExpF_DEQ),
							    .CLR(mesgIngressExpF_CLR),
							    .D_OUT(mesgIngressExpF_D_OUT),
							    .FULL_N(mesgIngressExpF_FULL_N),
							    .EMPTY_N(mesgIngressExpF_EMPTY_N));

  // submodule mesgIngressRcvF
  FIFO2 #(.width(32'd129), .guarded(32'd1)) mesgIngressRcvF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(mesgIngressRcvF_D_IN),
							    .ENQ(mesgIngressRcvF_ENQ),
							    .DEQ(mesgIngressRcvF_DEQ),
							    .CLR(mesgIngressRcvF_CLR),
							    .D_OUT(mesgIngressRcvF_D_OUT),
							    .FULL_N(mesgIngressRcvF_FULL_N),
							    .EMPTY_N(mesgIngressRcvF_EMPTY_N));

  // submodule metaIngressExpF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) metaIngressExpF(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(metaIngressExpF_D_IN),
							   .ENQ(metaIngressExpF_ENQ),
							   .DEQ(metaIngressExpF_DEQ),
							   .CLR(metaIngressExpF_CLR),
							   .D_OUT(metaIngressExpF_D_OUT),
							   .FULL_N(metaIngressExpF_FULL_N),
							   .EMPTY_N(metaIngressExpF_EMPTY_N));

  // submodule metaIngressRcvF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) metaIngressRcvF(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(metaIngressRcvF_D_IN),
							   .ENQ(metaIngressRcvF_ENQ),
							   .DEQ(metaIngressRcvF_DEQ),
							   .CLR(metaIngressRcvF_CLR),
							   .D_OUT(metaIngressRcvF_D_OUT),
							   .FULL_N(metaIngressRcvF_FULL_N),
							   .EMPTY_N(metaIngressRcvF_EMPTY_N));

  // rule RL_forkMesgExp
  assign CAN_FIRE_RL_forkMesgExp =
	     mesgIngressExpF_EMPTY_N &&
	     (mesgIngressExpF_D_OUT[128] ?
		dataIngressExpF_FULL_N :
		metaIngressExpF_FULL_N) ;
  assign WILL_FIRE_RL_forkMesgExp = CAN_FIRE_RL_forkMesgExp ;

  // rule RL_forkMesgRcv
  assign CAN_FIRE_RL_forkMesgRcv =
	     mesgIngressRcvF_EMPTY_N &&
	     (mesgIngressRcvF_D_OUT[128] ?
		dataIngressRcvF_FULL_N :
		metaIngressRcvF_FULL_N) ;
  assign WILL_FIRE_RL_forkMesgRcv = CAN_FIRE_RL_forkMesgRcv ;

  // rule RL_calcIncorrect
  assign CAN_FIRE_RL_calcIncorrect = 1'd1 ;
  assign WILL_FIRE_RL_calcIncorrect = 1'd1 ;

  // rule RL_compareMeta
  assign CAN_FIRE_RL_compareMeta = MUX_bytesRemain_write_1__SEL_1 ;
  assign WILL_FIRE_RL_compareMeta = MUX_bytesRemain_write_1__SEL_1 ;

  // rule RL_compareData
  assign CAN_FIRE_RL_compareData = MUX_bytesRemain_write_1__SEL_2 ;
  assign WILL_FIRE_RL_compareData = MUX_bytesRemain_write_1__SEL_2 ;

  // inputs to muxes for submodule ports
  assign MUX_bytesRemain_write_1__SEL_1 =
	     metaIngressRcvF_EMPTY_N && metaIngressExpF_EMPTY_N &&
	     !bytesRemain[32] ;
  assign MUX_bytesRemain_write_1__SEL_2 =
	     NOT_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_ETC___d59 &&
	     bytesRemain[32] ;
  assign MUX_bytesRemain_write_1__VAL_1 =
	     { 1'd1, metaIngressRcvF_D_OUT[39:8] } ;
  assign MUX_bytesRemain_write_1__VAL_2 =
	     { !IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51,
	       bytesRemain[31:0] - 32'd16 } ;

  // register bytesRemain
  assign bytesRemain_D_IN =
	     WILL_FIRE_RL_compareMeta ?
	       MUX_bytesRemain_write_1__VAL_1 :
	       MUX_bytesRemain_write_1__VAL_2 ;
  assign bytesRemain_EN =
	     WILL_FIRE_RL_compareMeta || WILL_FIRE_RL_compareData ;

  // register cmpDataMatch
  assign cmpDataMatch_D_IN =
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179 ;
  assign cmpDataMatch_EN =
	     WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 ;

  // register cmpMetaMatch
  assign cmpMetaMatch_D_IN =
	     metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 &&
	     metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36 ;
  assign cmpMetaMatch_EN = MUX_bytesRemain_write_1__SEL_1 ;

  // register correctData
  assign correctData_D_IN = correctData + 32'd1 ;
  assign correctData_EN =
	     WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179 ;

  // register correctMeta
  assign correctMeta_D_IN = correctMeta + 32'd1 ;
  assign correctMeta_EN =
	     WILL_FIRE_RL_compareMeta &&
	     metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 &&
	     metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36 ;

  // register incorrect
  assign incorrect_D_IN = incorrectData | incorrectMeta ;
  assign incorrect_EN = 1'd1 ;

  // register incorrectData
  assign incorrectData_D_IN = incorrectData + 32'd1 ;
  assign incorrectData_EN =
	     WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	     NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d230 ;

  // register incorrectMeta
  assign incorrectMeta_D_IN = incorrectMeta + 32'd1 ;
  assign incorrectMeta_EN =
	     WILL_FIRE_RL_compareMeta &&
	     (!metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 ||
	      !metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36) ;

  // register msgConsumeCnt
  assign msgConsumeCnt_D_IN = msgConsumeCnt + 32'd1 ;
  assign msgConsumeCnt_EN =
	     WILL_FIRE_RL_compareData &&
	     IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 ;

  // submodule dataIngressExpF
  assign dataIngressExpF_D_IN = mesgIngressExpF_D_OUT[127:0] ;
  assign dataIngressExpF_ENQ =
	     WILL_FIRE_RL_forkMesgExp && mesgIngressExpF_D_OUT[128] ;
  assign dataIngressExpF_DEQ =
	     WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 ;
  assign dataIngressExpF_CLR = 1'b0 ;

  // submodule dataIngressRcvF
  assign dataIngressRcvF_D_IN = mesgIngressRcvF_D_OUT[127:0] ;
  assign dataIngressRcvF_ENQ =
	     WILL_FIRE_RL_forkMesgRcv && mesgIngressRcvF_D_OUT[128] ;
  assign dataIngressRcvF_DEQ =
	     WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 ;
  assign dataIngressRcvF_CLR = 1'b0 ;

  // submodule mesgIngressExpF
  assign mesgIngressExpF_D_IN = mesgExpected_put ;
  assign mesgIngressExpF_ENQ = EN_mesgExpected_put ;
  assign mesgIngressExpF_DEQ = CAN_FIRE_RL_forkMesgExp ;
  assign mesgIngressExpF_CLR = 1'b0 ;

  // submodule mesgIngressRcvF
  assign mesgIngressRcvF_D_IN = mesgReceived_put ;
  assign mesgIngressRcvF_ENQ = EN_mesgReceived_put ;
  assign mesgIngressRcvF_DEQ = CAN_FIRE_RL_forkMesgRcv ;
  assign mesgIngressRcvF_CLR = 1'b0 ;

  // submodule metaIngressExpF
  assign metaIngressExpF_D_IN = mesgIngressExpF_D_OUT[39:0] ;
  assign metaIngressExpF_ENQ =
	     WILL_FIRE_RL_forkMesgExp && !mesgIngressExpF_D_OUT[128] ;
  assign metaIngressExpF_DEQ =
	     WILL_FIRE_RL_compareData &&
	     IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 ;
  assign metaIngressExpF_CLR = 1'b0 ;

  // submodule metaIngressRcvF
  assign metaIngressRcvF_D_IN = mesgIngressRcvF_D_OUT[39:0] ;
  assign metaIngressRcvF_ENQ =
	     WILL_FIRE_RL_forkMesgRcv && !mesgIngressRcvF_D_OUT[128] ;
  assign metaIngressRcvF_DEQ =
	     WILL_FIRE_RL_compareData &&
	     IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 ;
  assign metaIngressRcvF_CLR = 1'b0 ;

  // remaining internal signals
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d104 =
	     x__h11568 == y__h11569 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d110 =
	     x__h11698 == y__h11699 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d116 =
	     x__h11828 == y__h11829 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d122 =
	     x__h11958 == y__h11959 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d128 =
	     x__h12088 == y__h12089 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d134 =
	     x__h12218 == y__h12219 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d140 =
	     x__h12348 == y__h12349 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d146 =
	     x__h12478 == y__h12479 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d152 =
	     x__h12608 == y__h12609 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d158 =
	     x__h12738 == y__h12739 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d164 =
	     x__h12868 == y__h12869 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d170 =
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d128 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d134 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d140 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d146 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d152 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d158 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d164 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d176 =
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d92 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d98 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d104 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d110 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d116 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d122 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d170 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179 =
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d74 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d80 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d86 &&
	     IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d176 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d74 =
	     x__h9572 == y__h9573 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d80 =
	     x__h11048 == y__h11049 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d86 =
	     x__h11178 == y__h11179 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d92 =
	     x__h11308 == y__h11309 ;
  assign IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d98 =
	     x__h11438 == y__h11439 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d105 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd6 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d111 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd7 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d117 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd8 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d123 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd9 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d129 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd10 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d135 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd11 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d141 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd12 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d147 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd13 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d153 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd14 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d159 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd15 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 =
	     IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 ?
	       bytesRemain_BITS_31_TO_0__q1[4:0] :
	       5'd16 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d75 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd1 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d81 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd2 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d87 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd3 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d93 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd4 ;
  assign IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d99 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 <=
	     5'd5 ;
  assign IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 =
	     bytesRemain[31:0] <= 32'd16 ;
  assign NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d221 =
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d128 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d134 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d140 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d146 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d152 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d158 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d164 ;
  assign NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d227 =
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d92 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d98 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d104 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d110 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d116 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d122 ||
	     NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d221 ;
  assign NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d230 =
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d74 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d80 ||
	     !IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d86 ||
	     NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d227 ;
  assign NOT_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_ETC___d59 =
	     (!IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51 ||
	      metaIngressRcvF_EMPTY_N && metaIngressExpF_EMPTY_N) &&
	     (bytesRemain[31:0] == 32'd0 ||
	      dataIngressExpF_EMPTY_N && dataIngressRcvF_EMPTY_N) ;
  assign bytesRemain_BITS_31_TO_0__q1 = bytesRemain[31:0] ;
  assign metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 =
	     metaIngressExpF_D_OUT[39:8] == metaIngressRcvF_D_OUT[39:8] ;
  assign metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36 =
	     metaIngressExpF_D_OUT[7:0] == metaIngressRcvF_D_OUT[7:0] ;
  assign x__h11048 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d75 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[15:8] ;
  assign x__h11178 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d81 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[23:16] ;
  assign x__h11308 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d87 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[31:24] ;
  assign x__h11438 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d93 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[39:32] ;
  assign x__h11568 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d99 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[47:40] ;
  assign x__h11698 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d105 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[55:48] ;
  assign x__h11828 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d111 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[63:56] ;
  assign x__h11958 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d117 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[71:64] ;
  assign x__h12088 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d123 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[79:72] ;
  assign x__h12218 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d129 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[87:80] ;
  assign x__h12348 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d135 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[95:88] ;
  assign x__h12478 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d141 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[103:96] ;
  assign x__h12608 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d147 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[111:104] ;
  assign x__h12738 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d153 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[119:112] ;
  assign x__h12868 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d159 ?
	       8'd0 :
	       dataIngressExpF_D_OUT[127:120] ;
  assign x__h9572 =
	     (IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 ==
	      5'd0) ?
	       8'd0 :
	       dataIngressExpF_D_OUT[7:0] ;
  assign y__h11049 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d75 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[15:8] ;
  assign y__h11179 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d81 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[23:16] ;
  assign y__h11309 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d87 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[31:24] ;
  assign y__h11439 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d93 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[39:32] ;
  assign y__h11569 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d99 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[47:40] ;
  assign y__h11699 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d105 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[55:48] ;
  assign y__h11829 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d111 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[63:56] ;
  assign y__h11959 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d117 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[71:64] ;
  assign y__h12089 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d123 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[79:72] ;
  assign y__h12219 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d129 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[87:80] ;
  assign y__h12349 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d135 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[95:88] ;
  assign y__h12479 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d141 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[103:96] ;
  assign y__h12609 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d147 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[111:104] ;
  assign y__h12739 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d153 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[119:112] ;
  assign y__h12869 =
	     IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d159 ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[127:120] ;
  assign y__h9573 =
	     (IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain__ETC___d66 ==
	      5'd0) ?
	       8'd0 :
	       dataIngressRcvF_D_OUT[7:0] ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        bytesRemain <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
	correctData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	correctMeta <= `BSV_ASSIGNMENT_DELAY 32'd0;
	incorrect <= `BSV_ASSIGNMENT_DELAY 32'd0;
	incorrectData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	incorrectMeta <= `BSV_ASSIGNMENT_DELAY 32'd0;
	msgConsumeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (bytesRemain_EN)
	  bytesRemain <= `BSV_ASSIGNMENT_DELAY bytesRemain_D_IN;
	if (correctData_EN)
	  correctData <= `BSV_ASSIGNMENT_DELAY correctData_D_IN;
	if (correctMeta_EN)
	  correctMeta <= `BSV_ASSIGNMENT_DELAY correctMeta_D_IN;
	if (incorrect_EN) incorrect <= `BSV_ASSIGNMENT_DELAY incorrect_D_IN;
	if (incorrectData_EN)
	  incorrectData <= `BSV_ASSIGNMENT_DELAY incorrectData_D_IN;
	if (incorrectMeta_EN)
	  incorrectMeta <= `BSV_ASSIGNMENT_DELAY incorrectMeta_D_IN;
	if (msgConsumeCnt_EN)
	  msgConsumeCnt <= `BSV_ASSIGNMENT_DELAY msgConsumeCnt_D_IN;
      end
    if (cmpDataMatch_EN)
      cmpDataMatch <= `BSV_ASSIGNMENT_DELAY cmpDataMatch_D_IN;
    if (cmpMetaMatch_EN)
      cmpMetaMatch <= `BSV_ASSIGNMENT_DELAY cmpMetaMatch_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    bytesRemain = 33'h0AAAAAAAA;
    cmpDataMatch = 1'h0;
    cmpMetaMatch = 1'h0;
    correctData = 32'hAAAAAAAA;
    correctMeta = 32'hAAAAAAAA;
    incorrect = 32'hAAAAAAAA;
    incorrectData = 32'hAAAAAAAA;
    incorrectMeta = 32'hAAAAAAAA;
    msgConsumeCnt = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareMeta &&
	  metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 &&
	  metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36)
	begin
	  v__h7431 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareMeta &&
	  metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 &&
	  metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36)
	$display("[%0d] Meta Matched OK | expected | op: %0x, length: %0x | received | op: %0x, length %0x",
		 v__h7431,
		 metaIngressExpF_D_OUT[7:0],
		 $unsigned(metaIngressExpF_D_OUT[39:8]),
		 metaIngressRcvF_D_OUT[7:0],
		 $unsigned(metaIngressRcvF_D_OUT[39:8]));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareMeta &&
	  (!metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 ||
	   !metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36))
	begin
	  v__h7472 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareMeta &&
	  (!metaIngressExpF_first__1_BITS_39_TO_8_2_EQ_met_ETC___d33 ||
	   !metaIngressExpF_first__1_BITS_7_TO_0_4_EQ_meta_ETC___d36))
	$display("[%0d] Meta Mismatch Error| expected | op: %0x, length: %0x | received | op: %0x, length %0x",
		 v__h7472,
		 metaIngressExpF_D_OUT[7:0],
		 $unsigned(metaIngressExpF_D_OUT[39:8]),
		 metaIngressRcvF_D_OUT[7:0],
		 $unsigned(metaIngressRcvF_D_OUT[39:8]));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	  IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179)
	begin
	  v__h13101 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	  IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytesRema_ETC___d179)
	$display("[%0d] Data Match OK| expected | %0x | received | %0x",
		 v__h13101,
		 { x__h12868,
		   x__h12738,
		   x__h12608,
		   x__h12478,
		   x__h12348,
		   x__h12218,
		   x__h12088,
		   x__h11958,
		   x__h11828,
		   x__h11698,
		   x__h11568,
		   x__h11438,
		   x__h11308,
		   x__h11178,
		   x__h11048,
		   x__h9572 },
		 { y__h12869,
		   y__h12739,
		   y__h12609,
		   y__h12479,
		   y__h12349,
		   y__h12219,
		   y__h12089,
		   y__h11959,
		   y__h11829,
		   y__h11699,
		   y__h11569,
		   y__h11439,
		   y__h11309,
		   y__h11179,
		   y__h11049,
		   y__h9573 });
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	  NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d230)
	begin
	  v__h16227 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData && bytesRemain[31:0] != 32'd0 &&
	  NOT_IF_IF_IF_bytesRemain_4_BIT_32_5_THEN_bytes_ETC___d230)
	$display("[%0d] Data Mismatch Error| expected | %0x | received | %0x",
		 v__h16227,
		 { x__h12868,
		   x__h12738,
		   x__h12608,
		   x__h12478,
		   x__h12348,
		   x__h12218,
		   x__h12088,
		   x__h11958,
		   x__h11828,
		   x__h11698,
		   x__h11568,
		   x__h11438,
		   x__h11308,
		   x__h11178,
		   x__h11048,
		   x__h9572 },
		 { y__h12869,
		   y__h12739,
		   y__h12609,
		   y__h12479,
		   y__h12349,
		   y__h12219,
		   y__h12089,
		   y__h11959,
		   y__h11829,
		   y__h11699,
		   y__h11569,
		   y__h11439,
		   y__h11309,
		   y__h11179,
		   y__h11049,
		   y__h9573 });
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData &&
	  IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51)
	begin
	  v__h19492 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_compareData &&
	  IF_bytesRemain_4_BIT_32_5_THEN_bytesRemain_4_B_ETC___d51)
	$display("[%0d] MLConsumer has finished message %0d",
		 v__h19492,
		 $unsigned(msgConsumeCnt));
  end
  // synopsys translate_on
endmodule  // mkMLConsumer
