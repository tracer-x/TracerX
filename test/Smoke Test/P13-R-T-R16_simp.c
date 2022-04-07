#include<stdio.h>
#ifdef LLBMC
#include <llbmc.h>
#else
#include <klee/klee.h>
#endif

#define BOUND 5
int kappa;
int input,output;
#include <assert.h>
#include <math.h>
#include <stdlib.h>

   // extern void __VERIFIER_error(int);

	// inputs
	int inputs[] = {2,1,4,5,3};

	void errorCheck();
	void calculate_output(int);
	void calculate_outputm1(int);
	void calculate_outputm2(int);
	void calculate_outputm3(int);
	void calculate_outputm4(int);
	void calculate_outputm5(int);
	void calculate_outputm6(int);
	void calculate_outputm7(int);
	void calculate_outputm8(int);
	void calculate_outputm9(int);
	void calculate_outputm10(int);
	void calculate_outputm11(int);
	void calculate_outputm12(int);
	void calculate_outputm13(int);
	void calculate_outputm14(int);
	void calculate_outputm15(int);
	void calculate_outputm16(int);
	void calculate_outputm17(int);
	void calculate_outputm18(int);
	void calculate_outputm19(int);
	void calculate_outputm20(int);
	void calculate_outputm21(int);
	void calculate_outputm22(int);
	void calculate_outputm23(int);
	void calculate_outputm24(int);
	void calculate_outputm25(int);
	void calculate_outputm26(int);
	void calculate_outputm27(int);
	void calculate_outputm28(int);
	void calculate_outputm29(int);
	void calculate_outputm30(int);
	void calculate_outputm31(int);
	void calculate_outputm32(int);
	void calculate_outputm33(int);
	void calculate_outputm34(int);
	void calculate_outputm35(int);
	void calculate_outputm36(int);
	void calculate_outputm37(int);
	void calculate_outputm38(int);
	void calculate_outputm39(int);
	void calculate_outputm40(int);
	void calculate_outputm41(int);
	void calculate_outputm42(int);
	void calculate_outputm43(int);
	void calculate_outputm44(int);
	void calculate_outputm45(int);
	void calculate_outputm46(int);
	void calculate_outputm47(int);
	void calculate_outputm48(int);
	void calculate_outputm49(int);
	void calculate_outputm50(int);
	void calculate_outputm51(int);
	void calculate_outputm52(int);
	void calculate_outputm53(int);
	void calculate_outputm54(int);
	void calculate_outputm55(int);
	void calculate_outputm56(int);
	void calculate_outputm57(int);
	void calculate_outputm58(int);
	void calculate_outputm59(int);
	void calculate_outputm60(int);
	void calculate_outputm61(int);
	void calculate_outputm62(int);
	void calculate_outputm63(int);
	void calculate_outputm64(int);
	void calculate_outputm65(int);
	void calculate_outputm66(int);
	void calculate_outputm67(int);
	void calculate_outputm68(int);
	void calculate_outputm69(int);
	void calculate_outputm70(int);
	void calculate_outputm71(int);
	void calculate_outputm72(int);
	void calculate_outputm73(int);
	void calculate_outputm74(int);
	void calculate_outputm75(int);
	void calculate_outputm76(int);
	void calculate_outputm77(int);
	void calculate_outputm78(int);
	void calculate_outputm79(int);
	void calculate_outputm80(int);
	void calculate_outputm81(int);
	void calculate_outputm82(int);
	void calculate_outputm83(int);
	void calculate_outputm84(int);
	void calculate_outputm85(int);
	void calculate_outputm86(int);
	void calculate_outputm87(int);
	void calculate_outputm88(int);
	void calculate_outputm89(int);
	void calculate_outputm90(int);
	void calculate_outputm91(int);
	void calculate_outputm92(int);
	void calculate_outputm93(int);
	void calculate_outputm94(int);
	void calculate_outputm95(int);
	void calculate_outputm96(int);
	void calculate_outputm97(int);
	void calculate_outputm98(int);
	void calculate_outputm99(int);
	void calculate_outputm100(int);
	void calculate_outputm101(int);
	void calculate_outputm102(int);
	void calculate_outputm103(int);
	void calculate_outputm104(int);
	void calculate_outputm105(int);
	void calculate_outputm106(int);
	void calculate_outputm107(int);
	void calculate_outputm108(int);
	void calculate_outputm109(int);
	void calculate_outputm110(int);
	void calculate_outputm111(int);
	void calculate_outputm112(int);
	void calculate_outputm113(int);
	void calculate_outputm114(int);
	void calculate_outputm115(int);
	void calculate_outputm116(int);
	void calculate_outputm117(int);
	void calculate_outputm118(int);
	void calculate_outputm119(int);
	void calculate_outputm120(int);
	void calculate_outputm121(int);
	void calculate_outputm122(int);
	void calculate_outputm123(int);
	void calculate_outputm124(int);
	void calculate_outputm125(int);
	void calculate_outputm126(int);
	void calculate_outputm127(int);
	void calculate_outputm128(int);
	void calculate_outputm129(int);
	void calculate_outputm130(int);
	void calculate_outputm131(int);
	void calculate_outputm132(int);
	void calculate_outputm133(int);
	void calculate_outputm134(int);
	void calculate_outputm135(int);
	void calculate_outputm136(int);
	void calculate_outputm137(int);
	void calculate_outputm138(int);
	void calculate_outputm139(int);
	void calculate_outputm140(int);
	void calculate_outputm141(int);
	void calculate_outputm142(int);
	void calculate_outputm143(int);
	void calculate_outputm144(int);
	void calculate_outputm145(int);
	void calculate_outputm146(int);
	void calculate_outputm147(int);
	void calculate_outputm148(int);
	void calculate_outputm149(int);
	void calculate_outputm150(int);
	void calculate_outputm151(int);
	void calculate_outputm152(int);
	void calculate_outputm153(int);
	void calculate_outputm154(int);
	void calculate_outputm155(int);
	void calculate_outputm156(int);
	void calculate_outputm157(int);
	void calculate_outputm158(int);
	void calculate_outputm159(int);
	void calculate_outputm160(int);
	void calculate_outputm161(int);
	void calculate_outputm162(int);
	void calculate_outputm163(int);
	void calculate_outputm164(int);
	void calculate_outputm165(int);
	void calculate_outputm166(int);
	void calculate_outputm167(int);
	void calculate_outputm168(int);
	void calculate_outputm169(int);
	void calculate_outputm170(int);
	void calculate_outputm171(int);
	void calculate_outputm172(int);
	void calculate_outputm173(int);
	void calculate_outputm174(int);
	void calculate_outputm175(int);
	void calculate_outputm176(int);
	void calculate_outputm177(int);
	void calculate_outputm178(int);
	void calculate_outputm179(int);
	void calculate_outputm180(int);
	void calculate_outputm181(int);
	void calculate_outputm182(int);
	void calculate_outputm183(int);

	 int a28  = 35;
	 int a310[] = {1,2,3,4,5,6,7,8};
	 int a14 = 14;
	 int a174[] = {90,91,92,93,94,95};
	 int a188[] = {96,97,98,99,100,101};
	 int a143[] = {102,103,104,105,106,107};
	 int *a163 = a188;
	 int a311[] = {1,2,3,4,5,6,7,8};
	 int a208 = 7;
	 int a130 = 4;
	 int a185 = 434;
	 int a191  = 36;
	 int a399 = 3;
	 int a354 = -152;
	 int cf = 1;
	 int a290  = 36;
	 int a341[] = {2,3,4,5,6,7,8,9};
	 int a190[] = {64,65,66,67,68,69};
	 int a12[] = {70,71,72,73,74,75};
	 int a18[] = {76,77,78,79,80,81};
	 int *a65 = a12;
	 int a13  = 36;
	 int a272[] = {1,2,3,4,5,6,7,8};
	 int a322  = 32;
	 int a2 = 7;
	 int a107[] = {88,89,90,91,92,93};
	 int a96[] = {94,95,96,97,98,99};
	 int a132[] = {100,101,102,103,104,105};
	 int *a47 = a96;
	 int a356 = -118;
	 int a235[] = {4,5,6,7,8,9,10,11};
	 int a3[] = {9,10,11,12,13,14,15,16};
	 int a280 = 118;
	 int a268 = -7;
	 int a344 = -132;
	 int a347 = -150;
	 int a279 = -13;
	 int a120[] = {28,29,30,31,32,33};
	 int a160[] = {34,35,36,37,38,39};
	 int a81[] = {40,41,42,43,44,45};
	 int *a140 = a120;
	 int a75 = 8;
	 int a49[] = {4,5,6,7,8,9,10,11};
	 int a253 = -136;
	 int a91 = 22;
	 int a293 = 2;
	 int a186[] = {2,3,4,5,6,7,8,9};
	 int a25 = 13;
	 int a219 = 7;
	 int a369 = 9;
	 int a376 = 124;
	 int a102 = 8;
	 int a295 = 8;
	 int a106 = 10;
	 int a212 = 13;
	 int a359  = 32;
	 int a108[] = {27,28,29,30,31,32};
	 int a37[] = {33,34,35,36,37,38};
	 int a94[] = {39,40,41,42,43,44};
	 int *a72 = a94;
	 int a305[] = {42,43,44,45,46,47};
	 int a372[] = {48,49,50,51,52,53};
	 int a214[] = {54,55,56,57,58,59};
	 int *a234 = a372;
	 int a273[] = {5,6,7,8,9,10};
	 int a270[] = {11,12,13,14,15,16};
	 int a393[] = {17,18,19,20,21,22};
	 int *a264 = a270;
	 int a368[] = {83,84,85,86,87,88};
	 int a338[] = {89,90,91,92,93,94};
	 int a382[] = {95,96,97,98,99,100};
	 int *a277 = a338;
	 int a98 = 14;
	 int a230  = 32;
	 int a53[] = {10,11,12,13,14,15,16,17};
	 int a0  = 35;
	 int a204 = 11;
	 int a328 = 5;
	 int a126  = 33;
	 int a258 = -57;
	 int a152[] = {10,11,12,13,14,15,16,17};
	 int a250[] = {70,71,72,73,74,75};
	 int a262[] = {76,77,78,79,80,81};
	 int a213[] = {82,83,84,85,86,87};
	 int *a306 = a262;
	 int a17[] = {7,8,9,10,11,12,13,14};
	 int a254[] = {94,95,96,97,98,99};
	 int a390[] = {100,101,102,103,104,105};
	 int a395[] = {106,107,108,109,110,111};
	 int *a381 = a395;
	 int a139[] = {6,7,8,9,10,11,12,13};
	 int a283[] = {84,85,86,87,88,89};
	 int a367[] = {90,91,92,93,94,95};
	 int a323[] = {96,97,98,99,100,101};
	 int *a350 = a367;
	 int a342[] = {5,6,7,8,9,10,11,12};
	 int a180 = 3;
	 int a298[] = {52,53,54,55,56,57};
	 int a349[] = {58,59,60,61,62,63};
	 int a345[] = {64,65,66,67,68,69};
	 int *a237 = a349;
	 int a71[] = {19,20,21,22,23,24};
	 int a16[] = {25,26,27,28,29,30};
	 int a170[] = {31,32,33,34,35,36};
	 int *a20 = a16;
	 int a302[] = {7,8,9,10,11,12,13,14};
	 int a315[] = {2,3,4,5,6,7};
	 int a249[] = {8,9,10,11,12,13};
	 int a339[] = {14,15,16,17,18,19};
	 int *a398 = a315;
	 int a224 = 6;
	 int a217 = 7;
	 int a205[] = {38,39,40,41,42,43};
	 int a248[] = {44,45,46,47,48,49};
	 int a223[] = {50,51,52,53,54,55};
	 int *a215 = a248;
	 int a66[] = {8,9,10,11,12,13};
	 int a175[] = {14,15,16,17,18,19};
	 int a51[] = {20,21,22,23,24,25};
	 int *a9 = a66;
	 int a232  = 32;
	 int a67[] = {9,10,11,12,13,14,15,16};
	 int a8[] = {48,49,50,51,52,53};
	 int a118[] = {54,55,56,57,58,59};
	 int a84[] = {60,61,62,63,64,65};
	 int *a137 = a84;
	 int a162[] = {29,30,31,32,33,34};
	 int a40[] = {35,36,37,38,39,40};
	 int a104[] = {41,42,43,44,45,46};
	 int *a11 = a104;
	 int a314[] = {8,9,10,11,12,13,14,15};
	 int a182[] = {10,11,12,13,14,15,16,17};
	 int a380 = 5;
	 int a394 = 2;
	 int a176[] = {6,7,8,9,10,11,12,13};
	 int a54 = 5;
	 int a197[] = {80,81,82,83,84,85};
	 int a76[] = {86,87,88,89,90,91};
	 int a34[] = {92,93,94,95,96,97};
	 int *a42 = a76;
	 int a156  = 34;
	 int a61[] = {4,5,6,7,8,9,10,11};
	 int a135 = 15;
	 int a35[] = {3,4,5,6,7,8,9,10};
	 int a260 = 290;
	 int a374[] = {3,4,5,6,7,8,9,10};
	 int a41 = 7;
	 int a19[] = {6,7,8,9,10,11,12,13};
	 int a397[] = {61,62,63,64,65,66};
	 int a267[] = {67,68,69,70,71,72};
	 int a329[] = {73,74,75,76,77,78};
	 int *a236 = a267;
	 int a150 = 8;
	 int a321[] = {24,25,26,27,28,29};
	 int a201[] = {30,31,32,33,34,35};
	 int a360[] = {36,37,38,39,40,41};
	 int *a326 = a201;
	 int a377 = 4;
	 int a387  = 32;
	 int a386 = 8;
	 int a189[] = {31,32,33,34,35,36};
	 int a45[] = {37,38,39,40,41,42};
	 int a113[] = {43,44,45,46,47,48};
	 int *a52 = a113;
	 int a155 = 10;
	 int a362 = 8;
	 int a324 = 3;
	 int a330 = 6;
	 int a286[] = {56,57,58,59,60,61};
	 int a312[] = {62,63,64,65,66,67};
	 int a247[] = {68,69,70,71,72,73};
	 int *a256 = a312;
	 int a304 = 8;
	 int a332 = 11;
	 int a29 = 10;
	 int a93  = 34;
	 int a200 = 11;
	 int a401 = 6;
	 int a22[] = {4,5,6,7,8,9,10,11};
	 int a391[] = {5,6,7,8,9,10,11,12};
	 int a7 = -142;
	 int a242[] = {7,8,9,10,11,12,13,14};
	 int a103 = 5;
	 int a233[] = {6,7,8,9,10,11,12,13};
	 int a257 = 220;
	 int a116 = 15;
	 int a74[] = {7,8,9,10,11,12};
	 int a198[] = {13,14,15,16,17,18};
	 int a149[] = {19,20,21,22,23,24};
	 int *a62 = a198;
	 int a193 = 5;
	 int a169 = 104;
	 int a161 = 12;
	 int a31 = 10;
	 int a370  = 32;
	 int a57 = 9;
	 int a38[] = {15,16,17,18,19,20};
	 int a133[] = {21,22,23,24,25,26};
	 int a144[] = {27,28,29,30,31,32};
	 int *a79 = a38;
	 int a44 = -115;
	 int a32 = -125;
	 int a355 = 5;
	 int a43 = 4;
	 int a287  = 32;
	 int a358 = 4;
	 int a299  = 32;
	 int a331  = 32;
	 int a78 = 148;
	 int a131  = 32;
	 int a388 = 9;
	 int a129 = 2;
	 int a4 = 1;
	 int a167 = 1;
	 int a111 = 1;
	 int a157 = 0;


	void errorCheck() {
	    if((((a43 == a61[2] && a150 == 9) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(0);
	    }
	    if((((a25 == a3[5] && a129 == a186[1]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(1);
	    }
	    if(((((71 == a65[1]) && a41 == 7) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(2);
	    }
	    if((((a41 == 8 && a180 == a35[7]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(3);
	    }
	    if((((a103 == 7 && a161 == a19[5]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(4);
	    }
	    if((((161 < a258 && a103 == 6) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(5);
	    }
	    if((((a0 == 36 && a180 == a35[0]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(6);
	    }
	    if((((a126 == 35 && a98 == a67[4]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(7);
	    }
	    if(((((31 == a140[3]) && a129 == a186[6]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(8);
	    }
	    if((((a106 == 10 && a155 == 11) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(9);
	    }
	    if((((a131 == 33 && a150 == 3) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(10);
	    }
	    if(((((98 == a381[4]) && a155 == 14) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(11);
	    }
	    if((((a290 == 33 && a41 == 6) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(12);
	    }
	    if((((a103 == 5 && a161 == a19[5]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(13);
	    }
	    if(((((105 == a47[5]) && a129 == a186[3]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(14);
	    }
	    if((((a193 == 8 && a41 == 11) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(15);
	    }
	    if((((a401 == a272[5] && a155 == 15) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(16);
	    }
	    if((((a131 == 32 && a150 == 3) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(17);
	    }
	    if((((a2 == a139[3] && a41 == 8) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(18);
	    }
	    if(((((32 == a52[1]) && a103 == 1) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(19);
	    }
	    if((((a193 == 7 && a41 == 11) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(20);
	    }
	    if((((a399 == 10 && a54 == 9) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(21);
	    }
	    if((((a43 == a61[0] && a98 == a67[5]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(22);
	    }
	    if((((a106 == 13 && a155 == 11) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(23);
	    }
	    if((((a358 == a310[2] && a103 == 5) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(24);
	    }
	    if((((a54 == 12 && a78 <=  34) && (98 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(25);
	    }
	    if((((a258 <=  -43 && a103 == 6) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(26);
	    }
	    if((((a54 == 12 && a98 == a67[7]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(27);
	    }
	    if((((a102 == a17[3] && (64 == a256[2])) && (30 == a20[5])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(28);
	    }
	    if((((a116 == a53[1] && a180 == a35[1]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(29);
	    }
	    if((((a290 == 33 && a98 == a67[3]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(30);
	    }
	    if(((((6 == a398[4]) && a150 == 6) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(31);
	    }
	    if((((a386 == 8 && a161 == a19[3]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(32);
	    }
	    if((((a332 == 10 && a161 == a19[1]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(33);
	    }
	    if((((a161 == a19[7] && a54 == 10) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(34);
	    }
	    if((((a57 == a49[1] && a54 == 8) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(35);
	    }
	    if((((a57 == a49[4] && a161 == a19[4]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(36);
	    }
	    if((((a102 == a17[5] && (64 == a256[2])) && (30 == a20[5])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(37);
	    }
	    if((((a98 == a67[5] && a180 == a35[3]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(38);
	    }
	    if((((a150 == 9 && a129 == a186[2]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(39);
	    }
	    if((((a358 == a310[5] && a103 == 5) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(40);
	    }
	    if((((a161 == a19[6] && a54 == 10) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(41);
	    }
	    if((((a401 == a272[3] && a155 == 15) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(42);
	    }
	    if((((a31 == a22[2] && a180 == a35[5]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(43);
	    }
	    if((((a14 == a182[4] && a180 == a35[2]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(44);
	    }
	    if((((a103 == 8 && a161 == a19[5]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(45);
	    }
	    if((((a131 == 35 && a150 == 3) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(46);
	    }
	    if((((a290 == 34 && a98 == a67[3]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(47);
	    }
	    if((((a29 == 12 && a161 == a19[6]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(48);
	    }
	    if((((a57 == a49[6] && a54 == 8) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(49);
	    }
	    if((((a93 == 33 && a54 == 11) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(50);
	    }
	    if((((a75 == a176[4] && a155 == 13) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(51);
	    }
	    if((((a102 == a17[0] && a180 == a35[6]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(52);
	    }
	    if((((a401 == a272[1] && a155 == 15) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(53);
	    }
	    if((((a93 == 35 && a54 == 11) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(54);
	    }
	    if((((a290 == 34 && a41 == 6) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(55);
	    }
	    if((((a7 <=  -137 && a150 == 8) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(56);
	    }
	    if((((a93 == 34 && a54 == 11) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(57);
	    }
	    if(((((17 == a62[4]) && a54 == 5) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(58);
	    }
	    if((((a116 == a53[5] && a180 == a35[1]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(59);
	    }
	    if((((a54 == 6 && a98 == a67[7]) && (104 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(60);
	    }
	    if((((a129 == a186[2] && a41 == 9) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(61);
	    }
	    if((((a129 == a186[0] && a41 == 9) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(62);
	    }
	    if(((((39 == a11[4]) && a54 == 12) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(63);
	    }
	    if((((a191 == 35 && a150 == 2) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(64);
	    }
	    if(((((39 == a11[4]) && ((64 < a78) && (257 >= a78))) && (98 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(65);
	    }
	    if((((a57 == a49[1] && a161 == a19[4]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(66);
	    }
	    if((((((-111 < a44) && (51 >= a44)) && a155 == 12) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(67);
	    }
	    if((((a57 == a49[5] && a54 == 8) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(68);
	    }
	    if((((a103 == 8 && a129 == a186[5]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(69);
	    }
	    if((((a93 == 36 && a54 == 11) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(70);
	    }
	    if((((((-134 < a253) && (-53 >= a253)) && a155 == 9) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(71);
	    }
	    if((((a212 == a314[4] && a41 == 12) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(72);
	    }
	    if((((a103 == 1 && a129 == a186[5]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(73);
	    }
	    if((((a135 == 14 && a103 == 8) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(74);
	    }
	    if((((a358 == a310[0] && a103 == 5) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(75);
	    }
	    if((((a75 == a176[0] && a155 == 13) && a13 == 32) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(76);
	    }
	    if((((a98 == a67[2] && a180 == a35[3]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(77);
	    }
	    if(((((24 == a62[5]) && a54 == 5) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(78);
	    }
	    if((((a116 == a53[3] && a180 == a35[1]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(79);
	    }
	    if((((a2 == a139[7] && a41 == 8) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(80);
	    }
	    if((((406 < a91 && a103 == 3) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(81);
	    }
	    if((((((41 < a91) && (252 >= a91)) && a103 == 3) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(82);
	    }
	    if((((a130 == 4 && a129 == a186[7]) && (22 == a20[3])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(83);
	    }
	    if((((a41 == 12 && a180 == a35[7]) && a13 == 36) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(84);
	    }
	    if((((((34 < a78) && (64 >= a78)) && a161 == a19[0]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(85);
	    }
	    if((((a135 == 12 && a103 == 8) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(86);
	    }
	    if((((a43 == a61[3] && a150 == 9) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(87);
	    }
	    if((((a129 == a186[4] && a41 == 9) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(88);
	    }
	    if((((a103 == 1 && a161 == a19[5]) && a13 == 34) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(89);
	    }
	    if((((a54 == 7 && a78 <=  34) && (98 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(90);
	    }
	    if(((((106 == a163[4]) && a150 == 5) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(91);
	    }
	    if((((a191 == 32 && a150 == 2) && (110 == a381[4])) && (85 == a42[5]))){
	    cf = 0;
	    __VERIFIER_error(92);
	    }
	    if((((a193 == 6 && a41 == 11) && (33 == a20[2])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(93);
	    }
	    if((((a185 <=  93 && (58 == a256[2])) && (30 == a20[5])) && (90 == a42[4]))){
	    cf = 0;
	    __VERIFIER_error(94);
	    }
	    if((((a399 == 5 && a54 == 9) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(95);
	    }
	    if((((a57 == a49[2] && a54 == 8) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(96);
	    }
	    if((((a135 == 10 && a103 == 8) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(97);
	    }
	    if((((a93 == 32 && a54 == 11) && a13 == 35) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(98);
	    }
	    if((((a358 == a310[4] && a103 == 5) && a13 == 33) && (94 == a42[2]))){
	    cf = 0;
	    __VERIFIER_error(99);
	    }
	}
 void calculate_outputm14(int input) {
    if(((((((98 == a381[4]) && ((((34 < a78) && (64 >= a78)) && (input == inputs[1] && ((85 == a42[5]) && ( cf==1  && a169 <=  -145)))) && (75 == a306[5]))) && a344 <=  -188) && a293 == a311[0]) && a347 <=  -166) && (a344 <=  -188 && a232 == 33))) {
	if((a4 + 20) > a4){
	a4  +=  2 ;}
	 else{	
	a4  +=  0;}
    	cf = 0;
    	if((((a258 <=  -43 && a260 <=  157) && a324 == a341[4]) || a129 == 3)) {
    	a219 = a388;
    	a376 = ((((((a169 * a78) % 14999) - 13311) - 1329) % 66) - -331);
    	a204 = ((a388 - a388) + 12);
    	a295 = a302[(a380 - 2)];
    	a328 = (a394 - -5);
    	a356 = (((((a356 * a376) % 14999) - 14459) - 101) - 232);
    	a236 = a329;
    	a230 = 34 ;
    	a344 = (((((a344 * a280) % 14999) - 7546) + 8271) + -8094);
    	a324 = a341[(a219 + -6)];
    	a394 = ((a388 - a219) + 1);
    	a257 = ((((((a257 * a376) % 14999) % 72) - -306) + 0) - 0);
    	a330 = a391[(a328 + -4)];
    	a13 = 34 ;
    	a354 = ((((((a354 * a280) % 14999) / 5) - 21239) % 57) + -39);
    	a299 = 34 ;
    	a215 = a223;
    	a369 = (a388 - -2);
    	a370 = 33 ;
    	a234 = a214;
    	a264 = a393;
    	a355 = a235[(a219 + -8)];
    	a161 = a19[3];
    	a279 = (((((((a169 * a280) % 14999) + -14708) / 5) / 5) % 81) + 301);
    	a362 = a242[(a369 - 8)];
    	a326 = a321;
    	a277 = a382;
    	a322 = 34 ;
    	a380 = ((a388 - a208) + 6);
    	a306 = a213;
    	a377 = a374[((a369 / a388) + 1)];
    	a347 = (((((((a347 * a260) % 14999) % 87) + 40) + -16812) - -26402) + -9590);
    	a387 = 34 ;
    	a287 = 34 ;
    	a42 = a34;
    	a293 = a311[(a388 + -8)];
    	a232 = 34 ;
    	a386 = 12;
    	a388 = (a208 + 2); 
    	}else {
    	a230 = 34 ;
    	a306 = a213;
    	a344 = ((((((((a354 * a347) % 14999) % 90) + -28) + -53) * 5) % 90) + -14);
    	a219 = ((a388 / a388) + 7);
    	a330 = a391[(a219 + -6)];
    	a347 = ((((((a347 * a344) % 14999) * 2) % 87) - -39) + 1);
    	a180 = a35[(a388 + -2)];
    	a326 = a360;
    	a257 = ((((((a344 * a344) % 72) + 306) - 0) / 5) - -248);
    	a394 = (a208 + -5);
    	a295 = a302[((a304 / a388) - -1)];
    	a42 = a34;
    	a376 = ((((((a260 * a344) % 14999) % 66) + 314) + 0) - 0);
    	a277 = a382;
    	a380 = (a388 - 2);
    	a299 = 34 ;
    	a13 = 36 ;
    	a264 = a393;
    	a293 = a311[(a388 + -6)];
    	a322 = 34 ;
    	a377 = a374[(a328 - 2)];
    	a362 = a242[(a380 + -4)];
    	a279 = ((((((a344 * a344) + -9808) % 81) + 249) - -18666) + -18665);
    	a287 = 34 ;
    	a232 = 34 ;
    	a370 = 34 ;
    	a356 = (((((((a356 * a78) % 14999) - -26724) + -25613) * 2) % 34) - 53);
    	a354 = ((((((a354 * a257) % 14999) + -4962) - -27061) % 57) - 118);
    	a387 = 34 ;
    	a234 = a214;
    	a102 = a17[6];
    	a236 = a329;
    	a369 = (a388 + 2);
    	a215 = a223;
    	a328 = ((a388 - a388) - -6);
    	a388 = 10;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((a355 == a235[0] && (input == inputs[3] && ( cf==1  && (98 == a381[4])))) && (29 == a326[5])) && a257 <=  19) && (((((((34 < a78) && (64 >= a78)) && a344 <=  -188) && a380 == 4) && a169 <=  -145) && (85 == a42[5])) && a387 == 33))) {
    	cf = 0;
    	a103 = (a328 - -1);
    	a13 = 33 ;
    	a394 = (a380 - 1);
    	a322 = 34 ;
    	a236 = a329;
    	a356 = ((((((a356 * a280) % 14999) % 34) + -53) + 1) + -2);
    	a387 = 34 ;
    	a230 = 34 ;
    	a362 = a242[((a204 * a328) - 46)];
    	a42 = a34;
    	a234 = a214;
    	a328 = ((a204 * a103) - 54);
    	a358 = a310[(a103 + -1)]; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((a380 == 4 && a347 <=  -166) && (a344 <=  -188 && (((85 == a42[5]) && (input == inputs[2] && (a370 == 33 && (((34 < a78) && (64 >= a78)) && (((a169 <=  -145 &&  cf==1 ) && (98 == a381[4])) && a370 == 33))))) && a387 == 33)))) {
    	cf = 0;
    	a260 = (((((((a344 * a356) % 14999) - -6228) % 49) - -358) * 9) / 10);
    	a330 = a391[(a219 + -6)];
    	a208 = a219;
    	a355 = a235[(a219 + -6)];
    	a328 = (a208 + -2);
    	a280 = (((((((a376 * a347) % 14999) + 10214) - 5407) / 5) % 60) - -85);
    	a354 = ((((((a354 * a347) % 14999) + -12131) / 5) % 24) - 167);
    	a350 = a367;
    	a306 = a262;
    	a356 = (((((((a356 * a344) % 14999) % 27) - 123) / 5) * 10) / 2);
    	a295 = a302[(a388 + -7)];
    	a236 = a267;
    	a324 = a341[(a219 - 6)];
    	a377 = a374[(a328 - 4)];
    	a103 = (a394 + 1);
    	a217 = a233[((a219 * a219) - 48)];
    	a42 = a76;
    	a264 = a270;
    	a322 = 32 ;
    	a293 = a311[(a208 + -6)];
    	a257 = (((((((a257 * a280) % 14999) * 2) / 5) * 5) % 107) + 127);
    	a234 = a372;
    	a129 = a186[(a380 - -1)];
    	a230 = 32 ;
    	a204 = (a388 - -4);
    	a215 = a248;
    	a370 = 34 ;
    	a331 = 33 ;
    	a20 = a71;
    	a380 = (a388 + -3);
    	a387 = 32 ;
    	a232 = 32 ;
    	a326 = a201;
    	a344 = (((((((a78 * a347) % 14999) % 41) - 145) / 5) + -10464) - -10319);
    	a394 = ((a388 + a208) + -13);
    	a299 = 32 ;
    	a304 = (a388 + 1);
    	a362 = a242[((a388 * a219) + -55)];
    	a388 = (a208 + 2);
    	a347 = ((((((a347 * a376) % 14999) + 28186) + 487) % 58) - 145); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm15(int input) {
    if((((a287 == 33 && ((87 == a350[3]) && ((54 == a237[2]) && (((64 < a78) && (257 >= a78)) && (8 == a264[3]))))) && (64 == a236[3])) && ((((98 == a381[4]) && (( cf==1  && (31 == a11[2])) && input == inputs[4])) && a362 == a242[0]) && (85 == a42[5])))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a224 = a342[(a394 + 1)];
    	a376 = (((((((a376 * a78) % 14999) * 2) / 5) / 5) % 66) - -315);
    	a287 = 34 ;
    	a362 = a242[((a328 * a394) - 2)];
    	a299 = 34 ;
    	a293 = a311[(a394 + 1)];
    	a236 = a329;
    	a13 = 34 ;
    	a304 = (a328 - -5);
    	a42 = a34;
    	a306 = a262;
    	a264 = a393;
    	a354 = (((((((a354 * a257) % 14999) + -14127) % 57) + -43) - -2107) + -2105);
    	a234 = a214;
    	a230 = 34 ;
    	a204 = (a304 + 3);
    	a355 = a235[(a328 + -2)];
    	a380 = (a328 + 2);
    	a369 = (a204 + -2);
    	a279 = ((((((a376 * a257) % 14999) % 81) + 222) - 9068) + 9072);
    	a295 = a302[(a204 + -10)];
    	a350 = a323;
    	a388 = (a219 + 4);
    	a215 = a223;
    	a232 = 34 ;
    	a219 = (a394 - -7);
    	a237 = a345;
    	a161 = a19[2];
    	a217 = a233[(a208 - 6)];
    	a398 = a339;
    	a330 = a391[(a388 - 8)];
    	a344 = ((((((((a344 * a257) % 14999) % 90) - 13) + -2) * 5) % 90) - 14);
    	a328 = (a394 + 5);
    	a370 = 34 ;
    	a324 = a341[((a304 + a208) - 15)];
    	a347 = (((((((a347 * a257) % 14999) % 87) - -39) - 22419) + -6845) - -29265);
    	a280 = ((((((a356 * a257) % 14999) - 1162) % 17) - -172) - 9);
    	a394 = 3;
    	a322 = 34 ;
    	a356 = (((((((a356 * a257) % 14999) / 5) % 34) - 53) + 8366) - 8365); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a394 == 1 && (a356 <=  -144 && (a322 == 33 && ((64 < a78) && (257 >= a78))))) && input == inputs[1]) && a355 == a235[0]) && ((85 == a42[5]) && ((((31 == a11[2]) && ( cf==1  && (98 == a381[4]))) && a388 == 8) && a217 == a233[0])))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a237 = a345;
    	a362 = a242[(a388 + -6)];
    	a217 = a233[(a388 - 6)];
    	a54 = (a369 - -2);
    	a230 = 34 ;
    	a293 = a311[((a394 + a204) - 9)];
    	a236 = a329;
    	a224 = a342[(a388 - 6)];
    	a13 = 35 ;
    	a287 = 34 ;
    	a350 = a323;
    	a232 = 34 ;
    	a370 = 34 ;
    	a161 = a19[a219];
    	a380 = ((a388 + a388) - 10);
    	a322 = 34 ;
    	a42 = a34; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a293 == a311[0] && (((45 == a234[3]) && a219 == 6) && a370 == 33)) && ((input == inputs[2] && ((31 == a11[2]) && (a299 == 33 && ((85 == a42[5]) && (((64 < a78) && (257 >= a78)) && ((98 == a381[4]) &&  cf==1 )))))) && a356 <=  -144))) {
    	cf = 0;
    	a230 = 34 ;
    	a394 = (a204 + -7);
    	a280 = ((((((a257 * a257) % 14999) / 5) - 2839) * 5) - 12405);
    	a362 = a242[(a394 - 1)];
    	a232 = 34 ;
    	a354 = ((((((((a354 * a279) % 14999) % 57) - 86) * 5) + -29084) % 57) + -61);
    	a350 = a323;
    	a299 = 34 ;
    	a103 = ((a380 - a388) - -6);
    	a234 = a214;
    	a388 = a204;
    	a376 = ((((((((a376 * a347) % 14999) % 66) - -315) * 1) * 5) % 66) - -258);
    	a330 = a391[(a304 - 5)];
    	a304 = (a204 + -1);
    	a369 = (a208 + 2);
    	a13 = 33 ;
    	a236 = a329;
    	a200 = a152[(a219 - 2)];
    	a324 = a341[(a394 + -1)];
    	a356 = ((((((a356 * a344) % 14999) % 34) + -57) / 5) * 5);
    	a264 = a393;
    	a217 = a233[(a328 + -2)];
    	a42 = a34;
    	a219 = (a204 + -2);
    	a344 = (((((a354 * a354) % 90) - 66) + -20) + -3);
    	a215 = a223;
    	a322 = 34 ;
    	a295 = a302[((a103 - a208) - -8)];
    	a224 = a342[((a369 - a204) - -2)];
    	a328 = ((a394 + a204) - 7); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((((a347 <=  -166 && ((98 == a381[4]) && ((a376 <=  121 && (45 == a234[3])) && (31 == a11[2])))) && a304 == 7) && a324 == a341[0]) && a232 == 33) && (((((64 < a78) && (257 >= a78)) &&  cf==1 ) && input == inputs[3]) && (85 == a42[5])))) {
	if((a4 + 20) > a4){
	a4  +=  1 ;}
	 else{	
	a4  +=  0;}
	if((a167 - 20) < a167){
	a167  -=  4 ;}
	 else{	
	a167  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
	if((a157 + 20) > a157){
	a157  +=  1 ;}
	 else{	
	a157  +=  0;}
    	cf = 0;
    	a362 = a242[(a394 + 1)];
    	a217 = a233[(a219 - 4)];
    	a234 = a214;
    	a204 = (a369 + 4);
    	a388 = ((a304 * a304) + -39);
    	a356 = ((((((((a356 * a260) % 14999) % 34) + -51) + -2) * 5) % 34) + -51);
    	a215 = a223;
    	a103 = ((a328 - a380) - -7);
    	a295 = a302[(a204 - 10)];
    	a9 = a66;
    	a219 = ((a369 / a369) - -7);
    	a13 = 33 ;
    	a344 = (((((((a344 * a376) % 14999) - 7599) * 1) - 4078) % 90) - 13);
    	a264 = a393;
    	a354 = ((((((((a354 * a347) % 14999) % 57) - 108) * 9) / 10) - 21797) - -21771);
    	a237 = a345;
    	a322 = 34 ;
    	a328 = (a304 - 1);
    	a330 = a391[((a304 * a388) - 68)];
    	a355 = a235[((a304 + a304) + -12)];
    	a376 = (((((((a78 * a78) % 14999) / 5) % 66) + 281) + -1310) + 1331);
    	a224 = a342[(a380 - 2)];
    	a350 = a323;
    	a42 = a34;
    	a380 = (a208 + -2);
    	a230 = 34 ;
    	a299 = 34 ;
    	a232 = 34 ;
    	a394 = (a304 - 4);
    	a287 = 34 ;
    	a324 = a341[((a304 + a304) + -12)];
    	a370 = 34 ;
    	a293 = a311[((a304 * a369) - 54)];
    	a236 = a329;
    	a369 = ((a304 + a304) - 4);
    	a304 = 9; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm17(int input) {
    if((((98 == a381[4]) && ((((64 < a78) && (257 >= a78)) && ((44 == a11[3]) && ( cf==1  && input == inputs[1]))) && a328 == 4)) && (a304 == 7 && (((8 == a264[3]) && (a377 == a374[0] && ((85 == a42[5]) && a219 == 6))) && a324 == a341[0])))) {
    	cf = 0;
    	if(((!(a224 == 6) || a260 <=  157) || a217 == 8)) {
    	a232 = 36 ;
    	a355 = a235[7];
    	a103 = ((a394 / a208) - -5);
    	a377 = a374[7];
    	a299 = 35 ;
    	a330 = a391[5];
    	a219 = 12;
    	a359 = 35 ;
    	a344 = (((((a344 * 1) / 5) + 20258) * -1) / 10);
    	a304 = 13;
    	a326 = a201;
    	a369 = 14;
    	a264 = a273;
    	a324 = a341[0];
    	a356 = (((a356 * 1) - 0) - -30081);
    	a354 = ((((a354 % 14903) - 194) + -13287) / 5);
    	a230 = 35 ;
    	a13 = 33 ;
    	a358 = a310[(a394 - -2)];
    	a293 = a311[4];
    	a376 = (((((a376 + 13047) * 1) - 8010) % 14809) + 15190);
    	a204 = 16;
    	a347 = ((((a347 % 58) + -106) - 28857) + 28878);
    	a295 = a302[6];
    	a331 = 33 ;
    	a387 = 32 ;
    	a279 = ((((100 / 5) * 10) / -5) * 5);
    	a42 = a34;
    	a328 = 5;
    	a215 = a205;
    	a380 = 4;
    	a236 = a267;
    	a322 = 35 ;
    	a350 = a283;
    	a277 = a368;
    	a208 = 6;
    	a370 = 32 ;
    	a234 = a372;
    	a394 = 5; 
    	}else {
    	a331 = 32 ;
    	a234 = a372;
    	a387 = 33 ;
    	a322 = 32 ;
    	a236 = a267;
    	a356 = (((((a356 + 26582) - 17316) + -1958) % 27) - 114);
    	a328 = 10;
    	a394 = 7;
    	a103 = 5;
    	a324 = a341[6];
    	a204 = 10;
    	a230 = 33 ;
    	a13 = 33 ;
    	a358 = a310[(a208 + -2)];
    	a350 = a367;
    	a42 = a34;
    	a208 = 12;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if((((98 == a381[4]) && ((((87 == a277[4]) && ((44 == a11[3]) && ((85 == a42[5]) &&  cf==1 ))) && a219 == 6) && a322 == 33)) && (((((87 == a350[3]) && a359 == 33) && input == inputs[4]) && a380 == 4) && ((64 < a78) && (257 >= a78))))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a215 = a223;
    	a287 = 36 ;
    	a260 = (((((19 / 5) * 1391) / 10) + -13670) + 25961);
    	a376 = (((((a376 % 14809) + 15190) - 24057) - -24008) - -50);
    	a331 = 32 ;
    	a237 = a345;
    	a388 = 9;
    	a257 = (((49 - -2257) * 5) - -15469);
    	a277 = a382;
    	a224 = a342[2];
    	a359 = 35 ;
    	a306 = a250;
    	a78 = (((a78 - -5097) * 5) - -2008);
    	a72 = a94; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((a387 == 33 && (((85 == a42[5]) && a304 == 7) && a322 == 33)) && ((((((44 == a11[3]) && (input == inputs[0] && ( cf==1  && ((64 < a78) && (257 >= a78))))) && (98 == a381[4])) && a331 == 33) && a347 <=  -166) && a370 == 33))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a13 = 36 ;
    	a180 = a35[(a328 - -1)];
    	a42 = a34;
    	a31 = a22[2]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((((((a356 <=  -144 && ((64 < a78) && (257 >= a78))) && (64 == a236[3])) && (44 == a11[3])) && a204 == 10) && a377 == a374[0]) && a324 == a341[0]) && (8 == a264[3])) && ((input == inputs[3] && ((98 == a381[4]) &&  cf==1 )) && (85 == a42[5])))) {
    	cf = 0;
    	a155 = (a219 - -7);
    	a75 = a176[(a380 - 4)];
    	a13 = 32 ;
    	a42 = a34; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a355 == a235[0] && (a376 <=  121 && ((((44 == a11[3]) &&  cf==1 ) && input == inputs[2]) && a347 <=  -166))) && ((((64 < a78) && (257 >= a78)) && ((((85 == a42[5]) && a232 == 33) && a344 <=  -188) && (98 == a381[4]))) && a380 == 4))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	if((((!(a330 == a391[6]) && (a28 == 36 && (98 == a277[3]))) || a230 == 34) && -28 < a354)) {
    	a295 = a302[7];
    	a328 = 9;
    	a331 = 33 ;
    	a322 = 33 ;
    	a208 = 13;
    	a293 = a311[4];
    	a356 = (((a356 * 1) * 1) * -1);
    	a376 = (((((a376 - 0) % 63) - -184) / 5) + 128);
    	a380 = 9;
    	a42 = a34;
    	a394 = 1;
    	a369 = 13;
    	a304 = 7;
    	a230 = 35 ;
    	a377 = a374[6];
    	a215 = a248;
    	a330 = a391[5];
    	a103 = 3;
    	a236 = a397;
    	a204 = 10;
    	a347 = (((((a347 - 0) - -15619) + 9929) % 58) - 106);
    	a355 = a235[5];
    	a354 = ((((a354 / -5) * 10) / 9) * 4);
    	a350 = a367;
    	a326 = a201;
    	a324 = a341[3];
    	a370 = 32 ;
    	a13 = 33 ;
    	a264 = a270;
    	a387 = 36 ;
    	a232 = 32 ;
    	a91 = ((((((((a78 * a78) % 14999) % 76) - -296) * 9) / 10) + -765) + 756); 
    	}else {
    	a215 = a248;
    	a42 = a34;
    	a322 = 33 ;
    	a354 = (((a354 + 30150) + 14) * 1);
    	a295 = a302[3];
    	a236 = a267;
    	a304 = 10;
    	a324 = a341[3];
    	a369 = 8;
    	a356 = ((((a356 % 14928) - 144) * 1) + -12781);
    	a232 = 32 ;
    	a380 = 7;
    	a376 = ((((a376 + 0) % 14809) - -15190) + 1);
    	a350 = a283;
    	a293 = a311[0];
    	a208 = 11;
    	a370 = 32 ;
    	a75 = a176[(a219 + -5)];
    	a204 = 10;
    	a387 = 33 ;
    	a277 = a338;
    	a328 = 11;
    	a230 = 36 ;
    	a326 = a201;
    	a394 = 5;
    	a355 = a235[0];
    	a264 = a273;
    	a13 = 32 ;
    	a347 = (((((a347 / 5) % 58) - 79) * 9) / 10);
    	a155 = 13;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm18(int input) {
    if((((54 == a237[2]) && (a232 == 33 && (a219 == 6 && ((98 == a381[4]) && ((85 == a42[5]) && a344 <=  -188))))) && (a328 == 4 && (a370 == 33 && ((44 == a72[5]) && (( cf==1  && 257 < a78) && input == inputs[1])))))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(((a116 == 14 && a208 == 8) && a180 == a35[1])) {
    	a224 = a342[5];
    	a347 = (((((a347 % 14917) + -166) * 10) / 9) * 1);
    	a236 = a397;
    	a370 = 33 ;
    	a328 = 4;
    	a208 = 11;
    	a103 = 8;
    	a322 = 36 ;
    	a394 = 5;
    	a260 = (((((a260 % 79) - -237) + 1) - 24401) - -24400);
    	a13 = 33 ;
    	a42 = a34;
    	a387 = 33 ;
    	a299 = 35 ;
    	a230 = 33 ;
    	a232 = 32 ;
    	a330 = a391[6];
    	a350 = a283;
    	a135 = (a103 + 2); 
    	}else {
    	a42 = a34;
    	a103 = (a204 + -9);
    	a13 = 33 ;
    	a52 = a189;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((54 == a237[2]) && ((64 == a236[3]) && ((a295 == a302[0] && a354 <=  -194) && (98 == a381[4])))) && (a324 == a341[0] && ((44 == a72[5]) && (257 < a78 && (a304 == 7 && (input == inputs[4] && ((85 == a42[5]) &&  cf==1 )))))))) {
    	cf = 0;
    	a362 = a242[0];
    	a344 = (((((a344 % 90) - -22) + 18158) / 5) + -3591);
    	a208 = 8;
    	a331 = 36 ;
    	a219 = 8;
    	a322 = 35 ;
    	a299 = 34 ;
    	a376 = ((((41 * 94) / 10) - -16413) * 1);
    	a237 = a345;
    	a295 = a302[2];
    	a387 = 34 ;
    	a324 = a341[6];
    	a355 = a235[5];
    	a380 = 8;
    	a354 = (((((a354 * 1) / 5) / 5) % 57) - 51);
    	a224 = a342[2];
    	a129 = a186[((a328 / a369) - -4)];
    	a280 = (((((30 * 9) / 10) + 64) + -1252) + 1233);
    	a234 = a305;
    	a204 = 16;
    	a377 = a374[0];
    	a260 = ((((a260 % 14791) + 15207) * 1) + 1);
    	a264 = a393;
    	a20 = a71;
    	a257 = (((((a257 % 72) - -308) - 1) / 5) - -231);
    	a370 = 34 ;
    	a279 = ((((31 * 10) / -8) * 5) + -14226);
    	a369 = 15;
    	a217 = a233[7];
    	a287 = 36 ;
    	a293 = a311[6];
    	a330 = a391[5];
    	a394 = 3;
    	a388 = 15;
    	a326 = a321;
    	a236 = a329;
    	a232 = 36 ;
    	a359 = 36 ;
    	a304 = 13;
    	a42 = a76;
    	a356 = (((((a356 % 14928) + -144) + -8970) * 10) / 9);
    	a156 = 36 ;
    	a350 = a283;
    	a230 = 33 ;
    	a347 = ((((a347 - -588) % 14917) + -15082) * 1);
    	a328 = 8; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((a230 == 33 && ((85 == a42[5]) && (input == inputs[3] && a293 == a311[0]))) && (29 == a326[5])) && (((a224 == a342[0] && (((98 == a381[4]) && ( cf==1  && 257 < a78)) && (44 == a72[5]))) && (87 == a350[3])) && a388 == 8))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a277 = a382;
    	a280 = (((97 + -28042) + -1573) - -29671);
    	a322 = 35 ;
    	a376 = ((((55 * 5) + -86) - -28105) + -28154);
    	a279 = (((20 - -28657) - 40039) + 11588);
    	a257 = (((((a257 - -3673) * 1) - -25409) % 14809) + 15189);
    	a331 = 34 ;
    	a217 = a233[5];
    	a287 = 35 ;
    	a355 = a235[0];
    	a359 = 34 ;
    	a328 = 6;
    	a295 = a302[0];
    	a215 = a223;
    	a326 = a321;
    	a98 = a67[(a369 - 3)];
    	a394 = 6;
    	a43 = a61[1];
    	a237 = a345;
    	a306 = a213;
    	a330 = a391[1];
    	a324 = a341[5];
    	a381 = a390; 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((a394 == 1 && (a322 == 33 && (((input == inputs[0] && ((64 == a236[3]) && (44 == a72[5]))) && a347 <=  -166) && a295 == a302[0]))) && ((98 == a381[4]) && ((((85 == a42[5]) &&  cf==1 ) && 257 < a78) && a377 == a374[0])))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if(a25 == a3[7]) {
    	a131 = 35 ;
    	a150 = ((a380 + a204) - 11);
    	a381 = a395; 
    	}else {
    	a103 = (a204 + -5);
    	a13 = 33 ;
    	a358 = a310[(a103 + -3)];
    	a42 = a34;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a394 == 1 && (((a322 == 33 && ((( cf==1  && (44 == a72[5])) && (85 == a42[5])) && input == inputs[2])) && a260 <=  157) && 257 < a78)) && (a257 <=  19 && (((29 == a326[5]) && a355 == a235[0]) && (98 == a381[4]))))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a42 = a34;
    	a204 = 15;
    	a377 = a374[1];
    	a224 = a342[1];
    	a237 = a298;
    	a13 = 35 ;
    	a54 = ((a394 - a380) - -15);
    	a236 = a397;
    	a11 = a40;
    	a208 = 6;
    	a299 = 33 ;
    	a322 = 32 ;
    	a287 = 35 ;
    	a387 = 33 ;
    	a232 = 36 ;
    	a350 = a367;
    	a380 = 7;
    	a354 = (((a354 * 1) * -1) + 0);
    	a394 = 1; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm1(int input) {
    if(((a322 == 33 && ((((34 < a78) && (64 >= a78)) &&  cf==1 ) && (43 == a215[5]))) && (a370 == 33 && ((a355 == a235[0] && a394 == 1) && (64 == a236[3]))))) {
    	if((((a362 == a242[0] && (a169 <=  -145 &&  cf==1 )) && a356 <=  -144) && (a293 == a311[0] && (a377 == a374[0] && ((8 == a264[3]) && (75 == a306[5])))))) {
    		calculate_outputm14(input);
    	} 
    } 
    if((((a230 == 33 && ((((64 < a78) && (257 >= a78)) &&  cf==1 ) && a369 == 8)) && (43 == a215[5])) && ((a299 == 33 && a204 == 10) && a322 == 33))) {
    	if(((a217 == a233[0] && ((( cf==1  && (31 == a11[2])) && a380 == 4) && a224 == a342[0])) && ((a230 == 33 && a322 == 33) && a356 <=  -144))) {
    		calculate_outputm15(input);
    	} 
    	if((((a230 == 33 && (((45 == a234[3]) && a380 == 4) && a387 == 33)) && a330 == a391[0]) && (( cf==1  && (44 == a11[3])) && (29 == a326[5])))) {
    		calculate_outputm17(input);
    	} 
    } 
    if((((a208 == 6 && (257 < a78 &&  cf==1 )) && a293 == a311[0]) && ((a387 == 33 && (a224 == a342[0] && (29 == a326[5]))) && a287 == 33))) {
    	if((((8 == a264[3]) && a204 == 10) && ((a322 == 33 && (((64 == a236[3]) && ( cf==1  && (44 == a72[5]))) && (87 == a350[3]))) && a219 == 6))) {
    		calculate_outputm18(input);
    	} 
    } 
}
 void calculate_outputm19(int input) {
    if((((((64 == a137[4]) && ((85 == a42[5]) && ((104 == a381[4]) && a369 == 8))) && a230 == 33) && a388 == 8) && ((((a98 == a67[1] && (input == inputs[4] &&  cf==1 )) && a330 == a391[0]) && (43 == a215[5])) && a295 == a302[0]))) {
    	cf = 0;
    	a354 = (((((((a344 * a356) % 14999) % 57) + -111) - -18872) + -16579) - 2323);
    	a324 = a341[(a219 - 6)];
    	a279 = ((((((a347 * a344) % 14999) / 5) / 5) % 81) + 239);
    	a257 = ((((((((a347 * a344) % 14999) - -11328) % 72) - -244) * 5) % 72) + 271);
    	a264 = a393;
    	a326 = a360;
    	a306 = a262;
    	a359 = 34 ;
    	a293 = a311[((a304 + a380) + -10)]; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a388 == 8 && ((a219 == 6 && (((input == inputs[1] && ((85 == a42[5]) &&  cf==1 )) && (104 == a381[4])) && (64 == a137[4]))) && (54 == a237[2]))) && (((a377 == a374[0] && a204 == 10) && a98 == a67[1]) && a295 == a302[0]))) {
    	cf = 0;
    	a208 = (a204 + -2);
    	a394 = (a369 + -7);
    	a215 = a223;
    	a322 = 34 ;
    	a330 = a391[(a219 + -4)];
    	a277 = a382;
    	a224 = a342[(a208 + -6)];
    	a161 = a19[6];
    	a299 = 34 ;
    	a380 = ((a369 / a369) - -5);
    	a13 = 34 ;
    	a362 = a242[(a369 - 6)];
    	a304 = (a219 + 3);
    	a295 = a302[((a328 * a328) - 34)];
    	a232 = 33 ;
    	a230 = 34 ;
    	a42 = a34;
    	a355 = a235[(a208 - 6)];
    	a377 = a374[(a208 - a219)];
    	a287 = 34 ;
    	a344 = ((((((a347 * a376) % 14999) - -24189) / 5) % 90) + -48);
    	a234 = a214;
    	a204 = ((a388 + a380) - 2);
    	a370 = 34 ;
    	a29 = 17;
    	a237 = a349;
    	a388 = (a208 - -2);
    	a356 = (((((((a356 * a344) % 14999) + -12325) * 1) - -24471) % 34) - 52);
    	a219 = a369;
    	a369 = (a208 - -2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a295 == a302[0] && ((a362 == a242[0] && ((85 == a42[5]) && ((87 == a277[4]) && a98 == a67[1]))) && a370 == 33)) && (a330 == a391[0] && (((((104 == a381[4]) &&  cf==1 ) && input == inputs[3]) && (64 == a137[4])) && a304 == 7)))) {
    	cf = 0;
    	a208 = ((a388 + a394) + -3);
    	a299 = 34 ;
    	a347 = ((((((a347 * a344) % 14999) % 87) - 6) * 5) / 5);
    	a217 = a233[(a394 - 1)];
    	a135 = (a380 + 6);
    	a362 = a242[(a208 + -6)];
    	a103 = (a135 + -2);
    	a224 = a342[(a328 + -4)];
    	a13 = 33 ;
    	a331 = 34 ;
    	a322 = 34 ;
    	a370 = 34 ;
    	a230 = 34 ;
    	a42 = a34;
    	a330 = a391[(a394 + -1)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm20(int input) {
    if((((a331 == 33 && ((( cf==1  && a98 == a67[2]) && (85 == a42[5])) && (75 == a306[5]))) && ((12 < a268) && (43 >= a268))) && (input == inputs[4] && ((a304 == 7 && ((104 == a381[4]) && (a257 <=  19 && a328 == 4))) && (8 == a264[3]))))) {
	if((a167 + 20) > a167){
	a167  +=  3 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a13 = 36 ;
    	a180 = a35[3];
    	a42 = a34; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a280 <=  23 && (input == inputs[1] && a347 <=  -166)) && ((((((((104 == a381[4]) && ((85 == a42[5]) &&  cf==1 )) && a98 == a67[2]) && ((12 < a268) && (43 >= a268))) && a328 == 4) && a328 == 4) && a388 == 8) && a322 == 33))) {
    	cf = 0;
    	if((!(a25 == a3[6]) || (!(a212 == a314[7]) || a362 == 14))) {
    	a355 = a235[3];
    	a330 = a391[3];
    	a232 = 33 ;
    	a215 = a205;
    	a299 = 32 ;
    	a326 = a321;
    	a287 = 32 ;
    	a200 = a152[((a219 * a328) - 18)];
    	a304 = 14;
    	a257 = (((((a257 % 14809) - -15189) + -5765) * 1) - -5767);
    	a204 = 11;
    	a234 = a305;
    	a293 = a311[5];
    	a13 = 33 ;
    	a42 = a34;
    	a377 = a374[5];
    	a380 = 5;
    	a356 = ((((a356 + 0) + 20655) % 27) + -114);
    	a322 = 35 ;
    	a370 = 33 ;
    	a359 = 33 ;
    	a331 = 35 ;
    	a103 = (a208 - 4);
    	a328 = 8;
    	a306 = a250;
    	a217 = a233[7];
    	a354 = (((a354 * -1) - 0) * 1);
    	a260 = ((((a260 % 14791) + 15207) - 0) + 1);
    	a224 = a342[4];
    	a347 = ((((a347 % 58) + -91) + -10551) + 10590);
    	a208 = 13;
    	a376 = ((((((a376 + 16899) % 63) + 184) * 5) % 63) + 159);
    	a280 = (((((a280 - 0) - 0) * 1) % 14909) + 15090);
    	a279 = (((((88 * 38) / 10) + -28089) * 1) + 50327);
    	a388 = 8;
    	a394 = 8;
    	a344 = (((a344 * 1) + 30129) * 1);
    	a230 = 35 ;
    	a264 = a273;
    	a236 = a267;
    	a324 = a341[7];
    	a219 = 11; 
    	}else {
    	a362 = a242[5];
    	a326 = a321;
    	a277 = a382;
    	a280 = (((((a280 % 15011) - 14987) - -19209) + 4708) + -23917);
    	a369 = 13;
    	a54 = ((a204 + a208) + -7);
    	a264 = a270;
    	a257 = ((((a257 % 14809) - -15189) * 1) - -1);
    	a299 = 33 ;
    	a293 = a311[5];
    	a322 = 35 ;
    	a204 = 15;
    	a328 = 8;
    	a98 = a67[(a54 + -2)];
    	a260 = (((((a260 - 0) % 79) - -237) + -4122) + 4122);
    	a236 = a267;
    	a380 = 5;
    	a232 = 36 ;
    	a208 = 6;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((a217 == a233[0] && (a219 == 6 && (a322 == 33 && (a380 == 4 && ((((input == inputs[2] && ((104 == a381[4]) && ((85 == a42[5]) && ( cf==1  && ((12 < a268) && (43 >= a268)))))) && (64 == a236[3])) && a331 == 33) && a98 == a67[2])))))) {
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a215 = a205;
    	a42 = a34;
    	a380 = 8;
    	a232 = 35 ;
    	a217 = a233[1];
    	a264 = a273;
    	a347 = (((((a347 * 1) - -14638) - 9456) % 14917) + -15082);
    	a287 = 33 ;
    	a208 = 9;
    	a388 = 9;
    	a236 = a397;
    	a326 = a201;
    	a322 = 32 ;
    	a13 = 35 ;
    	a54 = 8;
    	a224 = a342[1];
    	a370 = 35 ;
    	a57 = a49[(a394 - -4)]; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((43 == a215[5]) && (a257 <=  19 && (a224 == a342[0] && a370 == 33))) && (a232 == 33 && (a98 == a67[2] && (((input == inputs[3] && (( cf==1  && (85 == a42[5])) && ((12 < a268) && (43 >= a268)))) && (104 == a381[4])) && a208 == 6))))) {
    	cf = 0;
    	a131 = 35 ;
    	a150 = (a388 - 5);
    	a381 = a395; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a331 == 33 && ((input == inputs[0] && a280 <=  23) && (104 == a381[4]))) && ((12 < a268) && (43 >= a268))) && a388 == 8) && ((a299 == 33 && (((85 == a42[5]) && (a98 == a67[2] &&  cf==1 )) && a293 == a311[0])) && a380 == 4))) {
    	cf = 0;
    	a42 = a34;
    	a116 = a53[(a204 - 7)];
    	a13 = 36 ;
    	a180 = a35[(a304 - 6)]; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
}
 void calculate_outputm25(int input) {
    if((((input == inputs[4] && ((43 == a215[5]) && a304 == 7)) && (8 == a264[3])) && ((85 == a42[5]) && (a293 == a311[0] && (((((a43 == a61[1] &&  cf==1 ) && a98 == a67[5]) && (104 == a381[4])) && (45 == a234[3])) && a208 == 6))))) {
    	cf = 0;
    	a264 = a270;
    	a344 = ((((a344 - 0) * 1) + 7008) + 23130);
    	a350 = a367;
    	a204 = 11;
    	a299 = 36 ;
    	a42 = a34;
    	a370 = 36 ;
    	a369 = 9;
    	a354 = ((((31 - 28167) - -27985) * 5) + 593);
    	a236 = a397;
    	a388 = 11;
    	a324 = a341[1];
    	a29 = ((a208 - a219) - -17);
    	a326 = a321;
    	a377 = a374[4];
    	a280 = (((((a280 * 1) % 60) + 83) / 5) + 86);
    	a328 = 10;
    	a161 = a19[(a29 - 11)];
    	a293 = a311[6];
    	a394 = 2;
    	a257 = (((73 + 7475) / 5) - 13482);
    	a304 = 8;
    	a279 = ((((a279 % 14834) - -15164) - -639) * 1);
    	a306 = a250;
    	a230 = 32 ;
    	a387 = 33 ;
    	a356 = (((((a356 * 1) / 5) - -25315) * -1) / 10);
    	a277 = a368;
    	a260 = (((((a260 + 6932) - 799) + -3963) % 15078) - 14920);
    	a380 = 8;
    	a208 = 11;
    	a376 = ((((a376 - -1394) % 63) - -184) - 0);
    	a13 = 34 ;
    	a287 = 36 ;
    	a234 = a372;
    	a224 = a342[7];
    	a359 = 33 ;
    	a215 = a248;
    	a355 = a235[7];
    	a219 = 10; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a208 == 6 && ((((a232 == 33 && (85 == a42[5])) && a370 == 33) && a43 == a61[1]) && a260 <=  157)) && (a293 == a311[0] && ((a344 <=  -188 && (((104 == a381[4]) &&  cf==1 ) && input == inputs[3])) && a98 == a67[5])))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a191 = 35 ;
    	a381 = a395;
    	a150 = 2; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a304 == 7 && (a224 == a342[0] && ((input == inputs[2] && (((( cf==1  && a98 == a67[5]) && a43 == a61[1]) && a388 == 8) && (85 == a42[5]))) && a304 == 7))) && (((104 == a381[4]) && a224 == a342[0]) && (75 == a306[5])))) {
    	cf = 0;
    	a362 = a242[0];
    	a208 = 11;
    	a232 = 33 ;
    	a377 = a374[0];
    	a322 = 36 ;
    	a354 = ((((61 * 10) / 9) * 5) * 5);
    	a256 = a312;
    	a370 = 36 ;
    	a280 = ((((a280 % 14909) + 15090) * 1) * 1);
    	a355 = a235[3];
    	a279 = ((((a279 - -12906) % 14834) - -15164) + 1);
    	a369 = 12;
    	a306 = a250;
    	a219 = 10;
    	a42 = a76;
    	a299 = 33 ;
    	a350 = a283;
    	a293 = a311[5];
    	a277 = a382;
    	a359 = 35 ;
    	a388 = 14;
    	a330 = a391[7];
    	a347 = (((a347 / 5) + -14217) - 8457);
    	a224 = a342[2];
    	a20 = a16;
    	a204 = 14;
    	a287 = 34 ;
    	a217 = a233[6];
    	a331 = 33 ;
    	a380 = 9;
    	a260 = ((((a260 % 15078) + -14920) + -1) - 2);
    	a295 = a302[6];
    	a236 = a397;
    	a257 = ((((11 / 5) + 322) + 4108) + -4128);
    	a215 = a223;
    	a376 = ((((a376 + 0) % 66) + 315) - -1);
    	a264 = a273;
    	a102 = a17[0]; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a280 <=  23 && ((85 == a42[5]) && ((a347 <=  -166 && a387 == 33) && a43 == a61[1]))) && (a204 == 10 && (a230 == 33 && ((a369 == 8 && (input == inputs[1] && ( cf==1  && a98 == a67[5]))) && (104 == a381[4])))))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a260 = (((((a260 % 14791) - -15207) - 24700) - 5156) - -29859);
    	a387 = 32 ;
    	a230 = 36 ;
    	a356 = (((((a356 + 0) % 27) - 100) * 9) / 10);
    	a204 = 11;
    	a331 = 36 ;
    	a237 = a349;
    	a370 = 33 ;
    	a277 = a338;
    	a42 = a34;
    	a219 = 11;
    	a208 = 7;
    	a369 = 12;
    	a161 = a19[(a380 + -1)];
    	a236 = a267;
    	a376 = (((a376 * 1) / 5) - 1217);
    	a304 = 11;
    	a13 = 34 ;
    	a350 = a367;
    	a377 = a374[6];
    	a279 = ((((a279 % 14834) + 15164) - 15110) - -18444);
    	a264 = a273;
    	a347 = ((((a347 % 58) - 101) + -3) + -4);
    	a293 = a311[4];
    	a232 = 34 ;
    	a359 = 36 ;
    	a388 = 12;
    	a386 = 14;
    	a299 = 32 ;
    	a280 = (((((a280 - -18666) * 1) * 1) % 14909) + 15090);
    	a362 = a242[2];
    	a224 = a342[5];
    	a380 = 5; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a380 == 4 && ((a98 == a67[5] && (input == inputs[0] && (64 == a236[3]))) && a299 == 33)) && ((a377 == a374[0] && ((104 == a381[4]) && (a204 == 10 && (( cf==1  && (85 == a42[5])) && a43 == a61[1])))) && a279 <=  -38))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	if((!(a212 == 13) && ((a290 == 32 && (a13 == 36 || a13 == 36)) || a299 == 33))) {
    	a359 = 32 ;
    	a295 = a302[6];
    	a224 = a342[6];
    	a230 = 35 ;
    	a387 = 36 ;
    	a260 = (((((a260 / 5) % 79) + 236) / 5) + 245);
    	a41 = 10;
    	a234 = a305;
    	a330 = a391[4];
    	a280 = ((((a280 % 15011) + -14987) + -3) + 0);
    	a217 = a233[3];
    	a354 = ((((7 * 10) / 9) + 6469) + 12388);
    	a304 = 12;
    	a388 = 12;
    	a264 = a273;
    	a42 = a76;
    	a215 = a223;
    	a370 = 35 ;
    	a344 = (((((a344 % 14906) + -188) * 1) / 5) - 3886);
    	a20 = a170;
    	a236 = a267;
    	a377 = a374[0];
    	a299 = 33 ;
    	a279 = ((((a279 % 14834) + 15164) - -5946) - -5963);
    	a350 = a367;
    	a376 = (((((a376 % 66) - -315) - 1) / 5) + 206);
    	a356 = (((((a356 * 1) % 27) - 98) * 9) / 10);
    	a331 = 33 ;
    	a306 = a250;
    	a293 = a311[5];
    	a204 = 15;
    	a369 = 14;
    	a208 = 9;
    	a277 = a368;
    	a232 = 35 ;
    	a380 = 7;
    	a219 = 8;
    	a347 = (((((a347 * -8) / 10) * 1) / 5) + 8650);
    	a44 = (((((39 * -31) / 10) - -30103) * 1) + -30108); 
    	}else {
    	a344 = ((((a344 % 41) + -129) + 11) - -9);
    	a103 = (a208 + -4);
    	a355 = a235[7];
    	a161 = a19[(a304 - 2)];
    	a224 = a342[6];
    	a299 = 32 ;
    	a279 = (((((a279 - -30005) % 14981) + -15018) / 5) + -22954);
    	a380 = 11;
    	a387 = 36 ;
    	a359 = 36 ;
    	a370 = 32 ;
    	a388 = 9;
    	a264 = a270;
    	a260 = ((((a260 / 5) / 5) % 79) + 236);
    	a350 = a283;
    	a376 = ((((a376 % 15060) - 14938) - 0) - 1);
    	a347 = (((((a347 * -8) / 10) / 5) + -6289) + 7294);
    	a42 = a34;
    	a369 = 8;
    	a304 = 8;
    	a13 = 34 ;
    	a204 = 12;
    	a236 = a267;
    	a280 = ((((a280 % 14909) + 15090) * 1) * 1);
    	a331 = 34 ;
    	a232 = 36 ;
    	a354 = (((28 - 1725) * -5) + 7644);
    	a394 = 4;
    	a377 = a374[0];
    	a293 = a311[4];
    	a277 = a338;
    	a328 = 9;
    	a230 = 35 ;
    	a306 = a250;
    	a217 = a233[4];
    	a324 = a341[3];
    	a257 = ((((91 + 2742) + -14053) / 5) - -12291);
    	a219 = 12;
    	a356 = ((((a356 - -6720) - -13633) * 1) + 9656);
    	a234 = a305;
    	a208 = 10;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm26(int input) {
    if((((104 == a381[4]) && (((a380 == 4 && (a43 == a61[3] && (input == inputs[0] &&  cf==1 ))) && a362 == a242[0]) && (85 == a42[5]))) && (((a224 == a342[0] && (a232 == 33 && a208 == 6)) && a98 == a67[5]) && a304 == 7))) {
    	cf = 0;
    	a277 = a382;
    	a224 = a342[(a369 + -6)];
    	a204 = (a304 + 5);
    	a57 = a49[((a388 + a380) - 11)];
    	a230 = 34 ;
    	a376 = (((((((a376 * a344) % 14999) * 2) / 5) * 5) % 66) + 314);
    	a42 = a34;
    	a217 = a233[(a369 + -6)];
    	a299 = 34 ;
    	a208 = (a328 - -4);
    	a161 = a19[4];
    	a13 = 34 ;
    	a234 = a214;
    	a330 = a391[(a219 - a380)];
    	a387 = 34 ;
    	a380 = ((a208 + a394) + -3);
    	a347 = (((((((a347 * a356) % 14999) + 11923) % 87) + 29) - 15354) + 15331); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a354 <=  -194 && (a208 == 6 && (((a43 == a61[3] && ( cf==1  && input == inputs[2])) && (45 == a234[3])) && a98 == a67[5]))) && (((104 == a381[4]) && ((85 == a42[5]) && (a362 == a242[0] && a324 == a341[0]))) && a369 == 8))) {
    	cf = 0;
    	a362 = a242[(a388 + -7)];
    	a326 = a201;
    	a331 = 32 ;
    	a42 = a76;
    	a129 = a186[((a204 * a369) - 75)];
    	a295 = a302[(a208 - 5)];
    	a232 = 32 ;
    	a217 = a233[(a369 - 7)];
    	a388 = ((a208 - a208) - -9);
    	a355 = a235[((a208 * a380) + -23)];
    	a299 = 32 ;
    	a328 = (a208 - 1);
    	a376 = (((((((a376 * a347) % 14999) % 63) + 185) - -18692) / 5) + -3559);
    	a219 = (a394 + 6);
    	a277 = a338;
    	a394 = (a208 - 4);
    	a324 = a341[((a208 - a208) + 1)];
    	a20 = a71;
    	a330 = a391[(a328 - 4)];
    	a280 = (((((((a344 * a344) % 14999) % 60) - -33) - 21268) * 1) - -21277);
    	a369 = (a208 - -3);
    	a350 = a367;
    	a322 = 32 ;
    	a304 = (a208 + 2);
    	a234 = a372;
    	a356 = ((((((((a356 * a354) % 14999) % 27) - 130) * 9) / 10) / 5) - 105);
    	a279 = (((((((a344 * a344) % 14999) % 101) - -35) + 19663) + 9103) - 28802);
    	a260 = ((((((a344 * a344) % 14999) + 14915) % 79) - -165) - 3);
    	a344 = ((((((a344 * a280) % 14999) + -6238) / 5) % 41) - 125);
    	a103 = 7; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a230 == 33 && (a387 == 33 && ((a369 == 8 && ((104 == a381[4]) && a324 == a341[0])) && input == inputs[4]))) && (a230 == 33 && (a394 == 1 && ((((85 == a42[5]) &&  cf==1 ) && a43 == a61[3]) && a98 == a67[5]))))) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a279 = (((((((a257 * a257) % 14999) % 101) + -8) - -57) - 25113) - -25057);
    	a324 = a341[((a388 * a388) - 63)];
    	a356 = (((((((a356 * a347) % 14999) / 5) % 34) + -70) + -20279) - -20269);
    	a376 = (((((((a376 * a279) % 14999) % 63) - -185) * 5) % 63) - -142);
    	a326 = a201;
    	a299 = 32 ;
    	a217 = a233[(a208 - 5)];
    	a394 = (a388 + -6);
    	a277 = a338;
    	a41 = (a328 + 6);
    	a287 = 32 ;
    	a232 = 32 ;
    	a204 = (a304 + 4);
    	a42 = a76;
    	a230 = 32 ;
    	a208 = a388;
    	a355 = a235[((a388 - a388) - -1)];
    	a295 = a302[((a394 + a394) + -2)];
    	a304 = (a388 + 1);
    	a347 = ((((((((a347 * a344) % 14999) % 58) + -110) - 18) / 5) * 59) / 10);
    	a380 = (a388 + -3);
    	a20 = a170;
    	a328 = ((a388 * a388) - 59);
    	a331 = 32 ;
    	a234 = a372;
    	a359 = 34 ;
    	a354 = (((((a354 * a257) % 14999) / 5) / 5) + -16285);
    	a224 = a342[((a388 + a369) - 14)];
    	a369 = (a388 + 1);
    	a377 = a374[(a41 - a388)];
    	a219 = ((a394 / a388) + 7);
    	a44 = (((49 * 5) - 359) * 1);
    	a330 = a391[(a204 - 11)];
    	a370 = 32 ;
    	a362 = a242[(a380 - 3)];
    	a387 = 34 ;
    	a215 = a205;
    	a344 = (((((((a344 * a279) % 14999) % 41) - 146) - 275) / 5) + -51);
    	a388 = 9; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((((a355 == a235[0] && ((a299 == 33 && (a219 == 6 && (a43 == a61[3] && ( cf==1  && input == inputs[1])))) && a356 <=  -144)) && a98 == a67[5]) && (104 == a381[4])) && ((a394 == 1 && a394 == 1) && (85 == a42[5])))) {
    	cf = 0;
    	a380 = a219;
    	a264 = a393;
    	a98 = a67[7];
    	a54 = ((a388 - a388) + 9);
    	a355 = a235[(a54 - 7)];
    	a359 = 34 ;
    	a377 = a374[(a208 - 6)];
    	a257 = (((((((a344 * a344) % 14999) % 72) - -269) + 47) - 2670) + 2616);
    	a232 = 34 ;
    	a306 = a250;
    	a299 = 34 ;
    	a279 = ((((((a344 * a344) % 14999) / 5) - 8526) * 10) / 9);
    	a237 = a345;
    	a387 = 34 ;
    	a204 = ((a394 - a328) + 15);
    	a328 = (a394 - -5);
    	a208 = a388; 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm27(int input) {
    if((((a232 == 33 && (a387 == 33 && (a98 == a67[6] && (((a260 <=  157 && a362 == a242[0]) && (85 == a42[5])) && (29 == a326[5]))))) && (input == inputs[1] && (a224 == a342[0] && (a78 <=  34 && ((104 == a381[4]) &&  cf==1 ))))) && a157 >= -2)) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a42 = a76;
    	a369 = (a204 + -1);
    	a347 = (((((((a347 * a78) % 14999) / 5) + 8821) * 2) % 58) - 126);
    	a232 = 32 ;
    	a20 = a170;
    	a299 = 32 ;
    	a230 = 32 ;
    	a326 = a201;
    	a219 = (a208 - -1);
    	a290 = 33 ;
    	a356 = (((((((a356 * a260) % 14999) * 2) % 27) - 114) / 5) + -108);
    	a41 = (a204 + -4);
    	a264 = a270;
    	a215 = a248;
    	a380 = (a394 + 3);
    	a344 = ((((((a344 * a356) % 14999) % 41) + -148) - -8148) - 8145); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((a78 <=  34 && (43 == a215[5])) && a260 <=  157) && a304 == 7) && (104 == a381[4])) && (((((( cf==1  && a98 == a67[6]) && (85 == a42[5])) && a224 == a342[0]) && a362 == a242[0]) && a230 == 33) && input == inputs[4]))) {
    	cf = 0;
    	a279 = ((((((((a354 * a354) % 14999) % 81) + 228) + -39) * 5) % 81) - -241);
    	a388 = a204;
    	a161 = a19[a219];
    	a204 = (a388 - -2);
    	a293 = a311[((a219 - a388) + 5)];
    	a257 = ((((((a257 * a347) % 14999) / 5) + 3702) % 72) - -267);
    	a277 = a382;
    	a264 = a393;
    	a362 = a242[(a388 - 8)];
    	a295 = a302[(a380 + -2)];
    	a230 = 34 ;
    	a234 = a214;
    	a29 = (a208 + 11);
    	a394 = ((a388 * a388) + -99);
    	a387 = 34 ;
    	a380 = (a388 - 4);
    	a370 = 34 ;
    	a344 = (((((((a344 * a356) % 14999) % 90) - 66) + -36) - -9151) + -9119);
    	a42 = a34;
    	a369 = (a304 + 3);
    	a376 = ((((((a376 * a260) % 14999) % 66) + 314) - -15548) + -15547);
    	a13 = 34 ;
    	a215 = a223;
    	a304 = (a328 - -5);
    	a328 = ((a388 + a388) + -14);
    	a260 = (((((((a354 * a279) % 14999) % 49) - -366) + -1) + 21016) + -21014);
    	a237 = a349;
    	a356 = ((((((a356 * a78) % 14999) * 2) % 34) + -53) - 1);
    	a224 = a342[((a219 - a369) + 6)];
    	a326 = a360;
    	a208 = ((a388 / a388) + 7);
    	a219 = ((a388 + a388) - 12);
    	a354 = ((((((a354 * a279) % 14999) % 57) + -86) * 1) - -1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a208 == 6 && (a331 == 33 && (87 == a277[4]))) && a78 <=  34) && (104 == a381[4])) && (((((input == inputs[0] && (a98 == a67[6] &&  cf==1 )) && a387 == 33) && (29 == a326[5])) && a230 == 33) && (85 == a42[5])))) {
	if((a167 + 20) > a167){
	a167  +=  3 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a161 = a19[(a380 - -1)];
    	a376 = (((((((a376 * a78) % 14999) % 66) + 315) + -1) / 5) - -232);
    	a277 = a382;
    	a42 = a34;
    	a293 = a311[(a219 + -4)];
    	a387 = 34 ;
    	a295 = a302[(a208 - 4)];
    	a380 = (a304 + -1);
    	a103 = ((a328 / a204) - -7);
    	a13 = 34 ;
    	a208 = (a304 - -1);
    	a369 = (a219 - -4);
    	a230 = 34 ;
    	a224 = a342[(a369 + -8)]; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((a369 == 8 && (((a224 == a342[0] && (((104 == a381[4]) && (a354 <=  -194 && (8 == a264[3]))) && (85 == a42[5]))) && a98 == a67[6]) && a293 == a311[0])) && (a344 <=  -188 && (input == inputs[2] && (a78 <=  34 &&  cf==1 ))))) {
    	cf = 0;
    	a279 = (((87 + 84) - -25816) + -25704);
    	a354 = ((((((a279 * a279) % 14999) - -13680) - 4622) % 57) + -105);
    	a326 = a360;
    	a215 = a223;
    	a376 = ((((((a376 * a354) % 14999) % 66) - -314) + 1) + -1);
    	a344 = (((((((a347 * a376) % 14999) + 13015) - 26461) * 1) % 90) - -13);
    	a204 = ((a328 / a208) + 12);
    	a387 = 34 ;
    	a304 = (a208 + 3);
    	a224 = a342[((a204 * a219) - 70)];
    	a369 = (a388 - -2);
    	a42 = a34;
    	a234 = a214;
    	a295 = a302[((a304 / a304) - -1)];
    	a260 = (((((((a260 * a376) % 14999) % 49) + 367) - -1) - 16141) - -16139);
    	a257 = (((((((a257 * a78) % 14999) + -3819) / 5) + 24558) % 72) + 248);
    	a362 = a242[(a219 - 4)];
    	a370 = 34 ;
    	a237 = a349;
    	a388 = a369;
    	a29 = (a219 + 11);
    	a293 = a311[(a208 - 5)];
    	a161 = a19[(a29 + -11)];
    	a230 = 34 ;
    	a219 = (a328 + a380);
    	a394 = (a328 + -3);
    	a356 = ((((((a356 * a344) % 14999) % 34) - 51) + -1) + 1);
    	a380 = (a328 + 2);
    	a13 = 34 ;
    	a208 = (a328 - -4);
    	a277 = a382;
    	a264 = a393;
    	a328 = 6; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm28(int input) {
    if(((a324 == a341[0] && (a388 == 8 && (((104 == a381[4]) && (input == inputs[2] && (((34 < a78) && (64 >= a78)) && ( cf==1  && (85 == a42[5]))))) && a328 == 4))) && ((((29 == a326[5]) && a98 == a67[6]) && a208 == 6) && a388 == 8))) {
    	cf = 0;
    	a155 = 8;
    	a42 = a34;
    	a362 = a242[(a204 - 10)];
    	a370 = 34 ;
    	a344 = (((((((a344 * a280) % 14999) % 90) - 13) - -15763) - 28591) - -12826);
    	a236 = a329;
    	a234 = a214;
    	a380 = (a155 - 2);
    	a304 = ((a204 - a369) + 5);
    	a331 = 34 ;
    	a356 = ((((((a356 * a78) % 14999) % 34) - 53) + 7507) + -7506);
    	a217 = a233[(a380 - 4)];
    	a280 = (((((((a280 * a354) % 14999) % 17) - -163) + -25876) * 1) + 25876);
    	a230 = 34 ;
    	a215 = a223;
    	a163 = a174;
    	a354 = ((((((a279 * a257) % 14999) % 57) + -86) - -1) * 1);
    	a224 = a342[((a155 * a388) - 62)];
    	a369 = (a204 - 2);
    	a13 = 32 ;
    	a324 = a341[((a388 - a328) + -2)];
    	a387 = 34 ;
    	a328 = (a394 + 3);
    	a326 = a360;
    	a295 = a302[((a208 / a219) + 2)];
    	a208 = ((a380 * a155) - 40);
    	a257 = (((((((a257 * a347) % 14999) % 72) - -307) - -2) + 7702) - 7703);
    	a388 = (a204 + -2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a324 == a341[0] && (((64 == a236[3]) && ((104 == a381[4]) && (a98 == a67[6] && (input == inputs[4] &&  cf==1 )))) && (43 == a215[5]))) && (45 == a234[3])) && ((((34 < a78) && (64 >= a78)) && (a344 <=  -188 && (85 == a42[5]))) && a387 == 33))) {
    	cf = 0;
    	a13 = 35 ;
    	a217 = a233[(a328 - 2)];
    	a54 = (a380 - -5);
    	a344 = (((((((a344 * a356) % 14999) % 90) - 87) + 12808) * 2) - 25544);
    	a387 = 34 ;
    	a236 = a329;
    	a224 = a342[(a369 + -6)];
    	a42 = a34;
    	a369 = ((a304 / a394) - -8);
    	a234 = a214;
    	a208 = ((a388 - a388) - -8);
    	a380 = (a388 + -2);
    	a399 = ((a54 - a54) - -5);
    	a356 = ((((((a356 * a344) % 14999) - -13181) % 34) + -51) - 2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm30(int input) {
    if(((a376 <=  121 && ((45 == a234[3]) && (a376 <=  121 && (((85 == a42[5]) && a331 == 33) && a377 == a374[0])))) && (((104 == a381[4]) && (a98 == a67[7] && (( cf==1  && a54 == 9) && input == inputs[2]))) && (75 == a306[5])))) {
	if((a167 + 20) > a167){
	a167  +=  3 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a388 = (a369 - -2);
    	a224 = a342[((a388 - a219) + -2)];
    	a306 = a262;
    	a13 = 34 ;
    	a344 = ((((((a260 * a260) % 14999) % 90) + -73) - -35) + 25);
    	a354 = (((((((a347 * a344) % 14999) % 57) + -85) * 1) + -12850) - -12850);
    	a287 = 34 ;
    	a234 = a214;
    	a279 = (((((((a279 * a354) % 14999) + 3940) - 10156) / 5) % 81) - -249);
    	a304 = (a369 - -1);
    	a29 = ((a369 * a394) - -9);
    	a376 = (((((((a376 * a257) % 14999) % 66) - -314) + 10231) + -3945) - 6285);
    	a237 = a349;
    	a42 = a34;
    	a356 = (((((((a356 * a344) % 14999) / 5) % 34) - 52) - 28085) - -28085);
    	a230 = 34 ;
    	a161 = a19[((a54 - a54) + 6)];
    	a232 = 33 ;
    	a377 = a374[(a380 + -4)];
    	a215 = a223;
    	a219 = (a380 - -2);
    	a362 = a242[(a204 + -10)];
    	a370 = 34 ;
    	a330 = a391[(a369 + -6)];
    	a277 = a382;
    	a369 = (a328 + 4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a224 == a342[0] && ((43 == a215[5]) && ((input == inputs[0] && (a219 == 6 && (75 == a306[5]))) && (85 == a42[5])))) && ((((104 == a381[4]) && (( cf==1  && a54 == 9) && a98 == a67[7])) && (75 == a306[5])) && a377 == a374[0]))) {
    	cf = 0;
    	a287 = 34 ;
    	a13 = 35 ;
    	a347 = ((((((a347 * a354) % 14999) % 87) - 18) + 20255) - 20263);
    	a54 = a388;
    	a215 = a223;
    	a362 = a242[(a388 + -6)];
    	a370 = 34 ;
    	a42 = a34;
    	a57 = a49[((a54 - a54) - -5)];
    	a224 = a342[(a219 - 4)];
    	a277 = a382;
    	a217 = a233[((a208 + a388) - 14)];
    	a388 = ((a208 - a208) + 10); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm2(int input) {
    if(((a299 == 33 && ((a204 == 10 && a219 == 6) && a355 == a235[0])) && (((a98 == a67[1] &&  cf==1 ) && a299 == 33) && a204 == 10))) {
    	if((((a208 == 6 && a356 <=  -144) && a304 == 7) && ((a322 == 33 && (((64 == a137[4]) &&  cf==1 ) && a322 == 33)) && a287 == 33))) {
    		calculate_outputm19(input);
    	} 
    } 
    if(((a376 <=  121 && ((a224 == a342[0] && (a98 == a67[2] &&  cf==1 )) && (29 == a326[5]))) && ((a260 <=  157 && a344 <=  -188) && a324 == a341[0]))) {
    	if(((((((12 < a268) && (43 >= a268)) &&  cf==1 ) && a293 == a311[0]) && a354 <=  -194) && (((a287 == 33 && a394 == 1) && a217 == a233[0]) && a356 <=  -144))) {
    		calculate_outputm20(input);
    	} 
    } 
    if(((a376 <=  121 && ((a299 == 33 && (a98 == a67[5] &&  cf==1 )) && (43 == a215[5]))) && (((87 == a277[4]) && a331 == 33) && a359 == 33))) {
    	if(((((a43 == a61[1] &&  cf==1 ) && a279 <=  -38) && a387 == 33) && (a344 <=  -188 && (a217 == a233[0] && ((87 == a350[3]) && a376 <=  121))))) {
    		calculate_outputm25(input);
    	} 
    	if(((a219 == 6 && ((a370 == 33 && a362 == a242[0]) && a204 == 10)) && (a330 == a391[0] && (a287 == 33 && (a43 == a61[3] &&  cf==1 ))))) {
    		calculate_outputm26(input);
    	} 
    } 
    if(((a257 <=  19 && ((a388 == 8 && a369 == 8) && a295 == a302[0])) && ((( cf==1  && a98 == a67[6]) && a230 == 33) && a362 == a242[0]))) {
    	if(((a230 == 33 && (a78 <=  34 &&  cf==1 )) && (a295 == a302[0] && (a347 <=  -166 && (a232 == 33 && (a370 == 33 && a376 <=  121)))))) {
    		calculate_outputm27(input);
    	} 
    	if(((((a354 <=  -194 && a280 <=  23) && a344 <=  -188) && a217 == a233[0]) && (a331 == 33 && (a354 <=  -194 && ( cf==1  && ((34 < a78) && (64 >= a78))))))) {
    		calculate_outputm28(input);
    	} 
    } 
    if((((a356 <=  -144 && a356 <=  -144) && a344 <=  -188) && (a354 <=  -194 && (a330 == a391[0] && (a347 <=  -166 && (a98 == a67[7] &&  cf==1 )))))) {
    	if(((a287 == 33 && (a279 <=  -38 && (a376 <=  121 && ( cf==1  && a54 == 9)))) && ((a362 == a242[0] && a217 == a233[0]) && (87 == a277[4])))) {
    		calculate_outputm30(input);
    	} 
    } 
}
 void calculate_outputm37(int input) {
    if(((a150 == 4 && (a328 == 4 && a322 == 33)) && (((85 == a42[5]) && (((43 == a215[5]) && (((110 == a381[4]) && (input == inputs[4] && ( cf==1  && ((-145 < a169) && (-61 >= a169))))) && (87 == a277[4]))) && (54 == a237[2]))) && a354 <=  -194))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a264 = a393;
    	a161 = a19[((a150 / a208) - -6)];
    	a42 = a34;
    	a370 = 34 ;
    	a306 = a262;
    	a344 = (((((((a344 * a257) % 14999) % 90) - 13) / 5) + -5470) + 5520);
    	a236 = a329;
    	a293 = a311[a394];
    	a234 = a214;
    	a230 = 34 ;
    	a304 = (a394 - -8);
    	a387 = 34 ;
    	a279 = ((((((a279 * a376) % 14999) % 81) - -248) + 14829) - 14829);
    	a380 = a208;
    	a13 = 34 ;
    	a215 = a223;
    	a354 = (((((((a354 * a169) % 14999) / 5) + 24383) / 5) % 57) - 86);
    	a29 = (a328 - -13);
    	a257 = (((((((a376 * a376) % 14999) * 2) % 72) + 308) + -28960) - -28960);
    	a287 = 34 ;
    	a277 = a382;
    	a219 = (a204 + -4);
    	a356 = (((((((a356 * a354) % 14999) - -2845) - 2903) - -3350) % 34) + -66);
    	a326 = a360;
    	a322 = 34 ;
    	a330 = a391[(a304 - 7)];
    	a237 = a349;
    	a369 = (a208 - -4);
    	a376 = (((((((a376 * a344) % 14999) + 5350) % 66) + 314) + 21422) + -21421);
    	a260 = ((((((a260 * a347) % 14999) % 49) + 367) * 1) * 1);
    	a362 = a242[((a380 + a369) - 14)];
    	a328 = a208;
    	a388 = ((a380 / a29) - -10);
    	a208 = (a204 - 4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a232 == 33 && (a279 <=  -38 && (a287 == 33 && (((a150 == 4 && ( cf==1  && (110 == a381[4]))) && ((-145 < a169) && (-61 >= a169))) && (85 == a42[5]))))) && ((input == inputs[2] && ((75 == a306[5]) && a208 == 6)) && a376 <=  121))) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a369 = (a380 + 6);
    	a326 = a360;
    	a356 = (((((((a356 * a376) % 14999) + 3771) + 5069) / 5) % 34) - 52);
    	a370 = 34 ;
    	a287 = 34 ;
    	a304 = (a369 + -1);
    	a330 = a391[((a304 - a369) - -3)];
    	a279 = (((((((a257 * a344) % 14999) % 81) - -249) * 5) % 81) + 203);
    	a362 = a242[(a304 + -7)];
    	a322 = 34 ;
    	a260 = (((((((a279 * a347) % 14999) % 49) - -365) - -3) / 5) + 260);
    	a328 = (a369 + -4);
    	a42 = a34;
    	a215 = a223;
    	a237 = a349;
    	a13 = 34 ;
    	a387 = 34 ;
    	a306 = a262;
    	a277 = a382;
    	a161 = a19[((a380 - a208) + 8)];
    	a354 = (((((((a354 * a260) % 14999) - 12438) % 57) + -70) - -17022) - 17000);
    	a208 = ((a204 + a380) - 8);
    	a257 = (((86 * 5) + -72) + -30);
    	a376 = (((((((a169 * a356) % 66) + 254) * 5) * 5) % 66) + 255);
    	a230 = 34 ;
    	a344 = ((((((a344 * a169) % 14999) + -9060) * 3) % 90) + -14);
    	a236 = a329;
    	a234 = a214;
    	a29 = (a150 - -13);
    	a219 = (a304 - 1);
    	a264 = a393;
    	a293 = a311[(a380 - 3)];
    	a388 = ((a394 * a380) - -6);
    	a380 = ((a369 + a369) + -14); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((input == inputs[1] && (a230 == 33 && (a369 == 8 && (a388 == 8 && ((-145 < a169) && (-61 >= a169)))))) && a388 == 8) && ((54 == a237[2]) && ((((85 == a42[5]) && ( cf==1  && (110 == a381[4]))) && a150 == 4) && a394 == 1))) && a157 >= -2)) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a20 = a170;
    	a41 = ((a388 - a208) + 4);
    	a230 = 32 ;
    	a306 = a262;
    	a299 = 32 ;
    	a347 = ((((((((a347 * a260) % 14999) % 58) + -107) * 1) * 5) % 58) - 106);
    	a219 = a304;
    	a394 = (a388 - 6);
    	a279 = ((((((a279 * a347) % 14999) / 5) % 101) + -29) - 4);
    	a215 = a248;
    	a380 = ((a369 * a41) + -43);
    	a42 = a76;
    	a344 = ((((((a344 * a356) % 14999) + -2007) % 41) + -145) - 2);
    	a232 = 32 ;
    	a369 = ((a41 / a328) - -8);
    	a290 = 33 ;
    	a356 = ((((((a356 * a347) % 14999) % 27) + -119) - 6443) - -6424); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a330 == a391[0] && ((((-145 < a169) && (-61 >= a169)) && a232 == 33) && a304 == 7)) && a230 == 33) && (a257 <=  19 && (((a260 <=  157 && (((85 == a42[5]) &&  cf==1 ) && a150 == 4)) && input == inputs[0]) && (110 == a381[4]))))) {
    	cf = 0;
    	a387 = 34 ;
    	a230 = 34 ;
    	a236 = a329;
    	a376 = (((((((a376 * a344) % 14999) + -11924) / 5) / 5) % 66) - -315);
    	a13 = 34 ;
    	a380 = ((a388 - a388) + 6);
    	a103 = (a394 + 6);
    	a237 = a345;
    	a322 = 34 ;
    	a208 = (a150 - -4);
    	a161 = a19[(a150 - -1)];
    	a330 = a391[((a219 - a394) - 3)];
    	a277 = a382;
    	a287 = 34 ;
    	a42 = a34;
    	a369 = (a304 + 3); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm38(int input) {
    if(((a344 <=  -188 && ((a260 <=  157 && a356 <=  -144) && a356 <=  -144)) && ((a355 == a235[0] && ((((110 == a381[4]) && (( cf==1  && ((-61 < a169) && (98 >= a169))) && a150 == 4)) && a295 == a302[0]) && (85 == a42[5]))) && input == inputs[1]))) {
    	cf = 0;
    	a356 = (((((((a356 * a344) % 14999) + 9905) + 4992) - 12611) % 34) + -58);
    	a380 = a219;
    	a330 = a391[(a208 - 4)];
    	a304 = (a219 - -3);
    	a264 = a393;
    	a387 = 34 ;
    	a354 = (((((((a354 * a347) % 14999) % 57) - 130) / 5) - 28865) + 28814);
    	a388 = a204;
    	a394 = ((a304 + a219) + -12);
    	a232 = 34 ;
    	a236 = a329;
    	a208 = (a380 + 2);
    	a295 = a302[(a219 - 4)];
    	a217 = a233[(a304 + -7)];
    	a376 = ((((((a356 * a356) * 3) - -6937) - -11) % 66) + 274);
    	a293 = a311[(a219 - 4)];
    	a326 = a360;
    	a306 = a213;
    	a257 = (((((a169 * a356) + -19481) + -450) % 72) + 328);
    	a204 = ((a219 / a219) + 11);
    	a224 = a342[(a388 + -8)];
    	a180 = a35[(a150 - -2)];
    	a13 = 36 ;
    	a260 = ((((((a260 * a257) % 14999) % 49) + 365) - -1) - -2);
    	a344 = ((((((a344 * a356) % 14999) % 90) - 43) - -15374) + -15388);
    	a370 = 34 ;
    	a102 = a17[(a150 - -2)];
    	a234 = a214;
    	a237 = a345;
    	a369 = (a219 - -4);
    	a215 = a223;
    	a280 = (((((((a280 * a279) % 14999) % 17) - -163) / 5) / 5) - -172);
    	a362 = a242[(a219 - 4)];
    	a42 = a34;
    	a277 = a382;
    	a331 = 34 ;
    	a324 = a341[((a150 - a380) - -4)];
    	a279 = ((((((a356 * a376) % 14999) % 81) - -249) + 1) * 1);
    	a230 = 34 ;
    	a347 = ((((((a347 * a169) % 14999) / 5) - 16205) % 87) - -94);
    	a219 = ((a380 / a380) - -7); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a204 == 10 && (((64 == a236[3]) && ((a230 == 33 && a217 == a233[0]) && input == inputs[2])) && (85 == a42[5]))) && (((110 == a381[4]) && (a354 <=  -194 && (((-61 < a169) && (98 >= a169)) && (a150 == 4 &&  cf==1 )))) && a279 <=  -38))) {
    	cf = 0;
    	if(((a377 == 8 && (a299 == 35 && (a75 == a176[0] || a43 == a61[0]))) && (44 == a11[3]))) {
    	a304 = ((a328 / a150) + 8);
    	a279 = ((((((a347 * a347) % 14999) + -4279) + -5315) % 81) + 247);
    	a264 = a393;
    	a180 = a35[((a388 + a219) + -10)];
    	a295 = a302[((a304 + a328) + -13)];
    	a277 = a382;
    	a230 = 34 ;
    	a219 = ((a304 / a150) - -6);
    	a215 = a223;
    	a236 = a329;
    	a369 = (a328 + 4);
    	a260 = (((((((a354 * a279) % 14999) + -10504) % 49) + 375) - 11057) - -11075);
    	a356 = (((((((a356 * a169) % 14999) / 5) % 27) - 115) + 26138) - 26138);
    	a208 = (a369 - 2);
    	a257 = ((((((a279 * a279) % 14999) / 5) % 72) - -272) - -23);
    	a330 = a391[(a208 + -6)];
    	a380 = a328;
    	a354 = (((((((a347 * a347) % 14999) % 57) - 96) * 5) % 57) + -32);
    	a217 = a233[(a369 + -8)];
    	a326 = a360;
    	a224 = a342[(a380 - 4)];
    	a42 = a34;
    	a387 = 34 ;
    	a79 = a133;
    	a376 = (((((((a347 * a279) % 14999) % 66) + 314) + 0) / 5) - -225);
    	a331 = 34 ;
    	a13 = 36 ;
    	a293 = a311[((a150 / a328) - -2)];
    	a370 = 34 ;
    	a237 = a345;
    	a344 = (((((((a344 * a347) % 14999) / 5) - -26032) - 47860) % 41) + -119);
    	a280 = ((((((a280 * a260) % 14999) % 17) + 163) - -5821) + -5820);
    	a394 = (a204 - 7);
    	a362 = a242[(a150 - 2)];
    	a355 = a235[(a304 - 7)];
    	a232 = 34 ;
    	a234 = a214;
    	a204 = ((a150 - a150) + 12);
    	a388 = ((a150 - a150) + 10);
    	a347 = ((((((a347 * a376) % 14999) % 87) + 40) / 5) * 5);
    	a324 = a341[((a219 * a219) + -62)]; 
    	}else {
    	a330 = a391[(a369 - 6)];
    	a78 = ((((((a169 * a169) - 2607) * 3) - -8105) % 15017) + -14982);
    	a355 = a235[((a208 * a380) - 22)];
    	a236 = a329;
    	a280 = (((((((a280 * a279) % 14999) - -8553) % 17) + 162) / 5) - -120);
    	a394 = (a304 - 5);
    	a381 = a390;
    	a98 = a67[(a150 + 2)];
    	a237 = a345;
    	a328 = (a388 - a150);
    	a279 = (((((((a279 * a344) % 14999) / 5) % 101) - -6) + -11216) + 11262);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a230 == 33 && (((54 == a237[2]) && (a224 == a342[0] && (( cf==1  && (110 == a381[4])) && input == inputs[3]))) && a260 <=  157)) && (85 == a42[5])) && a324 == a341[0]) && (a150 == 4 && (a354 <=  -194 && ((-61 < a169) && (98 >= a169)))))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a208 = (a219 - -2);
    	a356 = (((((((a344 * a344) % 14999) % 34) + -83) - -30) * 9) / 10);
    	a230 = 34 ;
    	a331 = 34 ;
    	a217 = a233[(a219 - 4)];
    	a42 = a34;
    	a260 = ((((((((a260 * a169) % 14999) % 49) + 365) * 1) * 5) % 49) - -346);
    	a324 = a341[(a388 - 6)];
    	a387 = 34 ;
    	a234 = a214;
    	a280 = ((((((a280 * a356) % 14999) + 9073) + -17525) % 17) + 162);
    	a224 = a342[(a150 - 2)];
    	a204 = (a328 + 6);
    	a103 = (a150 + 1);
    	a358 = a310[((a394 / a103) + 4)];
    	a13 = 33 ;
    	a394 = (a388 + -5);
    	a236 = a329;
    	a362 = a242[(a388 - 6)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm39(int input) {
    if(((((a293 == a311[0] && (((((98 < a169 &&  cf==1 ) && input == inputs[3]) && (85 == a42[5])) && a322 == 33) && (110 == a381[4]))) && a354 <=  -194) && a344 <=  -188) && (((29 == a326[5]) && a150 == 4) && (87 == a350[3])))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a232 = 35 ;
    	a326 = a201;
    	a264 = a270;
    	a98 = a67[((a369 * a388) + -63)];
    	a137 = a84;
    	a280 = ((((a280 - -5572) % 15011) - 14987) - 2);
    	a260 = ((((a260 % 15078) + -14920) + -1) + -1);
    	a236 = a267;
    	a279 = (((45 * 5) + -14559) + -3372);
    	a354 = ((((a354 % 14903) - 194) / 5) - 12458);
    	a328 = 9;
    	a387 = 33 ;
    	a306 = a250;
    	a257 = ((((29 + -6) + -15193) + -6722) - -22032);
    	a394 = 5;
    	a287 = 34 ;
    	a224 = a342[2];
    	a376 = ((((a376 % 63) - -185) - 1) * 1);
    	a324 = a341[4];
    	a359 = 35 ;
    	a277 = a382;
    	a293 = a311[0];
    	a350 = a283;
    	a381 = a390; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((85 == a42[5]) && (((110 == a381[4]) && (98 < a169 &&  cf==1 )) && a230 == 33)) && a230 == 33) && ((a354 <=  -194 && (a299 == 33 && ((a322 == 33 && input == inputs[2]) && (43 == a215[5])))) && a150 == 4))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a54 = (a150 - -1);
    	a62 = a198;
    	a42 = a34; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((((((a150 == 4 && ( cf==1  && (110 == a381[4]))) && a328 == 4) && a204 == 10) && 98 < a169) && a354 <=  -194) && ((43 == a215[5]) && ((85 == a42[5]) && (a376 <=  121 && (input == inputs[4] && a387 == 33)))))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if((a2 == a139[6] && ((!(a387 == 33) && (((157 < a260) && (316 >= a260)) && !(a155 == 9))) || !(a193 == 4)))) {
    	a370 = 33 ;
    	a362 = a242[5];
    	a260 = ((((a260 * 1) % 15078) - 14920) - 1);
    	a324 = a341[1];
    	a293 = a311[5];
    	a208 = 7;
    	a344 = (((((a344 % 14906) + -188) * 10) / 9) + -10301);
    	a155 = ((a388 * a369) + -49);
    	a304 = 10;
    	a232 = 33 ;
    	a369 = 15;
    	a326 = a321;
    	a230 = 35 ;
    	a354 = ((((a354 % 14903) + -194) - 13798) + -264);
    	a401 = a272[(a380 - 2)];
    	a328 = 9;
    	a347 = (((((a347 * 1) - -19764) * 1) % 14917) + -15082);
    	a215 = a205;
    	a217 = a233[1];
    	a237 = a349;
    	a356 = (((((a356 - 0) % 14928) + -144) + 6730) + -14320);
    	a376 = (((((a376 - 0) % 14809) - -15190) / 5) + 2940);
    	a295 = a302[3];
    	a387 = 36 ;
    	a394 = 1;
    	a204 = 13;
    	a236 = a267;
    	a380 = 10;
    	a299 = 33 ;
    	a355 = a235[1];
    	a330 = a391[4];
    	a322 = 35 ;
    	a13 = 32 ;
    	a331 = 33 ;
    	a219 = 6;
    	a280 = (((((a280 + 7528) * 1) * 1) % 60) - -85);
    	a377 = a374[0];
    	a234 = a372;
    	a42 = a34;
    	a350 = a283;
    	a388 = 11; 
    	}else {
    	a78 = ((((((((a169 * a169) % 14999) % 14) + 38) * 5) + 15527) % 14) + 40);
    	a13 = 34 ;
    	a161 = a19[(a150 + -4)];
    	a42 = a34;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((110 == a381[4]) && (a150 == 4 && (a376 <=  121 && a293 == a311[0]))) && (85 == a42[5])) && (87 == a350[3])) && ((a369 == 8 && (((input == inputs[1] &&  cf==1 ) && 98 < a169) && a217 == a233[0])) && (54 == a237[2])))) {
    	cf = 0;
    	a237 = a298;
    	a54 = (a150 - -5);
    	a322 = 32 ;
    	a217 = a233[1];
    	a13 = 35 ;
    	a232 = 33 ;
    	a380 = 4;
    	a234 = a372;
    	a260 = ((((a260 * 1) - 0) % 15078) + -14920);
    	a356 = ((((a356 % 14928) + -144) * 1) * 1);
    	a394 = 5;
    	a208 = 7;
    	a350 = a283;
    	a42 = a34;
    	a344 = ((((a344 % 14906) + -188) + -4501) - 4818);
    	a387 = 32 ;
    	a376 = ((((a376 * 1) % 15060) - 14938) + -3);
    	a369 = 9;
    	a236 = a397;
    	a399 = (a54 - a150); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a330 == a391[0] && (a150 == 4 && (((85 == a42[5]) && (input == inputs[0] &&  cf==1 )) && (110 == a381[4])))) && ((a232 == 33 && (((a280 <=  23 && a344 <=  -188) && 98 < a169) && (64 == a236[3]))) && a376 <=  121))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a376 = (((((a376 % 14809) + 15190) - -1) / 5) - -13007);
    	a156 = 36 ;
    	a20 = a71;
    	a304 = 9;
    	a322 = 34 ;
    	a219 = 12;
    	a377 = a374[3];
    	a350 = a283;
    	a260 = (((((a260 % 49) + 367) / 5) / 5) - -382);
    	a299 = 34 ;
    	a280 = ((((a280 - -18910) + 318) % 17) - -163);
    	a326 = a321;
    	a347 = (((((a347 * 1) * -8) / 10) / 5) - -723);
    	a380 = 4;
    	a328 = 10;
    	a387 = 36 ;
    	a208 = 9;
    	a370 = 36 ;
    	a324 = a341[5];
    	a295 = a302[2];
    	a257 = ((((55 * 5) / 5) / 5) + 363);
    	a230 = 34 ;
    	a306 = a250;
    	a354 = (((a354 * 1) + 30189) - -3);
    	a293 = a311[0];
    	a224 = a342[5];
    	a287 = 33 ;
    	a330 = a391[2];
    	a236 = a397;
    	a237 = a345;
    	a344 = (((((a344 % 14906) + -188) - 10445) * 10) / 9);
    	a277 = a382;
    	a215 = a205;
    	a356 = ((((a356 * 1) % 14928) - 144) - 242);
    	a42 = a76;
    	a331 = 36 ;
    	a217 = a233[4];
    	a129 = a186[(a394 - -3)];
    	a369 = 11;
    	a204 = 16;
    	a232 = 33 ;
    	a359 = 32 ;
    	a279 = (((16 * 5) / 5) + 6522);
    	a388 = 14;
    	a234 = a305;
    	a362 = a242[6];
    	a355 = a235[5];
    	a394 = 7; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm40(int input) {
    if(((a322 == 33 && (((a387 == 33 && (input == inputs[4] && ( cf==1  && (85 == a42[5])))) && a387 == 33) && a150 == 5)) && (((94 == a163[4]) && ((a217 == a233[0] && a359 == 33) && (110 == a381[4]))) && a347 <=  -166))) {
	if((a167 + 20) > a167){
	a167  +=  4 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a381 = a254;
    	a78 = ((((3 + 126) * 5) + 28985) - 29560);
    	a11 = a40; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((8 == a264[3]) && (((110 == a381[4]) && a217 == a233[0]) && input == inputs[1])) && ((a232 == 33 && ((((94 == a163[4]) && (( cf==1  && a150 == 5) && (85 == a42[5]))) && (75 == a306[5])) && (75 == a306[5]))) && a331 == 33))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a356 = (((((((a347 * a347) % 14999) % 27) + -138) * 5) % 27) - 106);
    	a347 = (((((((a347 * a356) % 14999) / 5) % 58) + -115) / 5) - 138);
    	a330 = a391[(a150 - 4)];
    	a369 = (a204 + -1);
    	a380 = a150;
    	a260 = (((((((a376 * a279) % 14999) + 10375) % 49) + 365) + -16202) - -16202);
    	a277 = a338;
    	a362 = a242[(a388 + -8)];
    	a236 = a267;
    	a324 = a341[((a328 / a369) - -1)];
    	a295 = a302[(a394 + -1)];
    	a387 = 32 ;
    	a215 = a248;
    	a20 = a71;
    	a304 = a369;
    	a219 = a208;
    	a376 = ((((((a376 * a257) % 14999) % 63) + 185) - 1) + 2);
    	a264 = a270;
    	a354 = (((((((a354 * a344) % 14999) % 24) + -172) + -5) - 11236) - -11236);
    	a217 = a233[((a380 - a204) + 6)];
    	a232 = 32 ;
    	a230 = 32 ;
    	a299 = 32 ;
    	a234 = a372;
    	a306 = a262;
    	a344 = (((((((a344 * a279) % 14999) % 41) + -157) + -11486) + 32710) - 21245);
    	a322 = 32 ;
    	a204 = ((a369 + a208) + -4);
    	a129 = a186[a150];
    	a359 = 34 ;
    	a42 = a76;
    	a370 = 34 ;
    	a103 = (a150 + -3);
    	a331 = 33 ;
    	a279 = (((((((a279 * a257) % 14999) - -3056) % 101) - -65) - 27597) + 27596); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm44(int input) {
    if((((a299 == 33 && (a279 <=  -38 && (a324 == a341[0] && a293 == a311[0]))) && a324 == a341[0]) && (a260 <=  157 && ((input == inputs[0] && ((110 == a381[4]) && (( cf==1  && a150 == 9) && a43 == a61[0]))) && (85 == a42[5]))))) {
	if((a4 - 20) < a4){
	a4  -=  2 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a161 = a19[(a150 - 4)];
    	a387 = 34 ;
    	a103 = (a394 - -6);
    	a293 = a311[(a369 - 8)];
    	a237 = a345;
    	a376 = ((((((a376 * a356) % 14999) % 66) + 314) * 5) / 5);
    	a359 = 34 ;
    	a13 = 34 ;
    	a230 = 34 ;
    	a380 = ((a219 / a328) + 5);
    	a277 = a382;
    	a299 = 34 ;
    	a295 = a302[(a219 - 4)];
    	a208 = ((a328 / a328) + 7);
    	a42 = a34; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((110 == a381[4]) && ((45 == a234[3]) && (a299 == 33 && input == inputs[2]))) && (a376 <=  121 && (((((( cf==1  && a43 == a61[0]) && (85 == a42[5])) && a257 <=  19) && a150 == 9) && a359 == 33) && a260 <=  157)))) {
	if((a4 + 20) > a4){
	a4  +=  1 ;}
	 else{	
	a4  +=  0;}
    	cf = 0;
    	a13 = 34 ;
    	a306 = a262;
    	a376 = ((((((a280 * a354) % 14999) / 5) - 2990) % 66) - -314);
    	a219 = ((a150 + a208) + -7);
    	a208 = (a150 - 1);
    	a29 = ((a328 * a150) - 19);
    	a356 = ((((((a356 * a347) % 14999) % 34) + -60) / 5) - 55);
    	a359 = 34 ;
    	a279 = (((((((a347 * a257) % 14999) % 81) + 248) + 1) / 5) - -260);
    	a370 = 34 ;
    	a230 = 34 ;
    	a237 = a349;
    	a264 = a393;
    	a299 = 34 ;
    	a326 = a360;
    	a344 = ((((((a344 * a376) % 14999) % 90) + -14) + 21632) + -21631);
    	a328 = ((a219 - a388) - -8);
    	a380 = (a219 + -2);
    	a260 = (((((((a279 * a280) % 14999) % 49) - -366) * 5) % 49) + 333);
    	a295 = a302[(a394 - -1)];
    	a232 = 33 ;
    	a215 = a223;
    	a234 = a214;
    	a293 = a311[((a150 - a150) + 1)];
    	a362 = a242[((a369 * a150) - 88)];
    	a277 = a382;
    	a42 = a34;
    	a204 = (a304 - -3);
    	a387 = 34 ;
    	a161 = a19[a328];
    	a280 = ((((((a280 * a376) % 14999) % 17) + 164) + 18313) + -18314);
    	a257 = ((((((a257 * a260) % 14999) / 5) % 72) - -308) + 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((87 == a277[4]) && (a293 == a311[0] && (((a43 == a61[0] && (((( cf==1  && (110 == a381[4])) && (85 == a42[5])) && input == inputs[1]) && a230 == 33)) && a280 <=  23) && a150 == 9))) && ((45 == a234[3]) && a260 <=  157)) && a157 >= -2)) {
    	cf = 0;
    	a356 = ((((((a376 * a376) % 14999) % 27) + -114) - 3) - -1);
    	a380 = (a204 - 5);
    	a20 = a170;
    	a290 = 33 ;
    	a369 = ((a208 / a208) - -8);
    	a394 = (a150 - 7);
    	a299 = 32 ;
    	a347 = (((((((a347 * a356) % 14999) % 58) - 111) * 9) / 10) - 25);
    	a219 = ((a150 / a150) - -6);
    	a306 = a262;
    	a230 = 32 ;
    	a344 = ((((((a344 * a279) % 14999) - 17914) % 41) - 112) - -6);
    	a42 = a76;
    	a279 = ((((((a279 * a257) % 14999) / 5) - -26361) % 101) + 12);
    	a41 = a208; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((( cf==1  && a43 == a61[0]) && a150 == 9) && a295 == a302[0]) && (87 == a277[4])) && ((54 == a237[2]) && ((a331 == 33 && ((input == inputs[4] && (a280 <=  23 && a394 == 1)) && (85 == a42[5]))) && (110 == a381[4]))))) {
    	cf = 0;
    	a299 = 34 ;
    	a13 = 34 ;
    	a257 = ((((((a257 * a347) % 14999) % 72) - -308) - -1) + -2);
    	a279 = ((((((((a257 * a280) % 14999) / 5) % 81) - -248) * 5) % 81) + 188);
    	a215 = a223;
    	a277 = a382;
    	a295 = a302[(a388 + -8)];
    	a208 = ((a150 - a388) + 9);
    	a376 = ((((((a376 * a260) % 14999) % 66) - -314) + 2) + -1);
    	a234 = a214;
    	a326 = a360;
    	a356 = ((((((a356 * a257) % 14999) % 34) + -51) + -29270) + 29268);
    	a293 = a311[(a208 - 7)];
    	a362 = a242[(a394 + 1)];
    	a29 = ((a150 + a150) - 1);
    	a359 = 34 ;
    	a232 = 33 ;
    	a237 = a349;
    	a219 = ((a388 * a150) + -82);
    	a42 = a34;
    	a260 = (((((((a260 * a344) % 14999) - -3123) + 8786) + 1814) % 49) - -365);
    	a344 = (((((((a344 * a279) % 14999) % 90) - 13) * 5) % 90) - 14);
    	a264 = a393;
    	a370 = 34 ;
    	a387 = 34 ;
    	a306 = a262;
    	a204 = (a304 + 3);
    	a161 = a19[(a380 + 2)];
    	a328 = (a150 + -3);
    	a380 = (a369 - 4);
    	a230 = 34 ;
    	a280 = ((((((a280 * a354) % 14999) * 2) % 17) - -163) + 2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm3(int input) {
    if(((((54 == a237[2]) && a387 == 33) && a330 == a391[0]) && (a217 == a233[0] && (a260 <=  157 && (a208 == 6 && (a150 == 4 &&  cf==1 )))))) {
    	if((((a370 == 33 && (((64 == a236[3]) && a354 <=  -194) && a388 == 8)) && a394 == 1) && ((87 == a277[4]) && (((-145 < a169) && (-61 >= a169)) &&  cf==1 )))) {
    		calculate_outputm37(input);
    	} 
    	if(((a394 == 1 && (a387 == 33 && a388 == 8)) && ((a260 <=  157 && (a224 == a342[0] && ( cf==1  && ((-61 < a169) && (98 >= a169))))) && a280 <=  23))) {
    		calculate_outputm38(input);
    	} 
    	if(((a299 == 33 && (a369 == 8 && a356 <=  -144)) && (((a362 == a242[0] && ( cf==1  && 98 < a169)) && a328 == 4) && a299 == 33))) {
    		calculate_outputm39(input);
    	} 
    } 
    if((a376 <=  121 && ((((((a150 == 5 &&  cf==1 ) && (87 == a277[4])) && a219 == 6) && a295 == a302[0]) && (64 == a236[3])) && a279 <=  -38))) {
    	if(((a376 <=  121 && a359 == 33) && ((((( cf==1  && (94 == a163[4])) && (45 == a234[3])) && a204 == 10) && a344 <=  -188) && a354 <=  -194))) {
    		calculate_outputm40(input);
    	} 
    } 
    if((((a280 <=  23 && ((75 == a306[5]) && (75 == a306[5]))) && (54 == a237[2])) && (a380 == 4 && (a387 == 33 && ( cf==1  && a150 == 9))))) {
    	if(((((a394 == 1 && (a387 == 33 && a328 == 4)) && a299 == 33) && a257 <=  19) && (a204 == 10 && (a43 == a61[0] &&  cf==1 )))) {
    		calculate_outputm44(input);
    	} 
    } 
}
 void calculate_outputm47(int input) {
    if(((((45 == a215[1]) && (input == inputs[0] && ((((22 == a20[3]) &&  cf==1 ) && a129 == a186[1]) && ((-38 < a279) && (166 >= a279))))) && a295 == a302[1]) && (((90 == a42[4]) && ((a380 == 5 && a380 == 5) && a25 == a3[3])) && a322 == 32))) {
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a161 = a19[a219];
    	a54 = (a380 - -5);
    	a42 = a34; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((((((((23 < a280) && (145 >= a280)) && (12 == a264[1])) && (22 == a20[3])) && a388 == 9) && input == inputs[4]) && a25 == a3[3]) && (((a224 == a342[1] && ((90 == a42[4]) && ( cf==1  && a129 == a186[1]))) && a322 == 32) && a359 == 32))) {
    	cf = 0;
    	a98 = a67[7];
    	a42 = a197;
    	a381 = a390;
    	a54 = 12; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((((a388 == 9 && (((12 == a264[1]) && (((121 < a376) && (248 >= a376)) && a369 == 9)) && a25 == a3[3])) && a293 == a311[1]) && a219 == 7) && (90 == a42[4])) && input == inputs[2]) && ((22 == a20[3]) && (a129 == a186[1] &&  cf==1 )))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a217 = a233[4];
    	a306 = a262;
    	a150 = (a388 - 5);
    	a279 = (((a279 - -8381) + -28320) + 35023);
    	a264 = a273;
    	a257 = (((a257 - -10844) - -12635) / 5);
    	a215 = a248;
    	a331 = 36 ;
    	a381 = a395;
    	a330 = a391[1];
    	a236 = a267;
    	a380 = 6;
    	a388 = 14;
    	a277 = a338;
    	a204 = 15;
    	a376 = ((((((a376 % 63) + 165) - -10) / 5) * 35) / 10);
    	a208 = 12;
    	a237 = a349;
    	a355 = a235[3];
    	a299 = 32 ;
    	a326 = a201;
    	a354 = (((((97 + -232) * 9) / 10) * 9) / 10);
    	a230 = 36 ;
    	a234 = a214;
    	a387 = 34 ;
    	a224 = a342[5];
    	a370 = 32 ;
    	a344 = ((((a344 * -8) / 10) + 13448) * 2);
    	a42 = a197;
    	a322 = 34 ;
    	a369 = 13;
    	a394 = 6;
    	a356 = ((((78 * 5) - -27866) * 1) - 28369);
    	a359 = 36 ;
    	a232 = 34 ;
    	a328 = 9;
    	a219 = 9;
    	a350 = a367;
    	a362 = a242[2];
    	a347 = (((((a347 * 5) % 87) - -126) * 9) / 10);
    	a324 = a341[5];
    	a295 = a302[4];
    	a293 = a311[3];
    	a280 = (((((a280 % 60) - -71) - -1) / 5) + 74);
    	a304 = 10;
    	a260 = ((((a260 * 5) + 7348) * 10) / 9);
    	a169 = ((((22 * 5) / 5) * 10) / 2); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a330 == a391[1] && (a330 == a391[1] && (((a380 == 5 && (( cf==1  && (22 == a20[3])) && a129 == a186[1])) && ((19 < a257) && (234 >= a257))) && (90 == a42[4])))) && (a387 == 32 && ((a304 == 8 && input == inputs[1]) && a25 == a3[3])))) {
    	cf = 0;
    	a370 = 33 ;
    	a350 = a323;
    	a2 = a139[((a204 * a328) + -49)];
    	a394 = 5;
    	a377 = a374[3];
    	a236 = a397;
    	a359 = 32 ;
    	a287 = 33 ;
    	a354 = ((((24 / 5) + -320) * 10) / 9);
    	a387 = 33 ;
    	a41 = (a369 - 1);
    	a20 = a170; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((a129 == a186[1] && ( cf==1  && (22 == a20[3]))) && (33 == a326[3])) && a293 == a311[1]) && ((a230 == 32 && (((90 == a42[4]) && ((a25 == a3[3] && a299 == 32) && input == inputs[3])) && ((-38 < a279) && (166 >= a279)))) && (61 == a237[3])))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if(( cf!=1  || (((90 == a42[4]) || a116 == a53[5]) && !(a324 == 5)))) {
    	a293 = a311[4];
    	a326 = a201;
    	a376 = ((((a376 + -29420) + 2539) % 63) - -234);
    	a347 = ((((a347 + 16159) + -12951) % 58) + -158);
    	a215 = a248;
    	a219 = 7;
    	a330 = a391[4];
    	a230 = 36 ;
    	a103 = (a388 + -4);
    	a304 = 11;
    	a358 = a310[(a328 - 2)];
    	a42 = a34;
    	a359 = 33 ;
    	a237 = a349;
    	a257 = (((a257 - -3149) + 3346) - -7704);
    	a322 = 32 ;
    	a377 = a374[3];
    	a331 = 32 ;
    	a13 = 33 ;
    	a306 = a250;
    	a295 = a302[0];
    	a324 = a341[0];
    	a264 = a273;
    	a355 = a235[6];
    	a299 = 36 ;
    	a232 = 32 ;
    	a279 = ((((a279 % 101) - -64) - 1473) - -1473);
    	a277 = a368;
    	a234 = a305;
    	a260 = (((((a260 / 5) - -207) / 5) * 39) / 10);
    	a387 = 36 ;
    	a388 = 9;
    	a380 = 11;
    	a217 = a233[5];
    	a224 = a342[4];
    	a369 = 13;
    	a344 = ((((((a344 + -20886) % 41) + -118) * 5) % 41) - 138);
    	a280 = (((a280 * -5) + -24431) * 1);
    	a204 = 15;
    	a328 = 10; 
    	}else {
    	a13 = 36 ;
    	a180 = a35[(a328 + -2)];
    	a98 = a67[((a388 * a369) + -76)];
    	a42 = a34;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm51(int input) {
    if((((90 == a42[4]) && ((93 == a350[3]) && input == inputs[0])) && ((a299 == 32 && (((a156 == 36 && (a304 == 8 && ((22 == a20[3]) && (a129 == a186[4] &&  cf==1 )))) && a230 == 32) && (89 == a277[0]))) && a331 == 32))) {
	if((a4 + 20) > a4){
	a4  +=  2 ;}
	 else{	
	a4  +=  0;}
    	cf = 0;
    	a103 = 5;
    	a42 = a34;
    	a13 = 33 ;
    	a358 = a310[((a103 + a103) - 5)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((90 == a42[4]) && ((49 == a234[1]) && (a208 == 7 && (( cf==1  && input == inputs[3]) && (22 == a20[3]))))) && a230 == 32) && (a293 == a311[1] && (((45 == a215[1]) && (a230 == 32 && a156 == 36)) && a129 == a186[4])))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a13 = 32 ;
    	a155 = (a369 - -5);
    	a42 = a34;
    	a381 = a254; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((89 == a277[0]) && ((90 == a42[4]) && ((49 == a234[1]) && ((( cf==1  && input == inputs[2]) && a129 == a186[4]) && (22 == a20[3]))))) && (a217 == a233[1] && (a295 == a302[1] && (a156 == 36 && (a394 == 2 && a355 == a235[1])))))) {
    	cf = 0;
    	a304 = 11;
    	a42 = a197;
    	a208 = 7;
    	a356 = ((((((26 + -61) * 9) / 10) - -257) * -1) / 10);
    	a230 = 34 ;
    	a350 = a367;
    	a369 = 10;
    	a299 = 36 ;
    	a347 = ((((21 / 5) - -3182) + -27036) + 48579);
    	a322 = 32 ;
    	a217 = a233[6];
    	a277 = a382;
    	a232 = 35 ;
    	a98 = a67[(a388 - 4)];
    	a330 = a391[3];
    	a264 = a270;
    	a381 = a390;
    	a377 = a374[6];
    	a236 = a267;
    	a43 = a61[1];
    	a224 = a342[5];
    	a215 = a248;
    	a234 = a214;
    	a306 = a262;
    	a295 = a302[4];
    	a376 = (((((a376 % 63) - -180) + 7723) + 16038) + -23789);
    	a219 = 13;
    	a331 = 36 ;
    	a344 = ((((33 * 5) * 5) * 10) / -51);
    	a380 = 9;
    	a293 = a311[5];
    	a279 = (((63 + 172) + 8763) - 8729);
    	a204 = 11;
    	a388 = 11; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a322 == 32 && (((((a377 == a374[1] && (a156 == 36 && ((22 == a20[3]) && (a129 == a186[4] &&  cf==1 )))) && (90 == a42[4])) && input == inputs[4]) && a299 == 32) && a224 == a342[1])) && (a224 == a342[1] && a219 == 7))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a54 = ((a204 / a208) + 10);
    	a93 = 36 ;
    	a13 = 35 ;
    	a42 = a34; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a299 == 32 && ((a156 == 36 && (a287 == 32 && ((89 == a277[0]) && a388 == 9))) && input == inputs[1])) && a380 == 5) && (((22 == a20[3]) && ((a129 == a186[4] &&  cf==1 ) && (90 == a42[4]))) && a230 == 32))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a290 = 33 ;
    	a41 = (a219 + -1);
    	a20 = a170; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm53(int input) {
    if((((a387 == 32 && (((93 == a350[3]) && (((90 == a42[4]) && ((22 == a20[3]) && a330 == a391[1])) && input == inputs[4])) && a208 == 7)) && a219 == 7) && (a330 == a391[1] && (a103 == 2 && ( cf==1  && a129 == a186[5]))))) {
	if((a4 - 20) < a4){
	a4  -=  2 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a215 = a223;
    	a237 = a349;
    	a344 = ((((95 + 29169) - 29270) * 9) / 10);
    	a257 = (((((a344 * a344) % 72) + 308) + 1) - 3);
    	a354 = ((((((a344 * a257) % 14999) - 6172) % 57) + -86) - -1);
    	a277 = a382;
    	a388 = (a380 - -5);
    	a355 = a235[(a380 + -3)];
    	a295 = a302[(a388 - 8)];
    	a287 = 34 ;
    	a279 = (((((((a279 * a354) % 81) - -247) + 0) * 5) % 81) - -181);
    	a232 = 33 ;
    	a161 = a19[(a103 - -4)];
    	a42 = a34;
    	a299 = 34 ;
    	a356 = ((((((a356 * a257) % 14999) - -10091) + 10891) % 34) + -75);
    	a217 = a233[((a208 * a394) + -14)];
    	a376 = (((((((a376 * a354) % 14999) - 805) % 66) - -372) + 9539) - 9530);
    	a350 = a323;
    	a324 = a341[(a208 / a304)];
    	a330 = a391[(a388 - 8)];
    	a362 = a242[((a388 * a380) + -48)];
    	a230 = 34 ;
    	a29 = (a328 - -12);
    	a234 = a214;
    	a322 = 34 ;
    	a13 = 34 ;
    	a264 = a393;
    	a394 = (a204 + -11);
    	a219 = ((a328 * a388) - 42);
    	a369 = ((a219 - a388) + 12);
    	a236 = a329;
    	a280 = ((((((a280 * a260) % 14999) - 23966) - 138) % 17) + 170);
    	a347 = ((((a344 * a344) - -391) - 16533) + -3615);
    	a208 = (a380 - -3);
    	a326 = a360;
    	a387 = 34 ;
    	a328 = ((a369 / a380) - -4);
    	a377 = a374[(a304 + -7)];
    	a380 = 6; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a129 == a186[5] && ((((19 < a257) && (234 >= a257)) && (a377 == a374[1] && (((90 == a42[4]) && ( cf==1  && input == inputs[1])) && (93 == a350[3])))) && a103 == 2)) && ((a362 == a242[1] && (a355 == a235[1] && ((-144 < a356) && (-88 >= a356)))) && (22 == a20[3]))) && a157 >= -2)) {
    	cf = 0;
    	a290 = 33 ;
    	a41 = ((a380 * a103) - 4);
    	a20 = a170; 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if((((a287 == 32 && (a208 == 7 && (( cf==1  && a129 == a186[5]) && (22 == a20[3])))) && a230 == 32) && (a387 == 32 && (a217 == a233[1] && (((90 == a42[4]) && (a103 == 2 && ((-194 < a354) && (-144 >= a354)))) && input == inputs[0]))))) {
	if((a4 - 20) < a4){
	a4  -=  1 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a376 = (((((((a376 * a354) % 14999) + 10879) / 5) * 5) % 66) + 314);
    	a350 = a323;
    	a330 = a391[(a328 - 3)];
    	a13 = 34 ;
    	a295 = a302[(a219 + -5)];
    	a380 = (a369 + -3);
    	a277 = a382;
    	a208 = (a380 - -2);
    	a161 = a19[(a103 - -3)];
    	a236 = a329;
    	a103 = (a388 - 2);
    	a355 = a235[((a328 + a394) - 5)];
    	a42 = a34;
    	a287 = 34 ;
    	a322 = 34 ;
    	a387 = 34 ;
    	a293 = a311[((a328 * a103) + -33)];
    	a299 = 34 ;
    	a230 = 34 ;
    	a369 = ((a394 / a380) + 10); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((-144 < a356) && (-88 >= a356)) && (a377 == a374[1] && a322 == 32)) && (((-38 < a279) && (166 >= a279)) && (((input == inputs[2] && ((((121 < a376) && (248 >= a376)) && (a129 == a186[5] && ((22 == a20[3]) &&  cf==1 ))) && a103 == 2)) && (90 == a42[4])) && a328 == 5)))) {
    	cf = 0;
    	a208 = (a304 + -1);
    	a230 = 34 ;
    	a215 = a223;
    	a362 = a242[(a304 - 7)];
    	a369 = ((a304 + a208) + -7);
    	a264 = a393;
    	a237 = a349;
    	a344 = ((((3 + 26167) + -26187) * 9) / 10);
    	a387 = 34 ;
    	a295 = a302[(a219 + -5)];
    	a356 = (((((((a356 * a260) % 14999) % 34) + -51) / 5) / 5) - 24);
    	a279 = ((((((a279 * a376) % 14999) - -11340) - 12067) % 81) + 249);
    	a232 = 33 ;
    	a277 = a382;
    	a236 = a329;
    	a328 = ((a369 / a380) + 4);
    	a217 = a233[(a204 + -12)];
    	a299 = 34 ;
    	a257 = (((((((a257 * a354) % 14999) % 72) - -307) - 11543) / 5) + 2596);
    	a161 = a19[(a103 + 4)];
    	a287 = 34 ;
    	a330 = a391[(a380 - 3)];
    	a377 = a374[(a304 + -7)];
    	a394 = (a204 + -11);
    	a355 = a235[(a388 + -7)];
    	a219 = (a369 - 2);
    	a326 = a360;
    	a29 = ((a388 - a388) - -17);
    	a42 = a34;
    	a350 = a323;
    	a354 = ((((((((a257 * a257) % 14999) % 57) + -133) * 9) / 10) * 10) / 9);
    	a322 = 34 ;
    	a376 = ((((((((a376 * a279) % 14999) / 5) % 66) - -309) / 5) * 45) / 10);
    	a13 = 34 ;
    	a280 = (((((((a280 * a344) % 17) + 163) * 1) / 5) * 51) / 10);
    	a324 = a341[((a380 * a204) + -60)];
    	a380 = ((a304 + a304) - 12);
    	a347 = (((((13 - 10115) * 10) / 9) * 10) / 9);
    	a234 = a214;
    	a388 = (a208 - -2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm54(int input) {
    if(((a103 == 6 && ((90 == a42[4]) && (a331 == 32 && (a369 == 9 && ((157 < a260) && (316 >= a260)))))) && ((((((22 == a20[3]) && (a129 == a186[5] &&  cf==1 )) && a387 == 32) && ((23 < a280) && (145 >= a280))) && ((-166 < a347) && (-48 >= a347))) && input == inputs[2]))) {
    	cf = 0;
    	a277 = a382;
    	a388 = 10;
    	a219 = (a388 + -2);
    	a324 = a341[(a208 - 6)];
    	a369 = (a208 + 2);
    	a155 = (a103 + 2);
    	a394 = (a204 - 9);
    	a264 = a393;
    	a234 = a214;
    	a280 = (((((((a280 * a260) % 14999) % 17) + 160) + 6) - -27743) + -27750);
    	a328 = (a208 - 2);
    	a350 = a323;
    	a306 = a213;
    	a236 = a329;
    	a13 = 32 ;
    	a387 = 34 ;
    	a331 = 34 ;
    	a295 = a302[(a369 + -8)];
    	a330 = a391[(a380 + -4)];
    	a260 = ((((((a260 * a376) % 14999) + -4762) - 3775) % 49) - -367);
    	a232 = 34 ;
    	a370 = 34 ;
    	a326 = a360;
    	a42 = a34;
    	a293 = a311[((a394 - a328) + 5)];
    	a299 = 34 ;
    	a347 = ((((a347 * a344) * 1) - 17407) + -7);
    	a257 = ((((((a257 * a344) % 72) + 308) * 1) + -2616) - -2614);
    	a376 = (((((((a376 * a279) % 14999) % 66) - -269) * 10) / 9) - 41);
    	a322 = 34 ;
    	a163 = a174; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((a295 == a302[1] && a293 == a311[1]) && (70 == a236[3])) && a103 == 6) && input == inputs[4]) && (((19 < a257) && (234 >= a257)) && ((((((22 == a20[3]) &&  cf==1 ) && a129 == a186[5]) && (90 == a42[4])) && ((121 < a376) && (248 >= a376))) && (93 == a350[3]))))) {
	if((a157 - 20) < a157){
	a157  -=  4 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a399 = (a388 + -4);
    	a234 = a214;
    	a277 = a382;
    	a236 = a329;
    	a13 = 35 ;
    	a260 = (((((((a260 * a376) % 14999) % 49) - -353) + 22126) / 5) - 4159);
    	a394 = (a103 - 3);
    	a322 = 34 ;
    	a232 = 34 ;
    	a376 = ((((((a376 * a257) % 14999) / 5) % 66) - -297) - 3);
    	a350 = a323;
    	a54 = (a103 - -3);
    	a387 = 34 ;
    	a42 = a34;
    	a369 = (a399 + 5); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm55(int input) {
    if(((a355 == a235[1] && ((a330 == a391[1] && (a129 == a186[5] && ((33 == a326[3]) && ((( cf==1  && (22 == a20[3])) && (90 == a42[4])) && a299 == 32)))) && (93 == a350[3]))) && (a103 == 7 && (input == inputs[2] && a362 == a242[1])))) {
    	cf = 0;
    	 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a388 == 9 && (a322 == 32 && (input == inputs[3] && ((((90 == a42[4]) && a388 == 9) && a219 == 7) && a129 == a186[5])))) && ((((121 < a376) && (248 >= a376)) && (( cf==1  && a103 == 7) && (22 == a20[3]))) && a369 == 9))) {
    	cf = 0;
    	a20 = a170;
    	a41 = ((a103 + a103) + -3);
    	a193 = (a41 + -5); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm59(int input) {
    if(((((23 < a280) && (145 >= a280)) && (((22 == a20[3]) && ((90 == a42[4]) && a394 == 2)) && (89 == a277[0]))) && (a387 == 32 && (((157 < a260) && (316 >= a260)) && (((input == inputs[1] && ( cf==1  && a130 == 8)) && a129 == a186[7]) && a331 == 32))))) {
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	if((!(a129 == 4) && (((((93 < a185) && (243 >= a185)) && a116 == a53[2]) && !(70 == a236[3])) || a330 == a391[7]))) {
    	a369 = (a380 + 5);
    	a204 = (a369 - -2);
    	a376 = ((((((a260 * a260) % 14999) % 66) + 270) - -27215) + -27169);
    	a264 = a393;
    	a219 = (a369 + -2);
    	a331 = 34 ;
    	a234 = a214;
    	a295 = a302[((a369 + a208) + -15)];
    	a387 = 34 ;
    	a388 = (a204 - 2);
    	a324 = a341[(a380 + -3)];
    	a236 = a329;
    	a377 = a374[(a219 - 6)];
    	a13 = 32 ;
    	a230 = 34 ;
    	a350 = a323;
    	a347 = (((((a347 * a257) % 14999) - 12962) / 5) - 1991);
    	a215 = a223;
    	a328 = ((a388 / a130) + 5);
    	a232 = 34 ;
    	a277 = a382;
    	a354 = (((((((a260 * a260) % 14999) % 57) - 137) * 5) % 57) - 75);
    	a155 = (a394 - -6);
    	a394 = (a208 + -4);
    	a370 = 34 ;
    	a344 = (((((a344 * a280) * 1) % 90) - -35) - -9);
    	a299 = 34 ;
    	a356 = ((((((a356 * a280) % 34) - 43) + -20745) - -38113) - 17375);
    	a330 = a391[(a204 + -10)];
    	a359 = 34 ;
    	a380 = ((a208 + a208) - 8);
    	a279 = ((((((a260 * a260) % 14999) % 81) + 218) + 22) + 6);
    	a208 = ((a369 - a369) - -8);
    	a306 = a213;
    	a42 = a34;
    	a326 = a360;
    	a287 = 34 ;
    	a280 = ((((((a260 * a279) % 14999) % 17) + 153) - -6295) + -6294);
    	a260 = ((((((a260 * a279) % 14999) - 16833) % 49) - -415) - 30);
    	a163 = a174; 
    	}else {
    	a277 = a382;
    	a356 = ((((a356 * a280) / 5) + -17466) * 1);
    	a304 = ((a208 * a208) + -42);
    	a369 = a130;
    	a237 = a298;
    	a354 = ((((((a356 * a347) % 14999) - 24441) + -2123) + 25252) - 16711);
    	a219 = (a130 - 2);
    	a394 = (a380 + -4);
    	a279 = (((((((a354 * a356) % 14999) % 81) + 227) - 9468) - -4156) - -5265);
    	a376 = ((((((a356 * a356) % 14999) - 18795) * 10) / 9) - 7687);
    	a355 = a235[(a208 - 7)];
    	a370 = 33 ;
    	a380 = ((a208 + a369) + -11);
    	a215 = a205;
    	a295 = a302[(a208 - 7)];
    	a260 = ((((((a260 * a354) % 14999) + -2533) / 5) % 49) + 378);
    	a204 = (a304 + 3);
    	a224 = a342[(a304 + -7)];
    	a359 = 34 ;
    	a322 = 33 ;
    	a347 = (((((((a347 * a354) % 14999) - -14420) * 1) / 5) * -1) / 10);
    	a328 = ((a130 * a219) + -44);
    	a306 = a213;
    	a387 = 34 ;
    	a280 = (((((((a354 * a354) % 14999) / 5) % 17) + 159) + -5182) - -5177);
    	a324 = a341[((a208 - a204) + 3)];
    	a344 = ((((((a344 * a376) % 14999) % 14906) + -15093) + 0) * 1);
    	a326 = a360;
    	a264 = a273;
    	a232 = 33 ;
    	a234 = a305;
    	a331 = 34 ;
    	a381 = a254;
    	a42 = a197;
    	a330 = a391[(a204 - 10)];
    	a287 = 33 ;
    	a236 = a397;
    	a293 = a311[(a369 + -8)];
    	a388 = (a328 + 4);
    	a217 = a233[(a369 + -8)];
    	a78 = ((((((86 * 10) / 9) - 19) * 5) * 2) / 10);
    	a299 = 33 ;
    	a230 = 33 ;
    	a377 = a374[(a208 - 5)];
    	a362 = a242[((a369 * a369) - 64)];
    	a350 = a283;
    	a11 = a162;
    	a208 = (a394 + 7);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((a219 == 7 && (a129 == a186[7] && ((22 == a20[3]) &&  cf==1 ))) && a130 == 8) && input == inputs[0]) && (a208 == 7 && (((a370 == 32 && (a324 == a341[1] && (90 == a42[4]))) && a324 == a341[1]) && (45 == a215[1])))) && a4 >= 2)) {
    	cf = 0;
    	a204 = (a394 + 10);
    	a42 = a34;
    	a287 = 34 ;
    	a54 = (a369 + 3);
    	a380 = (a388 + -3);
    	a387 = 34 ;
    	a299 = 34 ;
    	a279 = ((((((a347 * a356) % 81) - -173) / 5) * 10) / 2);
    	a377 = a374[(a130 + -6)];
    	a354 = (((((((a344 * a347) % 14999) % 57) - 114) * 5) % 57) + -37);
    	a359 = 34 ;
    	a208 = ((a380 * a328) - 22);
    	a232 = 34 ;
    	a11 = a40;
    	a350 = a323;
    	a13 = 35 ;
    	a236 = a329;
    	a394 = ((a388 + a388) + -15); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((((-166 < a347) && (-48 >= a347)) && (a331 == 32 && (((input == inputs[3] && (a130 == 8 && (a129 == a186[7] &&  cf==1 ))) && (22 == a20[3])) && (78 == a306[2])))) && (a370 == 32 && ((90 == a42[4]) && (a324 == a341[1] && a232 == 32))))) {
    	cf = 0;
    	a20 = a16;
    	a256 = a312;
    	a102 = a17[((a130 / a380) + 2)]; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm4(int input) {
    if(((a224 == a342[1] && ((a324 == a341[1] && (89 == a277[0])) && ((-166 < a347) && (-48 >= a347)))) && ((( cf==1  && a129 == a186[1]) && a369 == 9) && ((23 < a280) && (145 >= a280))))) {
    	if(((a359 == 32 && (a331 == 32 && a355 == a235[1])) && (((157 < a260) && (316 >= a260)) && (((a25 == a3[3] &&  cf==1 ) && ((-188 < a344) && (-105 >= a344))) && a217 == a233[1])))) {
    		calculate_outputm47(input);
    	} 
    } 
    if((((89 == a277[0]) && (a331 == 32 && ((121 < a376) && (248 >= a376)))) && (((a388 == 9 && (a129 == a186[4] &&  cf==1 )) && a304 == 8) && ((121 < a376) && (248 >= a376))))) {
    	if(((a355 == a235[1] && (a224 == a342[1] && ((a230 == 32 && a322 == 32) && a394 == 2))) && ((70 == a236[3]) && ( cf==1  && a156 == 36)))) {
    		calculate_outputm51(input);
    	} 
    } 
    if((((a394 == 2 && a322 == 32) && a232 == 32) && ((((23 < a280) && (145 >= a280)) && (a299 == 32 && ( cf==1  && a129 == a186[5]))) && a295 == a302[1]))) {
    	if(((a387 == 32 && ((33 == a326[3]) && (70 == a236[3]))) && (a293 == a311[1] && (((89 == a277[0]) && (a103 == 2 &&  cf==1 )) && a217 == a233[1])))) {
    		calculate_outputm53(input);
    	} 
    	if((((((-166 < a347) && (-48 >= a347)) && ((12 == a264[1]) && ( cf==1  && a103 == 6))) && a232 == 32) && (a322 == 32 && (a370 == 32 && (33 == a326[3]))))) {
    		calculate_outputm54(input);
    	} 
    	if(((((-188 < a344) && (-105 >= a344)) && (a217 == a233[1] && ((a304 == 8 && a217 == a233[1]) && (49 == a234[1])))) && ((12 == a264[1]) && ( cf==1  && a103 == 7)))) {
    		calculate_outputm55(input);
    	} 
    } 
    if(((((-144 < a356) && (-88 >= a356)) && (a377 == a374[1] && a331 == 32)) && ((33 == a326[3]) && (((a129 == a186[7] &&  cf==1 ) && (93 == a350[3])) && (93 == a350[3]))))) {
    	if(((( cf==1  && a130 == 8) && a287 == 32) && ((a388 == 9 && ((78 == a306[2]) && (a299 == 32 && ((-188 < a344) && (-105 >= a344))))) && ((-144 < a356) && (-88 >= a356))))) {
    		calculate_outputm59(input);
    	} 
    } 
}
 void calculate_outputm61(int input) {
    if((((((58 == a256[2]) && (input == inputs[2] &&  cf==1 )) && 431 < a185) && a299 == 32) && (a331 == 32 && ((61 == a237[3]) && (((30 == a20[5]) && (((12 == a264[1]) && a387 == 32) && a331 == 32)) && (90 == a42[4])))))) {
    	cf = 0;
    	if((((!(34 == a140[0]) || 98 < a169) || !(a208 == 12)) || a324 == a341[7])) {
    	a208 = 12;
    	a370 = 33 ;
    	a356 = (((a356 * 5) - 12012) - 16000);
    	a394 = 2;
    	a299 = 32 ;
    	a377 = a374[6];
    	a387 = 32 ;
    	a306 = a262;
    	a295 = a302[7];
    	a293 = a311[0];
    	a328 = 4;
    	a257 = (((a257 - 29344) + 49275) * 1);
    	a376 = (((((a376 % 63) + 162) / 5) * 39) / 10);
    	a369 = 8;
    	a234 = a305;
    	a277 = a338;
    	a180 = a35[(a388 - 3)];
    	a354 = (((a354 / 5) - 3391) / 5);
    	a287 = 35 ;
    	a204 = 17;
    	a344 = (((a344 + -19251) - 6627) - 2064);
    	a42 = a34;
    	a304 = 12;
    	a230 = 33 ;
    	a264 = a270;
    	a380 = 4;
    	a237 = a349;
    	a217 = a233[4];
    	a350 = a367;
    	a347 = (((((a347 * 35) / 10) / 5) / 5) - 13667);
    	a232 = 36 ;
    	a279 = ((((a279 % 101) - -65) + -2) / 5);
    	a236 = a397;
    	a324 = a341[4];
    	a331 = 36 ;
    	a224 = a342[6];
    	a359 = 36 ;
    	a388 = 12;
    	a326 = a321;
    	a13 = 36 ;
    	a215 = a248;
    	a219 = 9;
    	a102 = a17[6]; 
    	}else {
    	a376 = ((((((a376 + -20770) * 10) / -9) - 34662) * -1) / 10);
    	a370 = 34 ;
    	a356 = ((((a356 / 5) / 5) * 10) / 1);
    	a42 = a34;
    	a204 = 11;
    	a324 = a341[6];
    	a387 = 32 ;
    	a257 = (((a257 / 5) - -16970) / 5);
    	a386 = (a388 + 3);
    	a299 = 35 ;
    	a331 = 36 ;
    	a215 = a248;
    	a293 = a311[7];
    	a354 = (((((a354 % 24) - 159) / 5) - 3853) - -3718);
    	a232 = 36 ;
    	a359 = 33 ;
    	a161 = a19[((a386 * a386) + -141)];
    	a277 = a368;
    	a350 = a367;
    	a295 = a302[1];
    	a304 = 8;
    	a369 = 15;
    	a377 = a374[4];
    	a344 = ((((a344 * 10) / -9) * 5) + 22436);
    	a326 = a201;
    	a219 = 13;
    	a13 = 34 ;
    	a380 = 4;
    	a279 = (((((a279 % 101) - -65) + -2) + -27903) - -27903);
    	a264 = a270;
    	a234 = a372;
    	a328 = 4;
    	a394 = 2;
    	a287 = 36 ;
    	a236 = a267;
    	a217 = a233[1];
    	a237 = a349;
    	a355 = a235[6];
    	a224 = a342[7];
    	a306 = a262;
    	a347 = ((((a347 * 10) / 2) + 4191) - 9950);
    	a230 = 36 ;
    	a208 = 6;
    	a388 = 13;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((((a299 == 32 && (431 < a185 && (49 == a234[1]))) && ((19 < a257) && (234 >= a257))) && a299 == 32) && (78 == a306[2])) && input == inputs[0]) && ((a370 == 32 && (( cf==1  && (90 == a42[4])) && (30 == a20[5]))) && (58 == a256[2])))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a13 = 36 ;
    	a180 = a35[(a394 + a328)];
    	a41 = (a369 + 3);
    	a42 = a34; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((431 < a185 && (70 == a236[3])) && ((-38 < a279) && (166 >= a279))) && (30 == a20[5])) && a219 == 7) && (((a369 == 9 && ((input == inputs[4] && ((90 == a42[4]) &&  cf==1 )) && (58 == a256[2]))) && (45 == a215[1])) && (49 == a234[1])))) {
    	cf = 0;
    	a295 = a302[6];
    	a388 = 12;
    	a306 = a250;
    	a387 = 35 ;
    	a264 = a270;
    	a376 = ((((a376 * 5) / -5) + 22683) + -29949);
    	a326 = a201;
    	a331 = 32 ;
    	a277 = a368;
    	a208 = 9;
    	a215 = a248;
    	a230 = 36 ;
    	a354 = ((((a354 + -24110) + 11775) % 24) - 168);
    	a29 = (a328 + 9);
    	a394 = 4;
    	a161 = a19[(a204 - 5)];
    	a279 = (((a279 - -24224) * 1) + 245);
    	a234 = a305;
    	a380 = 8;
    	a224 = a342[0];
    	a355 = a235[7];
    	a299 = 32 ;
    	a42 = a34;
    	a350 = a367;
    	a304 = 13;
    	a370 = 33 ;
    	a219 = 13;
    	a257 = (((a257 - -9807) / 5) * 5);
    	a13 = 34 ;
    	a236 = a397;
    	a287 = 32 ;
    	a369 = 13;
    	a324 = a341[5];
    	a347 = (((a347 - 7002) - 15185) + -6859);
    	a377 = a374[0];
    	a217 = a233[7];
    	a204 = 15;
    	a328 = 7; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((-166 < a347) && (-48 >= a347)) && a369 == 9) && (((a287 == 32 && ((a295 == a302[1] && ((input == inputs[1] && (((30 == a20[5]) &&  cf==1 ) && 431 < a185)) && (90 == a42[4]))) && ((-188 < a344) && (-105 >= a344)))) && a387 == 32) && (58 == a256[2])))) {
	if((a167 + 20) > a167){
	a167  +=  4 ;}
	 else{	
	a167  +=  0;}
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if((a355 == a235[2] && (((a93 == 35 || !(a103 == 2)) && !(93 == a350[3])) || !(a324 == a341[0])))) {
    	a295 = a302[4];
    	a161 = a19[((a380 - a208) - -7)];
    	a215 = a223;
    	a369 = 9;
    	a377 = a374[4];
    	a103 = a394;
    	a232 = 36 ;
    	a344 = (((a344 * 5) - 4388) - 7889);
    	a394 = 8;
    	a388 = 8;
    	a230 = 35 ;
    	a277 = a368;
    	a234 = a372;
    	a370 = 32 ;
    	a208 = 9;
    	a217 = a233[3];
    	a299 = 32 ;
    	a347 = (((a347 + -24433) - -36318) + -7845);
    	a356 = ((((a356 + 15702) - 37426) * 10) / 9);
    	a387 = 33 ;
    	a257 = (((a257 - 6451) + -7523) - 1622);
    	a355 = a235[0];
    	a359 = 33 ;
    	a224 = a342[5];
    	a293 = a311[7];
    	a324 = a341[5];
    	a236 = a267;
    	a376 = (((a376 / 5) / 5) - -150);
    	a328 = 10;
    	a304 = 7;
    	a219 = 12;
    	a264 = a273;
    	a42 = a34;
    	a13 = 34 ;
    	a354 = (((a354 - -12804) - -8712) - -212);
    	a350 = a367;
    	a380 = 4; 
    	}else {
    	a44 = (((((((a185 * a185) % 14999) % 11) + -125) - -22025) - 12773) - 9259);
    	a377 = a374[3];
    	a356 = (((((a356 % 27) - 100) / 5) - -18585) + -18682);
    	a387 = 33 ;
    	a359 = 33 ;
    	a236 = a267;
    	a330 = a391[1];
    	a208 = 9;
    	a350 = a367;
    	a295 = a302[3];
    	a304 = 10;
    	a354 = (((a354 / 5) * -5) - -8526);
    	a215 = a223;
    	a224 = a342[3];
    	a41 = ((a388 * a388) + -71);
    	a20 = a170;
    	}printf("%d\n", 25); fflush(stdout); 
    } 
    if(((a359 == 32 && (a224 == a342[1] && (a394 == 2 && ((30 == a20[5]) && ((121 < a376) && (248 >= a376)))))) && (((58 == a256[2]) && (431 < a185 && ((((90 == a42[4]) &&  cf==1 ) && input == inputs[3]) && (93 == a350[3])))) && a355 == a235[1]))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a280 = (((74 - -3382) * 5) + 2304);
    	a217 = a233[3];
    	a330 = a391[0];
    	a256 = a312;
    	a237 = a298;
    	a287 = 32 ;
    	a260 = (((7 + 20523) * 1) - -6646);
    	a322 = 34 ;
    	a102 = a17[(a380 + 2)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm62(int input) {
    if((((78 == a306[2]) && ((30 == a20[5]) && (a330 == a391[1] && ((61 == a237[3]) && ((( cf==1  && a102 == a17[0]) && input == inputs[0]) && (64 == a256[2])))))) && (((-166 < a347) && (-48 >= a347)) && ((a370 == 32 && (45 == a215[1])) && (90 == a42[4]))))) {
    	cf = 0;
    	if((((-53 < a253) && (-26 >= a253)) || (((12 == a398[4]) && a43 == a61[1]) && a180 == 4))) {
    	a155 = (a204 + 3);
    	a13 = 32 ;
    	a42 = a34;
    	a381 = a254; 
    	}else {
    	a306 = a213;
    	a381 = a254;
    	a277 = a382;
    	a362 = a242[3];
    	a324 = a341[5];
    	a377 = a374[6];
    	a208 = 13;
    	a215 = a205;
    	a42 = a197;
    	a328 = 9;
    	a326 = a360;
    	a370 = 34 ;
    	a217 = a233[5];
    	a237 = a349;
    	a354 = (((a354 + 27228) + 14) * 1);
    	a264 = a393;
    	a388 = 13;
    	a330 = a391[6];
    	a279 = ((((a279 % 101) + 64) - -2) - 1);
    	a347 = (((a347 / 5) - -7285) + 17719);
    	a204 = 14;
    	a260 = ((((a260 - -10122) - -5154) / 5) + -2703);
    	a369 = 13;
    	a394 = 6;
    	a78 = ((((78 + 24582) * 10) / 9) * 1);
    	a280 = ((((a280 - -26327) - 49773) * 10) / 9);
    	a299 = 34 ;
    	a219 = 11;
    	a295 = a302[7];
    	a236 = a267;
    	a350 = a367;
    	a232 = 35 ;
    	a380 = 11;
    	a376 = ((((a376 + 9402) - 19026) * 10) / 9);
    	a224 = a342[7];
    	a293 = a311[2];
    	a72 = a94;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a232 == 32 && a369 == 9) && a394 == 2) && (90 == a42[4])) && ((((((45 == a215[1]) && (input == inputs[3] && ( cf==1  && (30 == a20[5])))) && (45 == a215[1])) && (61 == a237[3])) && a102 == a17[0]) && (64 == a256[2])))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if((!(15 == a9[1]) || (31 == a79[4]))) {
    	a102 = a17[1]; 
    	}else {
    	a355 = a235[4];
    	a350 = a367;
    	a322 = 36 ;
    	a377 = a374[0];
    	a208 = 7;
    	a330 = a391[0];
    	a362 = a242[1];
    	a287 = 35 ;
    	a230 = 33 ;
    	a359 = 36 ;
    	a217 = a233[5];
    	a234 = a214;
    	a13 = 32 ;
    	a387 = 36 ;
    	a369 = 11;
    	a304 = 12;
    	a324 = a341[7];
    	a356 = (((99 + -12094) * 2) * 1);
    	a236 = a397;
    	a237 = a349;
    	a219 = 11;
    	a394 = 7;
    	a388 = 14;
    	a224 = a342[5];
    	a260 = ((((a260 % 79) - -211) - -6) - 44);
    	a344 = (((8 + -8765) / 5) - 21557);
    	a232 = 32 ;
    	a347 = ((((a347 * 10) / 2) - 16765) / 5);
    	a155 = (a328 + 5);
    	a257 = ((((45 + -4954) - -23507) + -14173) * -5);
    	a32 = (((28 * 5) + -26016) - -38099);
    	a376 = (((a376 - 21891) - 7534) * 1);
    	a42 = a34;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((input == inputs[2] && (a394 == 2 && ((45 == a215[1]) && a102 == a17[0]))) && ((157 < a260) && (316 >= a260))) && a380 == 5) && (a293 == a311[1] && ((a328 == 5 && ((64 == a256[2]) && ( cf==1  && (90 == a42[4])))) && (30 == a20[5]))))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(((((248 < a376) && (381 >= a376)) && a370 == 32) || (89 == a47[1]))) {
    	a204 = 16;
    	a380 = 8;
    	a257 = ((((68 * 10) / 9) + 21773) + -21620);
    	a370 = 32 ;
    	a347 = (((((a347 % 58) - 74) + 8) / 5) - 38);
    	a42 = a34;
    	a344 = (((96 + -22280) - -33483) * 2);
    	a208 = 12;
    	a322 = 36 ;
    	a217 = a233[5];
    	a215 = a205;
    	a279 = ((((a279 + 19588) % 101) + -9) + -13);
    	a287 = 35 ;
    	a232 = 36 ;
    	a98 = a67[((a369 - a388) + 4)];
    	a350 = a283;
    	a293 = a311[7];
    	a369 = 15;
    	a299 = 33 ;
    	a236 = a267;
    	a324 = a341[6];
    	a295 = a302[5];
    	a230 = 32 ;
    	a306 = a250;
    	a224 = a342[7];
    	a264 = a270;
    	a354 = (((a354 - -2002) + 5213) * 4);
    	a260 = ((((a260 % 79) - -217) * 5) / 5);
    	a326 = a201;
    	a237 = a349;
    	a355 = a235[1];
    	a330 = a391[3];
    	a180 = a35[(a394 + 1)];
    	a13 = 36 ;
    	a362 = a242[3];
    	a387 = 32 ;
    	a394 = 4;
    	a388 = 9; 
    	}else {
    	a280 = (((((a280 - 17615) % 60) - -98) + 2438) + -2416);
    	a324 = a341[4];
    	a13 = 32 ;
    	a295 = a302[5];
    	a354 = ((((((a354 * 10) / 7) / 5) + 9614) * -1) / 10);
    	a234 = a372;
    	a380 = 9;
    	a355 = a235[7];
    	a215 = a205;
    	a356 = ((((((55 - 173) * 10) / 9) / 5) * 55) / 10);
    	a394 = 4;
    	a236 = a267;
    	a330 = a391[3];
    	a155 = (a204 - -3);
    	a388 = 12;
    	a377 = a374[7];
    	a387 = 35 ;
    	a306 = a262;
    	a279 = ((((a279 - -21235) * 1) / 5) - 4235);
    	a381 = a390;
    	a219 = 7;
    	a376 = (((((a376 * 5) - 1596) * 5) % 63) - -190);
    	a322 = 36 ;
    	a350 = a367;
    	a277 = a368;
    	a264 = a273;
    	a217 = a233[3];
    	a224 = a342[4];
    	a208 = 6;
    	a326 = a201;
    	a287 = 32 ;
    	a293 = a311[1];
    	a260 = ((((a260 - 21393) * 10) / -9) * 1);
    	a42 = a34;
    	a328 = 9;
    	a369 = 12;
    	a299 = 32 ;
    	a344 = (((47 - 26733) + -970) + -1362);
    	a370 = 35 ;
    	a230 = 32 ;
    	a257 = (((((71 * 10) / 9) / 5) + 11021) + -10940);
    	a232 = 36 ;
    	a347 = (((a347 / 5) - -9387) - -3914);
    	a304 = 13;
    	a237 = a349;
    	a362 = a242[4];
    	a204 = 17;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a217 == a233[1] && ((64 == a256[2]) && (a293 == a311[1] && (((a380 == 5 && (a330 == a391[1] && ((input == inputs[4] &&  cf==1 ) && a102 == a17[0]))) && (30 == a20[5])) && (90 == a42[4]))))) && (a380 == 5 && ((-194 < a354) && (-144 >= a354))))) {
    	cf = 0;
    	a41 = (a388 + -3);
    	a290 = 34 ;
    	a20 = a170; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((((64 == a256[2]) && ((((90 == a42[4]) && ((30 == a20[5]) &&  cf==1 )) && a102 == a17[0]) && input == inputs[1])) && a324 == a341[1]) && ((a293 == a311[1] && ((a370 == 32 && ((121 < a376) && (248 >= a376))) && a224 == a342[1])) && (78 == a306[2])))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a98 = a67[(a328 - 2)];
    	a42 = a197;
    	a290 = 34 ;
    	a381 = a390; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
}
 void calculate_outputm63(int input) {
    if(((((12 == a264[1]) && ((-144 < a356) && (-88 >= a356))) && (30 == a20[5])) && ((((input == inputs[2] && ((((64 == a256[2]) && ( cf==1  && (90 == a42[4]))) && a102 == a17[1]) && ((19 < a257) && (234 >= a257)))) && a394 == 2) && (70 == a236[3])) && ((-188 < a344) && (-105 >= a344))))) {
    	cf = 0;
    	a287 = 34 ;
    	a344 = ((((((a344 * a376) % 14999) % 90) + -14) - -19626) + -19626);
    	a355 = a235[((a380 + a328) - 8)];
    	a20 = a170;
    	a41 = (a328 + 4);
    	a129 = a186[((a369 + a328) + -7)];
    	a237 = a345;
    	a236 = a329;
    	a394 = (a204 - 8); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm64(int input) {
    if(((a370 == 32 && (((a387 == 32 && ((input == inputs[1] && (a324 == a341[1] && (45 == a215[1]))) && ((-188 < a344) && (-105 >= a344)))) && (90 == a42[4])) && a377 == a374[1])) && ((64 == a256[2]) && ((30 == a20[5]) && ( cf==1  && a102 == a17[2]))))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a103 = ((a388 + a304) + -15);
    	a20 = a71;
    	a217 = a233[(a204 - 10)];
    	a362 = a242[(a103 + -1)];
    	a331 = 33 ;
    	a304 = (a219 + 2);
    	a234 = a372;
    	a129 = a186[((a103 - a328) - -8)];
    	a370 = 34 ;
    	a322 = 32 ;
    	a356 = ((((((((a354 * a279) % 14999) + -4039) % 27) + -114) * 5) % 27) + -107);
    	a359 = 34 ;
    	a260 = (((((((a280 * a344) % 49) + 405) - 4651) * 5) % 49) + 389);
    	a330 = a391[(a204 - 10)];
    	a204 = (a369 - -3); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a204 == 11 && (((64 == a256[2]) && ((a102 == a17[2] && ((90 == a42[4]) &&  cf==1 )) && (30 == a20[5]))) && a230 == 32)) && (a377 == a374[1] && (a293 == a311[1] && (a359 == 32 && ((89 == a277[0]) && input == inputs[4])))))) {
    	cf = 0;
    	a204 = ((a394 * a304) - 6);
    	a381 = a254;
    	a78 = ((((((((a347 * a257) % 14999) % 96) - -161) + 1) * 5) % 96) - -130);
    	a369 = ((a380 * a388) - 37);
    	a347 = (((((((a279 * a376) % 14999) - 5503) / 5) + 24036) * -1) / 10);
    	a380 = ((a328 * a204) + -46);
    	a42 = a197;
    	a370 = 33 ;
    	a344 = (((((((a356 * a279) % 14999) % 14906) - 15093) - 1) + 15720) + -15719);
    	a295 = a302[(a208 + -7)];
    	a306 = a250;
    	a215 = a205;
    	a354 = (((((a354 * a344) % 14999) + -29059) - 409) * 1);
    	a219 = (a369 + -2);
    	a299 = 33 ;
    	a230 = 33 ;
    	a11 = a40; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm67(int input) {
    if((((70 == a236[3]) && (a369 == 9 && a224 == a342[1])) && (a355 == a235[1] && (a299 == 32 && (input == inputs[3] && ((64 == a256[2]) && (((((30 == a20[5]) &&  cf==1 ) && a102 == a17[7]) && a230 == 32) && (90 == a42[4])))))))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a344 = ((((a344 * 18) / 10) + 16853) + -41136);
    	a217 = a233[6];
    	a394 = 8;
    	a355 = a235[7];
    	a362 = a242[5];
    	a236 = a397;
    	a41 = (a204 + -2);
    	a20 = a170;
    	a129 = a186[(a41 + -2)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((23 < a280) && (145 >= a280)) && (a322 == 32 && ((a295 == a302[1] && (30 == a20[5])) && input == inputs[0]))) && (a355 == a235[1] && (((((90 == a42[4]) && ( cf==1  && (64 == a256[2]))) && a102 == a17[7]) && a293 == a311[1]) && (45 == a215[1]))))) {
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a180 = a35[(a388 - 6)];
    	a13 = 36 ;
    	a42 = a34;
    	a98 = a67[(a204 - 9)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a299 == 32 && ((-38 < a279) && (166 >= a279))) && (90 == a42[4])) && (input == inputs[2] && ((((12 == a264[1]) && (((49 == a234[1]) && (( cf==1  && (30 == a20[5])) && a102 == a17[7])) && a304 == 8)) && (64 == a256[2])) && a370 == 32)))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a215 = a205;
    	a350 = a283;
    	a388 = 13;
    	a180 = a35[(a304 + -7)];
    	a234 = a305;
    	a322 = 33 ;
    	a295 = a302[1];
    	a224 = a342[1];
    	a204 = 10;
    	a208 = 13;
    	a13 = 36 ;
    	a236 = a267;
    	a260 = ((((a260 * 27) / 10) * 5) * 5);
    	a380 = 7;
    	a394 = 6;
    	a331 = 33 ;
    	a42 = a34;
    	a387 = 36 ;
    	a264 = a270;
    	a116 = a53[(a304 + -7)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a387 == 32 && (((93 == a350[3]) && (((64 == a256[2]) && ( cf==1  && (90 == a42[4]))) && a331 == 32)) && ((-188 < a344) && (-105 >= a344)))) && (((30 == a20[5]) && ((a369 == 9 && a359 == 32) && input == inputs[4])) && a102 == a17[7]))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a20 = a170;
    	a193 = (a369 + -2);
    	a41 = (a394 + 9); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((a232 == 32 && (((( cf==1  && input == inputs[1]) && (90 == a42[4])) && a232 == 32) && (78 == a306[2]))) && ((93 == a350[3]) && (a102 == a17[7] && (((157 < a260) && (316 >= a260)) && ((30 == a20[5]) && (a224 == a342[1] && (64 == a256[2])))))))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a54 = 5;
    	a13 = 35 ;
    	a42 = a34;
    	a62 = a149; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm5(int input) {
    if((((((-144 < a356) && (-88 >= a356)) && (a304 == 8 && a224 == a342[1])) && a232 == 32) && ((a295 == a302[1] && ( cf==1  && (58 == a256[2]))) && a394 == 2))) {
    	if(((((93 == a350[3]) && (49 == a234[1])) && a219 == 7) && (a380 == 5 && ((( cf==1  && 431 < a185) && (61 == a237[3])) && a204 == 11)))) {
    		calculate_outputm61(input);
    	} 
    } 
    if(((((a208 == 7 && (a377 == a374[1] && (12 == a264[1]))) && ((121 < a376) && (248 >= a376))) && ((-38 < a279) && (166 >= a279))) && (((64 == a256[2]) &&  cf==1 ) && a295 == a302[1]))) {
    	if(((a362 == a242[1] && a388 == 9) && (((((23 < a280) && (145 >= a280)) && ((a102 == a17[0] &&  cf==1 ) && (33 == a326[3]))) && (93 == a350[3])) && a394 == 2))) {
    		calculate_outputm62(input);
    	} 
    	if((((a217 == a233[1] && (a388 == 9 && (a102 == a17[1] &&  cf==1 ))) && a362 == a242[1]) && ((a295 == a302[1] && a219 == 7) && (70 == a236[3])))) {
    		calculate_outputm63(input);
    	} 
    	if(((((23 < a280) && (145 >= a280)) && ((45 == a215[1]) && ((a102 == a17[2] &&  cf==1 ) && a328 == 5))) && ((a377 == a374[1] && (45 == a215[1])) && a394 == 2))) {
    		calculate_outputm64(input);
    	} 
    	if(((((-188 < a344) && (-105 >= a344)) && (a204 == 11 && a387 == 32)) && ((a369 == 9 && ((a102 == a17[7] &&  cf==1 ) && a370 == 32)) && a230 == 32))) {
    		calculate_outputm67(input);
    	} 
    } 
}
 void calculate_outputm72(int input) {
    if(((((((45 == a215[1]) && ((33 == a20[2]) && (input == inputs[4] &&  cf==1 ))) && a322 == 32) && a2 == a139[6]) && a388 == 9) && ((((121 < a376) && (248 >= a376)) && ((a41 == 8 && (70 == a236[3])) && (90 == a42[4]))) && ((-188 < a344) && (-105 >= a344))))) {
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(((41 < a91) && (252 >= a91))) {
    	a362 = a242[2];
    	a219 = 10;
    	a150 = (a388 - a380);
    	a230 = 34 ;
    	a388 = 9;
    	a264 = a393;
    	a387 = 36 ;
    	a355 = a235[4];
    	a356 = (((((39 * -21) / 10) + -5) / 5) - 11);
    	a324 = a341[1];
    	a394 = 2;
    	a369 = 10;
    	a328 = 9;
    	a279 = (((a279 - -7831) + 1419) + 4470);
    	a260 = (((((a260 - 6139) * 10) / -9) - 14680) + 10457);
    	a277 = a338;
    	a306 = a262;
    	a344 = (((((a344 - -151) + 9) * 5) % 90) - 13);
    	a350 = a367;
    	a234 = a214;
    	a322 = 34 ;
    	a331 = 34 ;
    	a347 = (((a347 - -7544) / 5) + -1609);
    	a380 = 11;
    	a224 = a342[5];
    	a236 = a329;
    	a354 = (((a354 - -10113) + -32788) - -25843);
    	a42 = a197;
    	a330 = a391[6];
    	a381 = a395;
    	a370 = 32 ;
    	a204 = 16;
    	a304 = 14;
    	a326 = a201;
    	a377 = a374[1];
    	a217 = a233[2];
    	a293 = a311[5];
    	a280 = ((((a280 * 5) * 5) % 17) - -152);
    	a376 = (((a376 - -6182) + 18429) + 4207);
    	a237 = a349;
    	a257 = (((((24 * 5) * 32) / 10) * 10) / 9);
    	a215 = a223;
    	a232 = 36 ;
    	a287 = 35 ;
    	a299 = 35 ;
    	a208 = 11;
    	a295 = a302[4];
    	a169 = (((81 - 28557) / 5) + 26537); 
    	}else {
    	a41 = (a204 - 4);
    	a65 = a12;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((((a2 == a139[6] && (70 == a236[3])) && (12 == a264[1])) && ((-194 < a354) && (-144 >= a354))) && a370 == 32) && (61 == a237[3])) && (((90 == a42[4]) && (((33 == a20[2]) && ( cf==1  && a41 == 8)) && input == inputs[2])) && ((23 < a280) && (145 >= a280))))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a42 = a34;
    	a13 = 35 ;
    	a54 = a328;
    	a62 = a198; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a331 == 32 && (a2 == a139[6] && ((((input == inputs[0] && ( cf==1  && (90 == a42[4]))) && a380 == 5) && (33 == a20[2])) && a394 == 2))) && ((45 == a215[1]) && (a295 == a302[1] && (a41 == 8 && (93 == a350[3])))))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a41 = ((a219 + a388) + -5);
    	a193 = (a394 + 6); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a295 == a302[1] && (a394 == 2 && (((90 == a42[4]) && (((23 < a280) && (145 >= a280)) && (input == inputs[1] && ((23 < a280) && (145 >= a280))))) && a328 == 5))) && (a328 == 5 && ((( cf==1  && (33 == a20[2])) && a2 == a139[6]) && a41 == 8)))) {
	if((a4 - 20) < a4){
	a4  -=  2 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	if(a57 == a49[4]) {
    	a234 = a372;
    	a377 = a374[4];
    	a328 = 9;
    	a331 = 35 ;
    	a230 = 33 ;
    	a369 = 15;
    	a380 = 7;
    	a264 = a273;
    	a326 = a321;
    	a356 = ((((47 * 10) / 9) / 5) * 5);
    	a299 = 33 ;
    	a376 = ((((a376 - 20715) / 5) / 5) - -971);
    	a280 = (((((a280 % 60) - -56) - 13642) / 5) - -2755);
    	a394 = 2;
    	a224 = a342[4];
    	a330 = a391[1];
    	a260 = (((((a260 % 79) + 221) / 5) - -21950) - 21738);
    	a204 = 15;
    	a293 = a311[6];
    	a232 = 35 ;
    	a370 = 35 ;
    	a180 = a35[(a41 + -4)];
    	a287 = 32 ;
    	a279 = (((a279 - -8827) - -19224) * 1);
    	a354 = (((a354 - 12752) + 29128) * 1);
    	a350 = a283;
    	a219 = 6;
    	a277 = a368;
    	a304 = 7;
    	a13 = 36 ;
    	a347 = ((((a347 - 25400) * 1) - -33289) + -13138);
    	a322 = 36 ;
    	a215 = a205;
    	a42 = a34;
    	a236 = a397;
    	a388 = 13;
    	a257 = (((9 + 12198) - -12565) - -4345);
    	a237 = a298;
    	a355 = a235[1];
    	a295 = a302[3];
    	a324 = a341[5];
    	a217 = a233[3];
    	a79 = a133; 
    	}else {
    	a344 = ((((a344 + 724) * 10) / 9) + 19871);
    	a380 = 6;
    	a150 = (a394 - -7);
    	a295 = a302[2];
    	a280 = ((((a280 % 60) + 24) - 0) - 0);
    	a287 = 32 ;
    	a234 = a214;
    	a208 = 9;
    	a354 = (((((a354 * 14) / 10) / 5) * 49) / 10);
    	a224 = a342[6];
    	a322 = 36 ;
    	a219 = 12;
    	a376 = ((((a376 * 5) * 5) % 63) - -184);
    	a355 = a235[5];
    	a306 = a262;
    	a359 = 34 ;
    	a324 = a341[4];
    	a356 = (((72 + -97) - -7) + -10);
    	a204 = 17;
    	a236 = a267;
    	a388 = 11;
    	a387 = 35 ;
    	a362 = a242[4];
    	a330 = a391[0];
    	a350 = a367;
    	a331 = 32 ;
    	a328 = 7;
    	a293 = a311[6];
    	a394 = 2;
    	a381 = a395;
    	a230 = 34 ;
    	a257 = (((56 - -5226) - 2423) * 5);
    	a304 = 11;
    	a260 = ((((((a260 + 5472) % 79) + 177) * 5) % 79) - -199);
    	a299 = 34 ;
    	a279 = (((a279 / 5) + -28439) - -28696);
    	a370 = 32 ;
    	a369 = 12;
    	a347 = ((((a347 % 58) + -100) - -22161) - 22119);
    	a217 = a233[4];
    	a237 = a345;
    	a277 = a382;
    	a42 = a197;
    	a377 = a374[7];
    	a43 = a61[(a150 + -9)];
    	}printf("%d\n", 23); fflush(stdout); 
    } 
    if(((((33 == a326[3]) && (a328 == 5 && a41 == 8)) && a377 == a374[1]) && ((45 == a215[1]) && ((((input == inputs[3] && ((90 == a42[4]) && ((33 == a20[2]) &&  cf==1 ))) && a2 == a139[6]) && ((157 < a260) && (316 >= a260))) && ((-38 < a279) && (166 >= a279)))))) {
    	cf = 0;
    	if((!(a129 == 6) && ((76 == a236[3]) || (a224 == a342[3] && a116 == a53[5])))) {
    	a280 = (((a280 + -8475) / 5) + 19187);
    	a260 = (((((a260 % 79) - -212) - -20902) + 5587) + -26533);
    	a295 = a302[6];
    	a224 = a342[5];
    	a236 = a267;
    	a330 = a391[6];
    	a322 = 36 ;
    	a215 = a223;
    	a304 = 12;
    	a44 = ((((((a347 * a354) % 14999) % 11) - 132) + 6) * 1);
    	a377 = a374[6];
    	a350 = a283;
    	a41 = 10;
    	a354 = (((((a354 % 24) - 163) - 3) / 5) + -150); 
    	}else {
    	a380 = 10;
    	a322 = 33 ;
    	a217 = a233[0];
    	a394 = 1;
    	a369 = 12;
    	a376 = (((((a376 % 63) + 133) / 5) / 5) + 227);
    	a103 = ((a388 / a41) - -1);
    	a224 = a342[0];
    	a260 = (((((a260 * 5) + 18904) / 5) % 79) + 186);
    	a328 = 4;
    	a232 = 32 ;
    	a347 = (((((a347 * 35) / 10) + -645) - -8997) - 9728);
    	a277 = a338;
    	a344 = ((((((a344 % 41) - 133) + 21) * 5) % 41) - 140);
    	a257 = ((((78 - 19921) * 1) * 10) / -9);
    	a330 = a391[3];
    	a304 = 14;
    	a13 = 34 ;
    	a355 = a235[4];
    	a236 = a397;
    	a299 = 32 ;
    	a264 = a273;
    	a377 = a374[6];
    	a295 = a302[3];
    	a215 = a248;
    	a293 = a311[5];
    	a234 = a305;
    	a370 = 35 ;
    	a161 = a19[((a219 * a103) + -9)];
    	a219 = 7;
    	a42 = a34;
    	a230 = 33 ;
    	a354 = ((((a354 % 24) - 144) / 5) - 149);
    	a350 = a367;
    	a324 = a341[6];
    	a280 = ((((a280 + -9989) * 10) / 9) - -1105);
    	a388 = 13;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm77(int input) {
    if(((((49 == a234[1]) && (((90 == a42[4]) && (a41 == 9 && (45 == a215[1]))) && (12 == a264[1]))) && ((157 < a260) && (316 >= a260))) && (((input == inputs[0] && (( cf==1  && (33 == a20[2])) && a129 == a186[6])) && (93 == a350[3])) && ((-144 < a356) && (-88 >= a356))))) {
    	cf = 0;
    	a204 = ((a304 * a369) + -60);
    	a387 = 34 ;
    	a13 = 35 ;
    	a322 = 34 ;
    	a293 = a311[((a208 + a380) + -10)];
    	a230 = 34 ;
    	a42 = a34;
    	a93 = 34 ;
    	a232 = 34 ;
    	a350 = a323;
    	a380 = (a204 - 6);
    	a362 = a242[(a208 - 5)];
    	a264 = a393;
    	a260 = (((((((a260 * a257) % 14999) % 49) + 354) * 5) % 49) + 355);
    	a54 = (a41 - -2);
    	a224 = a342[(a219 - 5)];
    	a208 = (a328 + 3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((((a204 == 11 && (90 == a42[4])) && a293 == a311[1]) && a232 == 32) && a304 == 8) && (((a129 == a186[6] && (a324 == a341[1] && ((33 == a20[2]) && ( cf==1  && input == inputs[1])))) && a41 == 9) && a328 == 5))) {
	if((a167 - 20) < a167){
	a167  -=  1 ;}
	 else{	
	a167  -=  0;}
    	cf = 0;
    	a377 = a374[(a380 + -3)];
    	a344 = ((((((a356 * a356) + -3505) % 90) - 51) + 23607) + -23633);
    	a394 = (a208 - 4);
    	a355 = a235[(a388 + -7)];
    	a257 = (((((((a376 * a376) % 14999) + -15474) % 107) + 186) * 9) / 10);
    	a280 = ((((((a356 * a356) / 5) % 17) + 149) + 11919) - 11908);
    	a260 = (((((((a260 * a279) % 14999) % 49) + 367) * 5) % 49) - -347);
    	a287 = 32 ;
    	a224 = a342[(a369 + -7)];
    	a41 = ((a208 + a380) + -2);
    	a359 = 34 ;
    	a295 = a302[((a204 + a388) + -18)];
    	a322 = 34 ;
    	a387 = 34 ;
    	a293 = a311[((a208 + a204) - 16)];
    	a217 = a233[(a380 - 4)];
    	a356 = ((((((a376 * a376) % 14999) % 34) + -83) + -3) + -1);
    	a362 = a242[((a208 * a380) - 33)];
    	a304 = (a208 + 2);
    	a44 = ((((43 + -5153) - -5061) * 5) - -263);
    	a328 = ((a208 / a219) + 5); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm78(int input) {
    if(((a232 == 32 && (((((((-194 < a354) && (-144 >= a354)) && (78 == a306[2])) && input == inputs[3]) && (33 == a326[3])) && a295 == a302[1]) && (33 == a20[2]))) && (((a41 == 9 && ( cf==1  && (90 == a42[4]))) && a129 == a186[7]) && (49 == a234[1])))) {
    	cf = 0;
    	if((a116 == a53[0] && (((-134 < a253) && (-53 >= a253)) || a257 <=  19))) {
    	a344 = ((((((((a376 * a280) % 14999) % 41) + -168) * 10) / 9) / 5) - 129);
    	a394 = (a380 - 3);
    	a322 = 34 ;
    	a236 = a267;
    	a257 = (((((((a257 * a279) % 14999) % 72) - -306) + 19827) / 5) - 3772);
    	a287 = 32 ;
    	a362 = a242[(a219 + -5)];
    	a224 = a342[((a328 + a394) + -5)];
    	a20 = a71;
    	a130 = (a41 - 1);
    	a217 = a233[(a204 - 9)];
    	a304 = ((a394 * a41) - 9);
    	a293 = a311[((a394 * a369) + -16)]; 
    	}else {
    	a230 = 34 ;
    	a103 = (a369 - 8);
    	a387 = 34 ;
    	a376 = ((((((a344 * a344) / 5) + -21434) + -4009) % 66) + 359);
    	a279 = ((((((a356 * a280) / 5) * 5) / 5) % 81) + 260);
    	a324 = a341[(a380 + -3)];
    	a42 = a34;
    	a330 = a391[(a41 - 7)];
    	a204 = ((a103 - a103) + 12);
    	a257 = ((((((((a257 * a354) % 14999) % 72) - -308) - 14945) * 2) % 72) + 316);
    	a232 = 34 ;
    	a350 = a323;
    	a331 = 34 ;
    	a388 = (a41 - -1);
    	a347 = ((((((a376 * a279) % 14999) % 87) + -17) + -19043) + 19061);
    	a293 = a311[(a369 - 7)];
    	a260 = (((((((a376 * a344) % 14999) * 2) % 49) - -365) - -9022) - 9020);
    	a356 = (((((((a356 * a279) % 14999) % 34) + -52) - 1) * 9) / 10);
    	a328 = (a380 + 1);
    	a277 = a382;
    	a280 = ((((((a347 * a279) % 14999) % 17) - -163) + 1) - 1);
    	a52 = a113;
    	a217 = a233[(a103 - -1)];
    	a13 = 33 ;
    	a215 = a223;
    	a208 = (a41 + -1);
    	a354 = (((((((a376 * a376) % 14999) % 57) + -98) - 37) / 5) + -104);
    	a219 = a304;
    	a370 = 34 ;
    	a224 = a342[(a388 - 8)];
    	a362 = a242[(a41 - 7)];
    	a304 = (a208 + 1);
    	a322 = 34 ;
    	a359 = 34 ;
    	a369 = a388;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((90 == a42[4]) && a299 == 32) && (input == inputs[1] && ((a224 == a342[1] && (a304 == 8 && (((23 < a280) && (145 >= a280)) && ((a219 == 7 && (a41 == 9 && ( cf==1  && a129 == a186[7]))) && ((-166 < a347) && (-48 >= a347)))))) && (33 == a20[2]))))) {
    	cf = 0;
    	a129 = a186[((a41 + a41) + -12)];
    	a217 = a233[(a380 - 3)];
    	a277 = a382;
    	a347 = (((((a347 * a280) % 87) + 96) - 38) - 18);
    	a257 = ((((((a257 * a376) % 14999) % 72) - -274) + 23) + -13);
    	a331 = 32 ;
    	a376 = ((((((a376 * a354) % 14999) + 25900) % 63) - -131) - 7);
    	a330 = a391[(a369 + -8)];
    	a370 = 32 ;
    	a388 = (a208 - -2);
    	a354 = ((((((a354 * a356) % 57) + -129) * 10) / 9) - 0); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((a41 == 9 && ((input == inputs[2] && (((33 == a20[2]) &&  cf==1 ) && (90 == a42[4]))) && a370 == 32)) && a129 == a186[7]) && (((((-144 < a356) && (-88 >= a356)) && (a217 == a233[1] && ((121 < a376) && (248 >= a376)))) && (33 == a326[3])) && (89 == a277[0])))) {
	if((a157 - 20) < a157){
	a157  -=  4 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a328 = 6;
    	a264 = a393;
    	a217 = a233[(a328 + -6)];
    	a362 = a242[(a328 - 4)];
    	a230 = 34 ;
    	a370 = 34 ;
    	a219 = (a369 - 1);
    	a234 = a214;
    	a295 = a302[(a328 - 4)];
    	a299 = 34 ;
    	a388 = (a328 + 4);
    	a42 = a34;
    	a326 = a360;
    	a387 = 34 ;
    	a324 = a341[(a328 - 6)];
    	a260 = ((((((a354 * a354) % 14999) - 6385) % 49) + 367) - 1);
    	a257 = ((((((a257 * a344) % 72) + 306) + 3) / 5) + 250);
    	a380 = ((a388 * a369) + -84);
    	a224 = a342[(a369 - 7)];
    	a161 = a19[(a41 - 3)];
    	a359 = 34 ;
    	a232 = 33 ;
    	a304 = ((a219 + a369) + -8);
    	a347 = (((((a347 * a376) % 14999) - -9204) - 18061) + -5164);
    	a394 = (a328 - 5);
    	a356 = ((((((a356 * a280) % 34) - 32) * 9) / 10) - -9);
    	a330 = a391[(a328 - 4)];
    	a331 = 33 ;
    	a277 = a382;
    	a204 = (a388 + 2);
    	a215 = a223;
    	a237 = a349;
    	a29 = (a41 + 8);
    	a322 = 34 ;
    	a13 = 34 ;
    	a280 = ((((((((a376 * a376) % 14999) - -807) % 17) - -161) / 5) * 46) / 10);
    	a208 = (a328 + 2);
    	a376 = (((((((a376 * a354) % 14999) % 66) + 315) + 11396) + 8043) - 19439);
    	a377 = a374[(a328 + -4)];
    	a279 = ((((((((a279 * a260) % 14999) % 81) + 248) * 5) * 5) % 81) - -219);
    	a350 = a323;
    	a369 = (a208 - -2);
    	a354 = (((((a354 * 2) / 10) - 39) * 9) / 10); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm79(int input) {
    if((((input == inputs[0] && (((90 == a42[4]) &&  cf==1 ) && ((-135 < a44) && (-111 >= a44)))) && (33 == a20[2])) && ((12 == a264[1]) && ((((((19 < a257) && (234 >= a257)) && (a232 == 32 && a41 == 10)) && a230 == 32) && (61 == a237[3])) && (61 == a237[3]))))) {
    	cf = 0;
    	a232 = 34 ;
    	a277 = a382;
    	a355 = a235[((a369 * a328) + -43)];
    	a13 = 32 ;
    	a293 = a311[(a328 - 3)];
    	a155 = ((a394 * a388) + -5);
    	a394 = ((a41 - a369) + 2);
    	a217 = a233[(a388 - 7)];
    	a42 = a34;
    	a388 = (a304 - -1);
    	a75 = a176[(a155 - 9)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((input == inputs[1] && (((((90 == a42[4]) && ((a41 == 10 &&  cf==1 ) && (33 == a20[2]))) && a217 == a233[1]) && ((-135 < a44) && (-111 >= a44))) && ((-188 < a344) && (-105 >= a344)))) && ((((49 == a234[1]) && a287 == 32) && a217 == a233[1]) && (89 == a277[0])))) {
	if((a157 - 20) < a157){
	a157  -=  3 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a324 = a341[(a41 - 8)];
    	a264 = a393;
    	a370 = 34 ;
    	a219 = (a369 - 1);
    	a257 = ((((((a280 * a260) % 14999) + -282) + -418) % 72) + 308);
    	a347 = (((((((a347 * a280) % 87) - -48) + -7) * 5) % 87) - -39);
    	a330 = a391[(a204 - 9)];
    	a42 = a34;
    	a234 = a214;
    	a354 = ((((((a279 * a280) % 14999) % 57) - 84) - -18483) - 18484);
    	a299 = 34 ;
    	a277 = a382;
    	a161 = a19[(a41 + -5)];
    	a344 = ((((((((a344 * a279) % 14999) % 90) + -13) + 4037) * 5) % 90) + -29);
    	a232 = 34 ;
    	a103 = (a388 + -7);
    	a328 = (a219 - 2);
    	a230 = 34 ;
    	a369 = 10;
    	a355 = a235[2];
    	a388 = (a208 + 2);
    	a380 = ((a304 - a394) + -1);
    	a394 = 3;
    	a376 = (((((((a376 * a257) % 14999) + 8985) % 66) + 277) * 10) / 9);
    	a13 = 34 ;
    	a293 = a311[2];
    	a217 = a233[2]; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if((((((a41 == 10 && (input == inputs[2] && ( cf==1  && (90 == a42[4])))) && (33 == a20[2])) && a204 == 11) && a370 == 32) && (a232 == 32 && ((a217 == a233[1] && ((61 == a237[3]) && (33 == a326[3]))) && ((-135 < a44) && (-111 >= a44)))))) {
    	cf = 0;
    	a304 = ((a380 - a380) + 7);
    	a98 = a67[((a380 - a204) - -11)];
    	a394 = (a380 - 4);
    	a370 = 33 ;
    	a217 = a233[((a304 / a328) + -1)];
    	a362 = a242[((a304 - a394) - 6)];
    	a234 = a305;
    	a219 = (a304 - 1);
    	a347 = ((((a347 * a279) / 5) / 5) - 4298);
    	a208 = ((a304 + a328) + -6);
    	a331 = 33 ;
    	a299 = 33 ;
    	a224 = a342[(a380 + -5)];
    	a387 = 33 ;
    	a376 = (((((a376 * a354) % 14999) + -10533) + -2729) / 5);
    	a204 = (a394 - -9);
    	a277 = a368;
    	a359 = 33 ;
    	a356 = (((((a344 * a257) % 14999) + -8755) * 1) + -2268);
    	a43 = a61[((a41 / a41) + 2)];
    	a279 = ((((((a356 * a347) % 14999) % 81) + 171) * 5) / 5);
    	a369 = ((a328 + a328) - 2);
    	a381 = a390;
    	a230 = 33 ;
    	a324 = a341[(a380 - a328)];
    	a42 = a197;
    	a388 = ((a380 + a369) + -5);
    	a355 = a235[(a304 + -7)];
    	a344 = (((((a344 * a257) % 14999) + -4017) + -7311) - 892);
    	a232 = 33 ;
    	a328 = (a380 - 1);
    	a287 = 33 ;
    	a326 = a360;
    	a380 = ((a204 * a208) - 56); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((a41 == 10 && a293 == a311[1]) && a369 == 9) && ((-166 < a347) && (-48 >= a347))) && a355 == a235[1]) && (a232 == 32 && (((((-135 < a44) && (-111 >= a44)) && (input == inputs[4] && ( cf==1  && (90 == a42[4])))) && ((121 < a376) && (248 >= a376))) && (33 == a20[2]))))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a13 = 34 ;
    	a355 = a235[((a41 + a41) - 18)];
    	a277 = a382;
    	a344 = ((((((a260 * a280) % 14999) + 9076) / 5) % 90) + -61);
    	a217 = a233[((a41 * a204) - 108)];
    	a234 = a214;
    	a347 = ((((((a347 * a344) % 87) + 39) - -2) - -26095) - 26095);
    	a330 = a391[((a41 + a204) - 19)];
    	a161 = a19[(a41 - 5)];
    	a293 = a311[(a204 - 9)];
    	a328 = ((a204 / a41) + 5);
    	a103 = ((a204 / a388) + 1);
    	a42 = a34;
    	a299 = 34 ;
    	a230 = 34 ;
    	a370 = 34 ;
    	a380 = (a369 + -3);
    	a257 = ((((((a257 * a44) % 14999) % 72) + 308) - 13835) - -13834);
    	a369 = (a328 + 4);
    	a388 = ((a394 / a304) + 10);
    	a324 = a341[((a41 - a219) + -1)];
    	a232 = 34 ;
    	a354 = ((((((a279 * a376) % 14999) % 57) - 84) / 5) - 105);
    	a219 = a208;
    	a394 = (a204 - 8);
    	a264 = a393;
    	a376 = (((((((a376 * a354) % 14999) % 66) + 314) / 5) / 5) - -325); 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
}
 void calculate_outputm80(int input) {
    if((((((((input == inputs[3] &&  cf==1 ) && a41 == 10) && (90 == a42[4])) && a330 == a391[1]) && a380 == 5) && a208 == 7) && (a370 == 32 && (((a217 == a233[1] && (33 == a20[2])) && ((-111 < a44) && (51 >= a44))) && a369 == 9)))) {
    	cf = 0;
    	a217 = a233[((a41 - a219) + -1)];
    	a399 = (a208 + 3);
    	a369 = (a304 - -1);
    	a350 = a323;
    	a42 = a34;
    	a54 = (a41 + -1);
    	a234 = a214;
    	a232 = 34 ;
    	a380 = (a304 - 3);
    	a13 = 35 ;
    	a287 = 34 ;
    	a219 = (a304 + -1);
    	a208 = (a304 - 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((49 == a234[1]) && ((a204 == 11 && ((-111 < a44) && (51 >= a44))) && a324 == a341[1])) && ((90 == a42[4]) && ((33 == a20[2]) && (a208 == 7 && (a380 == 5 && ((a41 == 10 && (input == inputs[1] &&  cf==1 )) && a230 == 32))))))) {
	if((a157 + 20) > a157){
	a157  +=  1 ;}
	 else{	
	a157  +=  0;}
    	cf = 0;
    	a324 = a341[(a388 - 7)];
    	a217 = a233[(a41 + -8)];
    	a103 = ((a219 - a388) - -4);
    	a350 = a323;
    	a42 = a34;
    	a13 = 33 ;
    	a331 = 34 ;
    	a326 = a360;
    	a204 = (a328 - -6);
    	a234 = a214;
    	a208 = (a369 + -1);
    	a230 = 34 ;
    	a380 = ((a208 / a208) - -5);
    	a215 = a223;
    	a200 = a152[(a219 + -2)];
    	a306 = a213;
    	a277 = a338;
    	a388 = (a328 + 4);
    	a376 = (((((((a376 * a354) % 14999) % 66) - -315) + -25169) / 5) - -5304); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm84(int input) {
    if((((a41 == 11 && ((((input == inputs[3] &&  cf==1 ) && (33 == a20[2])) && a232 == 32) && (90 == a42[4]))) && ((-38 < a279) && (166 >= a279))) && (a193 == 10 && (a388 == 9 && ((a217 == a233[1] && ((19 < a257) && (234 >= a257))) && a219 == 7))))) {
    	cf = 0;
    	a354 = (((((((a347 * a347) % 57) + -130) * 9) / 10) * 9) / 10);
    	a257 = (((((((a257 * a279) % 14999) / 5) + 9921) * 2) % 72) - -251);
    	a347 = ((((((a344 * a344) % 14999) + 3410) / 5) * 10) / -9);
    	a293 = a311[((a304 - a304) + 1)];
    	a322 = 33 ;
    	a42 = a197;
    	a359 = 34 ;
    	a260 = (((((((a260 * a347) % 14999) % 49) - -366) * 5) % 49) + 359);
    	a324 = a341[(a369 - a369)];
    	a217 = a233[(a369 + -9)];
    	a98 = a67[((a388 + a394) - 10)];
    	a394 = ((a204 * a219) + -67);
    	a299 = 33 ;
    	a232 = 34 ;
    	a224 = a342[(a41 + -11)];
    	a362 = a242[(a369 - a369)];
    	a330 = a391[((a193 - a219) - 3)];
    	a380 = (a304 - 3);
    	a234 = a305;
    	a230 = 33 ;
    	a287 = 33 ;
    	a381 = a390;
    	a208 = ((a369 / a304) + 5);
    	a388 = ((a380 - a369) + 13);
    	a264 = a393;
    	a237 = a298;
    	a215 = a205;
    	a219 = (a369 - 3);
    	a306 = a262;
    	a326 = a360;
    	a277 = a368;
    	a137 = a84;
    	a350 = a323;
    	a279 = ((((((a279 * a356) % 14999) % 81) - -247) / 5) + 262);
    	a369 = (a208 + 2); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a362 == a242[1] && ((input == inputs[1] && (a41 == 11 &&  cf==1 )) && (33 == a20[2]))) && a232 == 32) && (78 == a306[2])) && (((49 == a234[1]) && ((a193 == 10 && ((-166 < a347) && (-48 >= a347))) && (90 == a42[4]))) && a293 == a311[1]))) {
    	cf = 0;
    	a264 = a393;
    	a54 = ((a369 * a369) - 73);
    	a293 = a311[(a208 + -6)];
    	a350 = a323;
    	a326 = a360;
    	a347 = (((((a347 * a279) % 87) + 40) + 1) + -1);
    	a287 = 34 ;
    	a13 = 35 ;
    	a42 = a34;
    	a57 = a49[((a54 * a41) + -87)];
    	a257 = (((((((a257 * a279) % 14999) / 5) % 72) - -306) / 5) + 194);
    	a388 = (a219 - -3);
    	a224 = a342[(a193 - 8)];
    	a322 = 34 ;
    	a232 = 34 ;
    	a217 = a233[(a219 + -5)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((90 == a42[4]) && (((19 < a257) && (234 >= a257)) && ((a224 == a342[1] && a193 == 10) && (78 == a306[2])))) && a287 == 32) && ((49 == a234[1]) && ((a41 == 11 && ((input == inputs[4] &&  cf==1 ) && (33 == a20[2]))) && (93 == a350[3]))))) {
    	cf = 0;
    	a344 = ((((((a354 * a257) % 14999) % 90) - 14) - 1) + 1);
    	a322 = 34 ;
    	a355 = a235[(a369 - 7)];
    	a234 = a214;
    	a356 = ((((((a280 * a280) % 14999) / 5) / 5) % 34) - 51);
    	a347 = (((((a356 * a356) - 12657) % 87) - -116) - 58);
    	a370 = 34 ;
    	a279 = ((((((a279 * a257) % 14999) % 81) + 249) - 1) + -1);
    	a326 = a360;
    	a331 = 34 ;
    	a277 = a382;
    	a362 = a242[(a193 - 8)];
    	a224 = a342[(a328 + -4)];
    	a219 = ((a380 + a208) - 6);
    	a293 = a311[(a193 + -9)];
    	a377 = a374[((a369 + a369) + -16)];
    	a324 = a341[(a380 - 4)];
    	a306 = a213;
    	a217 = a233[((a394 + a380) + -6)];
    	a330 = a391[((a380 - a369) - -5)];
    	a304 = ((a380 * a219) - 39);
    	a388 = (a41 - 1);
    	a299 = 34 ;
    	a394 = (a208 - 5);
    	a295 = a302[(a193 + -8)];
    	a204 = (a369 + 3);
    	a13 = 32 ;
    	a264 = a393;
    	a257 = ((((((a257 * a356) + -1735) % 72) + 364) + 4971) - 4972);
    	a260 = ((((((a260 * a347) % 14999) % 49) - -367) - 25824) + 25822);
    	a350 = a323;
    	a215 = a223;
    	a155 = a193;
    	a287 = 34 ;
    	a42 = a34;
    	a359 = 34 ;
    	a232 = 34 ;
    	a230 = 34 ;
    	a369 = (a219 + 2);
    	a32 = (((60 + 28831) - 28923) * 5); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm85(int input) {
    if((((a330 == a391[1] && (input == inputs[4] && ((a41 == 12 &&  cf==1 ) && (90 == a42[4])))) && (33 == a20[2])) && ((((19 < a257) && (234 >= a257)) && (((49 == a234[1]) && (a380 == 5 && ((-194 < a354) && (-144 >= a354)))) && a212 == a314[2])) && (12 == a264[1])))) {
    	cf = 0;
    	a344 = (((((((a260 * a376) % 14999) % 90) + -90) + -4) * 10) / 9);
    	a264 = a393;
    	a350 = a323;
    	a326 = a360;
    	a29 = (a41 + 5);
    	a279 = (((((((a279 * a260) % 14999) * 2) + 0) / 5) % 81) - -247);
    	a369 = (a394 + 8);
    	a280 = ((((((a280 * a260) % 14999) / 5) - -17820) % 17) - -152);
    	a42 = a34;
    	a376 = ((((((((a376 * a279) % 14999) / 5) % 66) - -265) / 5) * 47) / 10);
    	a387 = 34 ;
    	a230 = 34 ;
    	a299 = 34 ;
    	a236 = a329;
    	a161 = a19[(a380 - -1)];
    	a356 = (((((a356 * a354) * 1) % 34) + -80) - 2);
    	a359 = 34 ;
    	a215 = a223;
    	a380 = ((a304 * a41) + -102);
    	a208 = (a328 - -2);
    	a224 = a342[(a369 + -8)];
    	a204 = (a304 + 3);
    	a13 = 34 ;
    	a232 = 33 ;
    	a219 = (a29 + -9);
    	a347 = ((((((a260 * a260) % 14999) + 10236) * -1) / 10) / 5);
    	a257 = (((((((a257 * a260) % 14999) % 72) - -305) + -12) * 9) / 10);
    	a331 = 33 ;
    	a287 = 34 ;
    	a237 = a349;
    	a330 = a391[((a388 / a29) + 2)];
    	a354 = ((((((a354 * a279) % 14999) % 57) + -86) - -3022) - 3021);
    	a362 = a242[((a369 + a369) - 18)];
    	a234 = a214;
    	a295 = a302[(a29 - 15)];
    	a355 = a235[((a394 - a41) - -12)];
    	a394 = ((a369 / a204) + 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a41 == 12 && (a287 == 32 && a380 == 5)) && (a330 == a391[1] && ((((((-144 < a356) && (-88 >= a356)) && (a212 == a314[2] && (( cf==1  && (33 == a20[2])) && input == inputs[2]))) && a331 == 32) && (90 == a42[4])) && a232 == 32)))) {
	if((a157 - 20) < a157){
	a157  -=  1 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a376 = (((((((a260 * a260) % 14999) - 2031) % 66) - -315) / 5) - -300);
    	a387 = 34 ;
    	a280 = ((((((((a280 * a376) % 14999) - -9955) % 17) + 164) / 5) * 46) / 10);
    	a215 = a223;
    	a380 = ((a41 * a204) - 126);
    	a287 = 34 ;
    	a295 = a302[(a219 - 5)];
    	a208 = ((a388 * a41) - 112);
    	a234 = a214;
    	a359 = 34 ;
    	a279 = ((((((a279 * a354) % 14999) % 81) + 247) - -29598) + -29595);
    	a326 = a360;
    	a347 = ((((((a376 * a260) % 14999) - -13968) - 28744) + 5864) + -13772);
    	a224 = a342[(a41 - 10)];
    	a230 = 34 ;
    	a355 = a235[a394];
    	a354 = ((((((((a257 * a356) % 14999) % 57) - 86) - -2) * 5) % 57) + -76);
    	a330 = a391[((a41 * a41) - 142)];
    	a362 = a242[(a328 - 4)];
    	a344 = (((((((a260 * a260) % 14999) % 90) - 44) + 16577) - -11360) - 27979);
    	a236 = a329;
    	a29 = ((a41 + a41) + -7);
    	a42 = a34;
    	a350 = a323;
    	a299 = 34 ;
    	a237 = a349;
    	a232 = 33 ;
    	a331 = 33 ;
    	a356 = (((((a356 * a344) % 34) + -52) * 1) - -1);
    	a13 = 34 ;
    	a264 = a393;
    	a394 = (a380 - 5);
    	a257 = ((((((a257 * a376) % 14999) % 72) - -293) + -21797) - -21766);
    	a219 = ((a41 - a204) - -7);
    	a369 = ((a204 * a304) + -89);
    	a161 = a19[(a204 - 5)];
    	a204 = ((a41 * a41) + -132); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((((93 == a350[3]) && (a387 == 32 && (((a41 == 12 &&  cf==1 ) && (90 == a42[4])) && a224 == a342[1]))) && a232 == 32) && a287 == 32) && a212 == a314[2]) && ((33 == a20[2]) && (((-194 < a354) && (-144 >= a354)) && input == inputs[1]))) && a157 >= -2)) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a290 = 33 ;
    	a41 = (a204 + -5); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((a219 == 7 && (a224 == a342[1] && (input == inputs[0] && ((90 == a42[4]) && ((121 < a376) && (248 >= a376)))))) && (a387 == 32 && (((33 == a326[3]) && (a41 == 12 && ((33 == a20[2]) && ( cf==1  && a212 == a314[2])))) && (70 == a236[3]))))) {
    	cf = 0;
    	a13 = 34 ;
    	a208 = ((a219 - a41) + 13);
    	a350 = a323;
    	a103 = (a41 + -5);
    	a224 = a342[((a380 - a219) - -4)];
    	a299 = 34 ;
    	a293 = a311[(a204 + -9)];
    	a287 = 34 ;
    	a295 = a302[(a103 - 5)];
    	a355 = a235[(a208 - 6)];
    	a236 = a329;
    	a387 = 34 ;
    	a330 = a391[(a208 + -6)];
    	a42 = a34;
    	a380 = (a208 - 2);
    	a359 = 34 ;
    	a369 = (a219 - -3);
    	a230 = 34 ;
    	a161 = a19[(a41 + -7)];
    	a376 = ((((((a376 * a356) % 14999) % 66) + 314) + 0) * 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm6(int input) {
    if((((( cf==1  && a41 == 8) && (78 == a306[2])) && (78 == a306[2])) && ((a304 == 8 && (a304 == 8 && a295 == a302[1])) && a299 == 32))) {
    	if(((a204 == 11 && a230 == 32) && (a330 == a391[1] && (a295 == a302[1] && ((( cf==1  && a2 == a139[6]) && a224 == a342[1]) && (33 == a326[3])))))) {
    		calculate_outputm72(input);
    	} 
    } 
    if((((49 == a234[1]) && (((93 == a350[3]) && a204 == 11) && a380 == 5)) && (((a41 == 9 &&  cf==1 ) && (93 == a350[3])) && a230 == 32))) {
    	if(((a387 == 32 && (a362 == a242[1] && a224 == a342[1])) && (((a322 == 32 && ( cf==1  && a129 == a186[6])) && (45 == a215[1])) && a359 == 32))) {
    		calculate_outputm77(input);
    	} 
    	if(((a380 == 5 && (a387 == 32 && (a129 == a186[7] &&  cf==1 ))) && (((19 < a257) && (234 >= a257)) && (((-144 < a356) && (-88 >= a356)) && (a230 == 32 && a322 == 32))))) {
    		calculate_outputm78(input);
    	} 
    } 
    if((((12 == a264[1]) && (12 == a264[1])) && ((a331 == 32 && ((( cf==1  && a41 == 10) && ((121 < a376) && (248 >= a376))) && a232 == 32)) && a230 == 32))) {
    	if((((a328 == 5 && (a331 == 32 && a324 == a341[1])) && ((-166 < a347) && (-48 >= a347))) && (a380 == 5 && (( cf==1  && ((-135 < a44) && (-111 >= a44))) && a388 == 9)))) {
    		calculate_outputm79(input);
    	} 
    	if((((49 == a234[1]) && (93 == a350[3])) && ((((( cf==1  && ((-111 < a44) && (51 >= a44))) && a208 == 7) && (45 == a215[1])) && a324 == a341[1]) && a287 == 32))) {
    		calculate_outputm80(input);
    	} 
    } 
    if(((((157 < a260) && (316 >= a260)) && (a41 == 11 &&  cf==1 )) && (a330 == a391[1] && (a322 == 32 && (((78 == a306[2]) && (12 == a264[1])) && a299 == 32))))) {
    	if(((a322 == 32 && a324 == a341[1]) && ((49 == a234[1]) && ((a359 == 32 && ((a193 == 10 &&  cf==1 ) && a330 == a391[1])) && (89 == a277[0]))))) {
    		calculate_outputm84(input);
    	} 
    } 
    if(((((23 < a280) && (145 >= a280)) && (a230 == 32 && ( cf==1  && a41 == 12))) && ((a362 == a242[1] && (a208 == 7 && a295 == a302[1])) && a224 == a342[1]))) {
    	if(((a331 == 32 && (((a212 == a314[2] &&  cf==1 ) && a394 == 2) && a355 == a235[1])) && ((a359 == 32 && a293 == a311[1]) && a387 == 32))) {
    		calculate_outputm85(input);
    	} 
    } 
}
 void calculate_outputm88(int input) {
    if((((((234 < a257) && (380 >= a257)) && ((((44 == a52[1]) && (((248 < a376) && (381 >= a376)) && a328 == 6)) && a328 == 6) && a369 == 10)) && (a13 == 33 && (a204 == 12 && ((( cf==1  && (94 == a42[2])) && a103 == 1) && input == inputs[0])))) && a4 >= 2)) {
    	cf = 0;
    	a54 = (a388 - -2);
    	a13 = 35 ;
    	a299 = 34 ;
    	a377 = a374[(a219 + -6)];
    	a380 = (a394 + 3);
    	a11 = a40; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((a13 == 33 && ((a293 == a311[2] && ((94 == a42[2]) && ( cf==1  && (44 == a52[1])))) && ((-144 < a354) && (-28 >= a354)))) && input == inputs[3]) && ((((-48 < a347) && (127 >= a347)) && ((((234 < a257) && (380 >= a257)) && ((234 < a257) && (380 >= a257))) && a370 == 34)) && a103 == 1))) {
	if((a167 + 20) > a167){
	a167  +=  3 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a354 = ((((((((a257 * a347) % 14999) % 24) + -169) * 1) * 5) % 24) - 161);
    	a376 = ((((((a376 * a344) % 14999) % 63) + 185) - 1) + 1);
    	a279 = (((((((a279 * a354) % 14999) % 101) + 64) + -1) + 25926) - 25925);
    	a232 = 32 ;
    	a42 = a76;
    	a369 = (a204 + -3);
    	a102 = a17[((a208 * a219) + -61)];
    	a331 = 32 ;
    	a256 = a312;
    	a20 = a16;
    	a219 = ((a380 - a204) - -14);
    	a236 = a267;
    	a230 = 32 ;
    	a208 = (a369 - 2);
    	a359 = 32 ;
    	a204 = (a103 + 10); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((a208 == 8 && (((94 == a42[2]) && (98 == a277[3])) && a103 == 1)) && ((51 == a215[1]) && ((a359 == 34 && (((-105 < a344) && (76 >= a344)) && (((44 == a52[1]) && (a13 == 33 &&  cf==1 )) && input == inputs[1]))) && ((166 < a279) && (330 >= a279)))))) {
    	cf = 0;
    	a234 = a214;
    	a155 = (a103 - -7);
    	a347 = (((((a347 * a344) / 5) + -17479) * 10) / 9);
    	a264 = a393;
    	a380 = ((a155 * a328) - 42);
    	a306 = a213;
    	a377 = a374[(a155 + -6)];
    	a13 = 32 ;
    	a163 = a174;
    	a326 = a360;
    	a299 = 34 ;
    	a295 = a302[(a388 - 8)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm89(int input) {
    if(((((94 == a42[2]) && ((((((248 < a376) && (381 >= a376)) && (22 == a264[5])) && a295 == a302[2]) && a13 == 33) && a200 == a152[4])) && (a217 == a233[2] && (a369 == 10 && (a322 == 34 && ((input == inputs[2] &&  cf==1 ) && a103 == 2))))) && a167 <= -13)) {
    	cf = 0;
    	a376 = (((((a376 * a354) % 14999) + -6247) / 5) / 5);
    	a381 = a390;
    	a43 = a61[(a103 + -2)];
    	a217 = a233[(a103 - 2)];
    	a277 = a368;
    	a299 = 33 ;
    	a344 = ((((((a344 * a347) % 14999) + 13260) % 14906) + -15093) + -1);
    	a98 = a67[((a103 * a369) - 15)];
    	a224 = a342[(a204 - 10)];
    	a331 = 33 ;
    	a230 = 33 ;
    	a42 = a197;
    	a215 = a205;
    	a236 = a397;
    	a356 = ((((((a356 * a347) % 14999) + -18999) - 7993) + 20450) - 15420);
    	a359 = 33 ;
    	a232 = 33 ;
    	a234 = a305;
    	a330 = a391[(a219 + -8)];
    	a304 = (a208 + -1); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a217 == a233[2] && (76 == a236[3])) && ((a299 == 34 && ((a208 == 8 && (((a200 == a152[4] && (( cf==1  && a103 == 2) && a13 == 33)) && (94 == a42[2])) && input == inputs[3])) && a304 == 9)) && ((-144 < a354) && (-28 >= a354))))) {
    	cf = 0;
    	 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a328 == 6 && (a331 == 34 && (a362 == a242[2] && (((a200 == a152[4] &&  cf==1 ) && (94 == a42[2])) && a13 == 33)))) && ((-88 < a356) && (-18 >= a356))) && (input == inputs[4] && ((a324 == a341[2] && a330 == a391[2]) && a103 == 2)))) {
    	cf = 0;
    	a258 = (((((((a344 * a257) % 14999) / 5) + -14484) + 6847) * -1) / 10);
    	a103 = (a369 + -4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm90(int input) {
    if((((a388 == 10 && (a295 == a302[2] && (a13 == 33 && (input == inputs[1] &&  cf==1 )))) && a304 == 9) && (a103 == 2 && ((94 == a42[2]) && (a355 == a235[2] && ((a200 == a152[5] && ((-144 < a354) && (-28 >= a354))) && ((-48 < a347) && (127 >= a347)))))))) {
    	cf = 0;
    	a219 = (a204 + -4);
    	a232 = 34 ;
    	a161 = a19[(a103 - -1)];
    	a279 = (((((((a260 * a376) % 14999) % 81) + 210) - 10) - 21710) - -21719);
    	a204 = (a219 + 4);
    	a13 = 34 ;
    	a369 = ((a328 - a208) + 12);
    	a394 = (a304 / a380);
    	a386 = (a328 - -6);
    	a257 = (((((((a344 * a260) % 14999) % 72) - -307) + -1) - 1660) + 1661);
    	a370 = 33 ;
    	a356 = ((((((a280 * a347) % 14928) + -15071) - 2) + 4464) + -4463);
    	a277 = a382;
    	a287 = 34 ;
    	a326 = a321;
    	a330 = a391[(a219 + -6)];
    	a344 = ((((((a280 * a260) % 14999) / 5) - -22136) * 10) / -9);
    	a324 = a341[(a380 - 4)];
    	a264 = a393;
    	a299 = 34 ;
    	a355 = a235[(a369 + -10)];
    	a293 = a311[(a380 - 6)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((((316 < a260) && (416 >= a260)) && ((a13 == 33 && (a322 == 34 && (84 == a306[2]))) && a103 == 2)) && ((-48 < a347) && (127 >= a347))) && ((a331 == 34 && (input == inputs[2] && (((94 == a42[2]) &&  cf==1 ) && a200 == a152[5]))) && (36 == a326[0])))) {
    	cf = 0;
    	a344 = (((((((a344 * a376) % 14999) % 41) + -145) + -2) / 5) + -123);
    	a370 = 34 ;
    	a356 = (((((((a257 * a260) % 14999) % 27) - 130) / 5) - 21860) - -21770);
    	a280 = ((((((a356 * a257) % 14999) % 60) + 84) + -17191) - -17192);
    	a394 = (a208 + -6);
    	a322 = 32 ;
    	a350 = a367;
    	a376 = (((((((a257 * a257) % 14999) % 63) + 156) - 25) + -27975) - -28005);
    	a388 = ((a103 / a219) - -9);
    	a215 = a248;
    	a355 = a235[((a394 + a304) - 10)];
    	a324 = a341[(a204 - 11)];
    	a380 = ((a388 / a103) + 1);
    	a234 = a372;
    	a230 = 32 ;
    	a362 = a242[((a103 * a204) + -23)];
    	a204 = (a219 - -5);
    	a236 = a267;
    	a328 = (a208 - 3);
    	a377 = a374[(a369 + -8)];
    	a208 = ((a219 + a369) - 9);
    	a347 = (((((a347 * a354) % 58) - 105) - 3) - -3);
    	a326 = a201;
    	a20 = a71;
    	a354 = ((((((a354 * a279) + 23434) % 24) - 168) + -26372) - -26371);
    	a217 = a233[(a394 + -1)];
    	a304 = (a394 - -7);
    	a387 = 32 ;
    	a293 = a311[(a103 / a394)];
    	a306 = a262;
    	a129 = a186[((a103 * a103) - -1)];
    	a260 = (((((((a260 * a354) % 14999) % 49) + 365) * 1) + -30287) - -30289);
    	a331 = 33 ;
    	a295 = a302[(a103 + -1)];
    	a42 = a76; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a293 == a311[2] && (((248 < a376) && (381 >= a376)) && ((((-105 < a344) && (76 >= a344)) && ((a200 == a152[5] && ((a13 == 33 && ( cf==1  && input == inputs[3])) && a103 == 2)) && (84 == a306[2]))) && (94 == a42[2])))) && (a293 == a311[2] && a394 == 3))) {
    	cf = 0;
    	a358 = a310[((a328 - a380) + 4)];
    	a103 = ((a394 + a204) + -10); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm91(int input) {
    if(((((input == inputs[2] && (((101 == a350[5]) && (84 == a306[2])) && a103 == 2)) && a388 == 10) && a369 == 10) && (((a200 == a152[6] && (a13 == 33 && ((94 == a42[2]) &&  cf==1 ))) && a295 == a302[2]) && a208 == 8))) {
    	cf = 0;
    	a232 = 33 ;
    	a161 = a19[a328];
    	a306 = a262;
    	a347 = ((((a354 * a344) - -733) + -19681) + -122);
    	a331 = 33 ;
    	a237 = a349;
    	a13 = 34 ;
    	a29 = (a103 - -15);
    	a217 = a233[(a328 - 6)];
    	a394 = (a369 + -9); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((-105 < a344) && (76 >= a344)) && (a370 == 34 && (((((a200 == a152[6] &&  cf==1 ) && a13 == 33) && ((-105 < a344) && (76 >= a344))) && input == inputs[0]) && a304 == 9))) && (94 == a42[2])) && (a103 == 2 && (a322 == 34 && (36 == a326[0]))))) {
    	cf = 0;
    	a13 = 35 ;
    	a57 = a49[(a219 + -3)];
    	a54 = ((a388 / a103) - -3); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm93(int input) {
    if(((((a13 == 33 && (((input == inputs[4] && ((94 == a42[2]) &&  cf==1 )) && a103 == 3) && a362 == a242[2])) && a204 == 12) && a355 == a235[2]) && (((((-48 < a347) && (127 >= a347)) && ((252 < a91) && (406 >= a91))) && a370 == 34) && a362 == a242[2]))) {
    	cf = 0;
    	a299 = 34 ;
    	a219 = (a103 + 5);
    	a257 = ((((((a354 * a260) % 14999) % 72) + 306) + -5476) + 5478);
    	a13 = 32 ;
    	a264 = a393;
    	a155 = (a304 + 1);
    	a359 = 34 ;
    	a32 = (((((((a91 * a91) % 14999) + 7415) / 5) * 5) % 73) + -100);
    	a230 = 34 ;
    	a234 = a214;
    	a293 = a311[(a304 + -8)];
    	a362 = a242[(a304 - 7)];
    	a377 = a374[(a304 + -7)];
    	a277 = a382;
    	a215 = a223;
    	a344 = (((((a280 * a356) % 90) + 16) / 5) + 66);
    	a287 = 34 ;
    	a295 = a302[(a219 + -6)];
    	a304 = ((a394 / a369) + 9); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((65 == a237[1]) && (a103 == 3 && ((input == inputs[1] && ( cf==1  && a13 == 33)) && ((252 < a91) && (406 >= a91))))) && ((((-88 < a356) && (-18 >= a356)) && (a377 == a374[2] && ((a369 == 10 && a304 == 9) && (94 == a42[2])))) && ((166 < a279) && (330 >= a279))))) {
    	cf = 0;
    	a54 = ((a103 / a103) + 7);
    	a13 = 35 ;
    	a57 = a49[(a103 / a103)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((((a103 == 3 && (((252 < a91) && (406 >= a91)) &&  cf==1 )) && a293 == a311[2]) && a13 == 33) && (76 == a236[3])) && a370 == 34) && ((76 == a236[3]) && (((input == inputs[3] && a330 == a391[2]) && a380 == 6) && (94 == a42[2]))))) {
    	cf = 0;
    	a237 = a298;
    	a208 = a328;
    	a295 = a302[(a208 + -6)];
    	a388 = ((a328 / a328) + 7);
    	a381 = a390;
    	a42 = a197;
    	a369 = ((a388 * a328) + -40);
    	a224 = a342[((a208 * a328) - 36)];
    	a359 = 34 ;
    	a257 = ((((((a91 * a279) % 14999) - 16999) + 9655) % 72) - -308);
    	a380 = (a304 + -5);
    	a204 = (a208 + 4);
    	a287 = 33 ;
    	a356 = ((((a356 * a347) + 1515) + -7357) + -7895);
    	a217 = a233[(a388 / a304)];
    	a324 = a341[((a388 / a369) + -1)];
    	a326 = a360;
    	a306 = a262;
    	a293 = a311[(a369 - 7)];
    	a98 = a67[(a103 / a103)];
    	a264 = a393;
    	a331 = 33 ;
    	a230 = 33 ;
    	a322 = 33 ;
    	a377 = a374[(a208 - a219)];
    	a347 = (((((a279 * a344) % 14999) / 5) - 7270) * 2);
    	a362 = a242[(a394 - 3)];
    	a370 = 33 ;
    	a354 = ((((((a354 * a91) % 14999) % 57) - 84) + -2) + -1);
    	a355 = a235[(a369 + -8)];
    	a330 = a391[(a328 - 6)];
    	a304 = ((a380 - a204) + 13);
    	a215 = a205;
    	a279 = (((((((a279 * a347) % 14999) % 81) - -249) - -18517) / 5) + -3511);
    	a137 = a84; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm95(int input) {
    if((((36 == a326[0]) && (input == inputs[3] && (((( cf==1  && (94 == a42[2])) && a103 == 4) && a322 == 34) && ((-135 < a44) && (-111 >= a44))))) && (((a388 == 10 && ((51 == a215[1]) && a219 == 8)) && ((166 < a279) && (330 >= a279))) && a13 == 33))) {
    	cf = 0;
    	a381 = a254;
    	a54 = (a103 - -8);
    	a78 = ((((a44 * a44) - 27159) + 6470) * 3);
    	a42 = a197; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((((248 < a376) && (381 >= a376)) && (((input == inputs[2] && (a13 == 33 &&  cf==1 )) && (94 == a42[2])) && a388 == 10)) && a377 == a374[2]) && ((a230 == 34 && ((a103 == 4 && ((145 < a280) && (181 >= a280))) && ((-135 < a44) && (-111 >= a44)))) && a388 == 10))) {
    	cf = 0;
    	if(((a78 <=  34 && (a330 == a391[1] || (a25 == 16 || a2 == 8))) && a180 == a35[7])) {
    	a13 = 35 ;
    	a54 = (a103 - -5);
    	a399 = (a103 + 1); 
    	}else {
    	a13 = 32 ;
    	a155 = (a103 - -10);
    	a381 = a254;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((input == inputs[1] && (((-135 < a44) && (-111 >= a44)) && (36 == a326[0]))) && a13 == 33) && (a287 == 34 && (((316 < a260) && (416 >= a260)) && ((51 == a215[1]) && (a369 == 10 && (((94 == a42[2]) && (a103 == 4 &&  cf==1 )) && a224 == a342[2]))))))) {
	if((a4 - 20) < a4){
	a4  -=  2 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	if((((12 < a268) && (43 >= a268)) || (((a387 == 35 || (89 == a47[1])) || !(a401 == 7)) && !(a135 == 12)))) {
    	a91 = ((((((a279 * a279) % 14999) + -6706) - -870) / 5) + 12291);
    	a103 = 3; 
    	}else {
    	a20 = a16;
    	a42 = a76;
    	a102 = a17[(a388 - 9)];
    	a256 = a312;
    	}printf("%d\n", 23); fflush(stdout); 
    } 
    if((((((94 == a42[2]) && ( cf==1  && ((-135 < a44) && (-111 >= a44)))) && a299 == 34) && a217 == a233[2]) && (((234 < a257) && (380 >= a257)) && (a13 == 33 && (((a324 == a341[2] && (a299 == 34 && input == inputs[4])) && ((-144 < a354) && (-28 >= a354))) && a103 == 4))))) {
    	cf = 0;
    	if(((40 == a52[3]) || ((((98 == a277[3]) && -28 < a354) || !(a25 == 11)) && a29 == 11))) {
    	a13 = 32 ;
    	a401 = a272[((a369 / a103) - 1)];
    	a155 = ((a394 + a380) - -6); 
    	}else {
    	a42 = a76;
    	a129 = a186[((a103 / a103) + 5)];
    	a20 = a71;
    	a140 = a120;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a388 == 10 && a355 == a235[2]) && (((101 == a350[5]) && (((a299 == 34 && (((( cf==1  && ((-135 < a44) && (-111 >= a44))) && a103 == 4) && (94 == a42[2])) && input == inputs[0])) && a370 == 34) && a13 == 33)) && a328 == 6))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a13 = 36 ;
    	a180 = a35[((a388 + a380) + -14)];
    	a14 = a182[(a380 - 2)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm98(int input) {
    if(((a295 == a302[2] && (((22 == a264[5]) && (((a13 == 33 &&  cf==1 ) && (94 == a42[2])) && a358 == a310[3])) && a103 == 5)) && (a230 == 34 && (((a304 == 9 && input == inputs[3]) && ((-88 < a356) && (-18 >= a356))) && ((-144 < a354) && (-28 >= a354)))))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a381 = a390;
    	a98 = a67[(a103 - -2)];
    	a42 = a197;
    	a54 = (a103 - -7); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((36 == a326[0]) && (((a358 == a310[3] && (((a103 == 5 &&  cf==1 ) && a13 == 33) && (84 == a306[2]))) && a232 == 34) && a322 == 34)) && (a224 == a342[2] && (input == inputs[2] && (a219 == 8 && (94 == a42[2])))))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a399 = a103;
    	a54 = (a380 - -3); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a103 == 5 && (((-144 < a354) && (-28 >= a354)) && a304 == 9)) && (input == inputs[4] && ((((316 < a260) && (416 >= a260)) && (((145 < a280) && (181 >= a280)) && (((( cf==1  && (94 == a42[2])) && a13 == 33) && (98 == a277[3])) && a358 == a310[3]))) && a287 == 34)))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
	if((a157 - 20) < a157){
	a157  -=  3 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	if((((!(45 == a140[5]) || (a224 == 9 || !(a130 == 8))) || a161 == 11) || a161 == a19[6])) {
    	a103 = ((a204 / a328) + -1);
    	a52 = a189; 
    	}else {
    	a41 = (a208 - 2);
    	a306 = a250;
    	a13 = 36 ;
    	a264 = a273;
    	a180 = a35[((a328 / a41) - -6)];
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((a358 == a310[3] && (( cf==1  && a103 == 5) && a13 == 33)) && (94 == a42[2])) && input == inputs[1]) && ((a331 == 34 && (((101 == a350[5]) && (a295 == a302[2] && a219 == 8)) && a230 == 34)) && a232 == 34))) {
    	cf = 0;
    	a155 = (a380 - -5);
    	a13 = 32 ;
    	a106 = (a155 + 2); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((234 < a257) && (380 >= a257)) && ((98 == a277[3]) && ((input == inputs[0] && (((145 < a280) && (181 >= a280)) && (a103 == 5 && (((94 == a42[2]) && ( cf==1  && a358 == a310[3])) && a330 == a391[2])))) && (54 == a234[0])))) && (a13 == 33 && a370 == 34))) {
    	cf = 0;
    	a103 = ((a369 * a369) + -94);
    	a258 = (((78 - -23662) * 1) * 1); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm101(int input) {
    if((((a13 == 33 && ((94 == a42[2]) && (input == inputs[2] &&  cf==1 ))) && a358 == a310[6]) && ((54 == a234[0]) && ((((-88 < a356) && (-18 >= a356)) && (((a204 == 12 && ((-144 < a354) && (-28 >= a354))) && a103 == 5) && a328 == 6)) && ((145 < a280) && (181 >= a280)))))) {
    	cf = 0;
    	if((!(a135 == 16) && ((!(48 == a137[0]) || ((-4 < a258) && (161 >= a258))) || a78 <=  34))) {
    	a356 = (((((a356 * a347) % 14999) / 5) + -4542) + -24713);
    	a331 = 33 ;
    	a388 = a208;
    	a370 = 33 ;
    	a362 = a242[(a394 / a328)];
    	a260 = (((((a260 * a279) % 14999) / 5) + -17273) - 6479);
    	a42 = a197;
    	a234 = a305;
    	a324 = a341[((a304 * a328) + -42)];
    	a150 = (a208 + -4);
    	a354 = ((((((a354 * a376) % 14999) * 2) + -1) % 14903) + -15096);
    	a322 = 33 ;
    	a394 = (a208 + -7);
    	a169 = ((((79 - -7748) - 7920) - 23192) + 23204);
    	a236 = a397;
    	a279 = (((((a279 * a356) % 14999) - 3225) * 1) + -7445);
    	a230 = 33 ;
    	a387 = 33 ;
    	a369 = ((a304 + a204) + -11);
    	a217 = a233[(a380 + -4)];
    	a381 = a395;
    	a328 = ((a388 + a103) + -9);
    	a277 = a368;
    	a208 = (a380 - -2); 
    	}else {
    	a287 = 34 ;
    	a237 = a345;
    	a330 = a391[((a388 - a204) + 4)];
    	a347 = (((((a354 * a280) % 87) - -56) - 15) + -1);
    	a180 = a35[(a394 - -1)];
    	a306 = a262;
    	a376 = ((((((a279 * a347) % 14999) + 12728) % 66) + 315) + 1);
    	a219 = ((a394 * a103) + -7);
    	a232 = 34 ;
    	a304 = ((a208 - a328) + 7);
    	a79 = a133;
    	a215 = a223;
    	a257 = ((((((a376 * a260) % 14999) / 5) % 72) - -242) * 1);
    	a326 = a360;
    	a13 = 36 ;
    	a264 = a393;
    	a344 = (((((((a279 * a279) % 14999) / 5) % 41) - 166) * 10) / 9);
    	a356 = (((((a356 * a347) + -300) - 8008) % 27) + -105);
    	a380 = ((a328 * a103) - 24);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((145 < a280) && (181 >= a280)) && (94 == a42[2])) && a369 == 10) && (((a358 == a310[6] && (((((input == inputs[3] &&  cf==1 ) && a13 == 33) && ((166 < a279) && (330 >= a279))) && a103 == 5) && a217 == a233[2])) && a388 == 10) && a362 == a242[2]))) {
    	cf = 0;
    	a358 = a310[(a103 - 1)]; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((((166 < a279) && (330 >= a279)) && ((a362 == a242[2] && ((a103 == 5 && (76 == a236[3])) && ((316 < a260) && (416 >= a260)))) && a217 == a233[2])) && a293 == a311[2]) && (((94 == a42[2]) && ((a13 == 33 &&  cf==1 ) && input == inputs[1])) && a358 == a310[6]))) {
    	cf = 0;
    	a304 = (a204 + -3);
    	a287 = 34 ;
    	a344 = (((((((a279 * a279) % 14999) + -7120) * 3) + -5293) % 90) + -14);
    	a219 = (a304 - 1);
    	a306 = a213;
    	a215 = a223;
    	a13 = 36 ;
    	a257 = (((((((a260 * a356) % 14999) % 72) - -308) + -16705) + -4840) + 21544);
    	a326 = a360;
    	a376 = (((((a344 * a344) / 5) + -4429) % 66) + 371);
    	a380 = ((a204 + a304) + -15);
    	a330 = a391[(a380 - 4)];
    	a264 = a393;
    	a347 = ((((((a257 * a376) % 14999) + -2981) % 87) - -39) - 0);
    	a232 = 34 ;
    	a180 = a35[((a388 * a103) - 44)];
    	a237 = a345;
    	a102 = a17[((a103 - a103) + 6)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm104(int input) {
    if(((input == inputs[4] && ((a370 == 34 && (( cf==1  && (94 == a42[2])) && a103 == 7)) && (9 == a9[1]))) && ((a224 == a342[2] && (a208 == 8 && (((65 == a237[1]) && a331 == 34) && (65 == a237[1])))) && a13 == 33))) {
    	cf = 0;
    	a13 = 35 ;
    	a54 = (a204 + -3);
    	a399 = ((a388 / a388) + 4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((9 == a9[1]) && ((a355 == a235[2] && (a287 == 34 && (a103 == 7 && ( cf==1  && a13 == 33)))) && ((316 < a260) && (416 >= a260)))) && (a370 == 34 && ((94 == a42[2]) && (input == inputs[2] && ((76 == a236[3]) && (51 == a215[1]))))))) {
    	cf = 0;
    	a155 = (a328 + 2);
    	a13 = 32 ;
    	a163 = a174; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm108(int input) {
    if((((((((input == inputs[4] && (a135 == 15 &&  cf==1 )) && a103 == 8) && (94 == a42[2])) && ((-48 < a347) && (127 >= a347))) && a208 == 8) && a394 == 3) && (a355 == a235[2] && (a13 == 33 && (a217 == a233[2] && a322 == 34))))) {
	if((a4 - 20) < a4){
	a4  -=  1 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a399 = ((a304 + a103) - 12);
    	a54 = (a103 + 1); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a380 == 6 && (((-88 < a356) && (-18 >= a356)) && ((101 == a350[5]) && (84 == a306[2])))) && (a304 == 9 && ((a13 == 33 && ((a135 == 15 && (input == inputs[2] && ( cf==1  && a103 == 8))) && a355 == a235[2])) && (94 == a42[2]))))) {
    	cf = 0;
    	a155 = ((a369 - a103) - -6);
    	a13 = 32 ;
    	a163 = a174;
    	a347 = ((((((a347 * a279) % 14999) + 9092) * 1) / 5) - 26123); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm7(int input) {
    if((((a217 == a233[2] && (((248 < a376) && (381 >= a376)) && ((a103 == 1 &&  cf==1 ) && ((234 < a257) && (380 >= a257))))) && a362 == a242[2]) && (a330 == a391[2] && a287 == 34))) {
    	if(((a287 == 34 && (((a219 == 8 && (51 == a215[1])) && ((-48 < a347) && (127 >= a347))) && ((-48 < a347) && (127 >= a347)))) && (( cf==1  && (44 == a52[1])) && a232 == 34))) {
    		calculate_outputm88(input);
    	} 
    } 
    if(((a208 == 8 && (((316 < a260) && (416 >= a260)) && (((51 == a215[1]) && a394 == 3) && a304 == 9))) && ((54 == a234[0]) && (a103 == 2 &&  cf==1 )))) {
    	if(((((98 == a277[3]) && ((76 == a236[3]) && (a200 == a152[4] &&  cf==1 ))) && a219 == 8) && ((76 == a236[3]) && (a324 == a341[2] && ((166 < a279) && (330 >= a279)))))) {
    		calculate_outputm89(input);
    	} 
    	if(((((316 < a260) && (416 >= a260)) && a217 == a233[2]) && ((a380 == 6 && (((a200 == a152[5] &&  cf==1 ) && (36 == a326[0])) && a387 == 34)) && a377 == a374[2]))) {
    		calculate_outputm90(input);
    	} 
    	if(((((101 == a350[5]) && a387 == 34) && ((316 < a260) && (416 >= a260))) && (((234 < a257) && (380 >= a257)) && ((( cf==1  && a200 == a152[6]) && a328 == 6) && a387 == 34)))) {
    		calculate_outputm91(input);
    	} 
    } 
    if(((a369 == 10 && (((145 < a280) && (181 >= a280)) && (a224 == a342[2] && ((36 == a326[0]) && ((-144 < a354) && (-28 >= a354)))))) && (a224 == a342[2] && (a103 == 3 &&  cf==1 )))) {
    	if(((((166 < a279) && (330 >= a279)) && (( cf==1  && ((252 < a91) && (406 >= a91))) && (22 == a264[5]))) && (a304 == 9 && ((a204 == 12 && a295 == a302[2]) && a208 == 8)))) {
    		calculate_outputm93(input);
    	} 
    } 
    if(((((a369 == 10 && (36 == a326[0])) && (76 == a236[3])) && a355 == a235[2]) && ((((248 < a376) && (381 >= a376)) && (a103 == 4 &&  cf==1 )) && ((248 < a376) && (381 >= a376))))) {
    	if(((((-144 < a354) && (-28 >= a354)) && ((a219 == 8 && (((-135 < a44) && (-111 >= a44)) &&  cf==1 )) && (65 == a237[1]))) && (((-48 < a347) && (127 >= a347)) && ((65 == a237[1]) && a299 == 34)))) {
    		calculate_outputm95(input);
    	} 
    } 
    if((((76 == a236[3]) && a387 == 34) && ((((((-88 < a356) && (-18 >= a356)) && (a103 == 5 &&  cf==1 )) && a362 == a242[2]) && a204 == 12) && a324 == a341[2]))) {
    	if((((a230 == 34 && ((54 == a234[0]) && (a304 == 9 && (76 == a236[3])))) && a204 == 12) && (a394 == 3 && (a358 == a310[3] &&  cf==1 )))) {
    		calculate_outputm98(input);
    	} 
    	if(((((-144 < a354) && (-28 >= a354)) && (a369 == 10 && (a370 == 34 && ((101 == a350[5]) && a377 == a374[2])))) && ((98 == a277[3]) && (a358 == a310[6] &&  cf==1 )))) {
    		calculate_outputm101(input);
    	} 
    } 
    if(((((316 < a260) && (416 >= a260)) && ((a232 == 34 && ( cf==1  && a103 == 7)) && a394 == 3)) && (a293 == a311[2] && (a304 == 9 && a331 == 34)))) {
    	if(((((65 == a237[1]) && (((9 == a9[1]) &&  cf==1 ) && a330 == a391[2])) && a287 == 34) && (a208 == 8 && ((51 == a215[1]) && a217 == a233[2])))) {
    		calculate_outputm104(input);
    	} 
    } 
    if((((((((316 < a260) && (416 >= a260)) && ((248 < a376) && (381 >= a376))) && a331 == 34) && a330 == a391[2]) && ((145 < a280) && (181 >= a280))) && (((-48 < a347) && (127 >= a347)) && (a103 == 8 &&  cf==1 )))) {
    	if(((a208 == 8 && (a355 == a235[2] && ((-105 < a344) && (76 >= a344)))) && ((a224 == a342[2] && (( cf==1  && a135 == 15) && ((145 < a280) && (181 >= a280)))) && ((166 < a279) && (330 >= a279))))) {
    		calculate_outputm108(input);
    	} 
    } 
}
 void calculate_outputm109(int input) {
    if(((((94 == a163[4]) && ((a293 == a311[2] && (((input == inputs[4] &&  cf==1 ) && (94 == a42[2])) && a155 == 8)) && (101 == a350[5]))) && a217 == a233[2]) && (((a362 == a242[2] && ((234 < a257) && (380 >= a257))) && a13 == 32) && a362 == a242[2]))) {
    	cf = 0;
    	a280 = (((((((a279 * a279) % 14999) % 17) + 152) * 1) / 5) + 137);
    	a161 = a19[((a155 * a155) - 62)];
    	a354 = (((((((a260 * a260) % 14999) - 22120) % 57) + -64) + -10730) - -10754);
    	a370 = 34 ;
    	a347 = (((((((a376 * a279) % 14999) % 87) - 44) + 59) * 10) / 9);
    	a324 = a341[(a394 + -1)];
    	a356 = (((((((a257 * a279) % 14999) % 34) - 59) / 5) + -12686) + 12649);
    	a398 = a339;
    	a306 = a262;
    	a13 = 34 ;
    	a279 = ((((((a279 * a257) % 14999) - 10955) / 5) % 81) - -248); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((94 == a42[2]) && ((a388 == 10 && ((((166 < a279) && (330 >= a279)) && a299 == 34) && (94 == a163[4]))) && a387 == 34)) && ((234 < a257) && (380 >= a257))) && (a13 == 32 && (((a155 == 8 &&  cf==1 ) && input == inputs[1]) && a299 == 34)))) {
	if((a157 - 20) < a157){
	a157  -=  3 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a161 = a19[a328];
    	a54 = (a219 + 2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((65 == a237[1]) && ((101 == a350[5]) && ((input == inputs[3] && ((94 == a163[4]) &&  cf==1 )) && a13 == 32))) && ((36 == a326[0]) && ((((a355 == a235[2] && a387 == 34) && a155 == 8) && (94 == a42[2])) && ((-105 < a344) && (76 >= a344)))))) {
	if((a4 + 20) > a4){
	a4  +=  1 ;}
	 else{	
	a4  +=  0;}
	if((a167 - 20) < a167){
	a167  -=  4 ;}
	 else{	
	a167  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if((!(a290 == 35) || (!(a217 == 13) && (!(94 == a163[4]) && (a161 == 12 && a224 == 5))))) {
    	a103 = (a394 - -4);
    	a13 = 33 ;
    	a9 = a66; 
    	}else {
    	a299 = 32 ;
    	a328 = (a388 + -5);
    	a347 = ((((((a344 * a279) % 14999) * 2) + -1) % 58) - 107);
    	a42 = a76;
    	a350 = a367;
    	a306 = a262;
    	a234 = a372;
    	a295 = a302[(a328 + -4)];
    	a370 = 32 ;
    	a293 = a311[(a219 - 7)];
    	a330 = a391[(a219 + -7)];
    	a277 = a338;
    	a129 = a186[(a155 - 3)];
    	a394 = (a208 + -6);
    	a387 = 32 ;
    	a257 = (((((((a257 * a347) % 14999) % 107) + 127) + -1) / 5) - -31);
    	a369 = (a328 + 4);
    	a232 = 32 ;
    	a326 = a201;
    	a264 = a270;
    	a260 = ((((((a260 * a347) % 14999) % 79) + 236) - -24477) - 24475);
    	a236 = a267;
    	a376 = ((((((a344 * a279) % 14999) % 63) + 184) - -5371) - 5369);
    	a388 = (a328 - -4);
    	a322 = 32 ;
    	a331 = 32 ;
    	a280 = (((((a344 * a376) % 60) - -84) + 2) + -1);
    	a324 = a341[(a380 + -5)];
    	a20 = a71;
    	a103 = ((a219 / a204) + 6);
    	a219 = (a394 + 5);
    	}printf("%d\n", 26); fflush(stdout); 
    } 
    if((((((166 < a279) && (330 >= a279)) && ((54 == a234[0]) && ((84 == a306[2]) && ((94 == a163[4]) && (a369 == 10 && a324 == a341[2]))))) && a369 == 10) && (((( cf==1  && (94 == a42[2])) && a13 == 32) && a155 == 8) && input == inputs[2]))) {
    	cf = 0;
    	a103 = (a380 - 4);
    	a370 = 33 ;
    	a280 = (((((a260 * a344) % 14999) + -14998) + -1) + -1);
    	a287 = 33 ;
    	a200 = a152[((a328 / a388) - -4)];
    	a13 = 33 ;
    	a204 = (a208 - -2); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm110(int input) {
    if(((a370 == 34 && (((166 < a279) && (330 >= a279)) && input == inputs[2])) && (a388 == 10 && (((94 == a42[2]) && ((100 == a163[4]) && (((( cf==1  && a155 == 8) && a13 == 32) && (76 == a236[3])) && ((-48 < a347) && (127 >= a347))))) && a370 == 34)))) {
    	cf = 0;
    	a208 = (a380 + 2);
    	a354 = (((((((a257 * a257) % 14999) - 26373) * 1) * 1) % 24) - 145);
    	a324 = a341[(a204 - 11)];
    	a219 = a208;
    	a322 = 32 ;
    	a377 = a374[(a369 / a208)];
    	a103 = ((a328 / a369) - -2);
    	a129 = a186[(a328 - 1)];
    	a293 = a311[((a204 - a208) - 4)];
    	a20 = a71;
    	a350 = a367;
    	a347 = ((((((a347 * a376) % 14999) % 58) - 105) - 24711) + 24709);
    	a280 = ((((((a354 * a260) % 14999) % 60) + 85) - 1) + -1);
    	a362 = a242[(a204 - 11)];
    	a217 = a233[(a208 / a380)];
    	a230 = 32 ;
    	a277 = a338;
    	a279 = ((((((a279 * a354) % 14999) % 101) + 65) - -1) + -2);
    	a394 = (a388 - 8);
    	a234 = a372;
    	a356 = (((((((a356 * a376) % 14999) % 27) + -115) + 10355) - -19154) + -29508);
    	a304 = ((a394 - a208) + 14);
    	a264 = a270;
    	a387 = 32 ;
    	a355 = a235[(a155 + -7)];
    	a260 = (((((((a260 * a376) % 14999) - -14411) - -487) + 83) % 49) + 327);
    	a287 = 32 ;
    	a42 = a76;
    	a388 = ((a208 - a328) - -8);
    	a236 = a267;
    	a232 = 32 ;
    	a376 = ((((((a376 * a356) % 14999) % 63) - -185) + -1) - -1);
    	a369 = ((a204 * a204) - 135);
    	a331 = 33 ;
    	a328 = ((a219 / a204) - -5);
    	a370 = 34 ;
    	a204 = (a219 + 5); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((( cf==1  && a13 == 32) && (100 == a163[4])) && a394 == 3) && ((input == inputs[1] && (a394 == 3 && (a224 == a342[2] && (((-144 < a354) && (-28 >= a354)) && ((a322 == 34 && a219 == 8) && a155 == 8))))) && (94 == a42[2])))) {
    	cf = 0;
    	a330 = a391[(a219 + -6)];
    	a380 = (a304 - 3);
    	a180 = a35[((a155 - a155) - -6)];
    	a257 = (((((((a260 * a376) % 14999) % 72) + 256) - -39) + -25852) + 25853);
    	a13 = 36 ;
    	a299 = 34 ;
    	a295 = a302[(a219 - 6)];
    	a215 = a223;
    	a306 = a213;
    	a326 = a360;
    	a344 = ((((((a347 * a356) / 5) - -26624) / 5) % 90) - 63);
    	a102 = a17[(a219 - 2)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((((((-48 < a347) && (127 >= a347)) && ((100 == a163[4]) && a387 == 34)) && input == inputs[3]) && a155 == 8) && ((166 < a279) && (330 >= a279))) && a287 == 34) && (a293 == a311[2] && (a204 == 12 && (((94 == a42[2]) &&  cf==1 ) && a13 == 32))))) {
    	cf = 0;
    	a358 = a310[(a155 - 4)];
    	a13 = 33 ;
    	a103 = (a369 - 5); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm112(int input) {
    if((((((-193 < a32) && (-162 >= a32)) && ((145 < a280) && (181 >= a280))) && a204 == 12) && (((234 < a257) && (380 >= a257)) && (((54 == a234[0]) && ((54 == a234[0]) && (((a155 == 10 && ( cf==1  && a13 == 32)) && (94 == a42[2])) && input == inputs[2]))) && (65 == a237[1]))))) {
    	cf = 0;
    	a20 = a170;
    	a42 = a76;
    	a129 = a186[(a394 + -1)];
    	a41 = (a204 + -3); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a324 == a341[2] && ((a155 == 10 && ((((248 < a376) && (381 >= a376)) && a232 == 34) && a13 == 32)) && a293 == a311[2])) && ((a362 == a242[2] && (((-193 < a32) && (-162 >= a32)) && ((94 == a42[2]) && ( cf==1  && input == inputs[0])))) && a232 == 34))) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	if(((40 == a52[3]) || a359 == 34)) {
    	a129 = a186[(a369 - 5)];
    	a103 = (a388 - 2);
    	a20 = a71;
    	a42 = a76; 
    	}else {
    	a155 = (a369 - -5);
    	a401 = a272[(a394 - 2)];
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((94 == a42[2]) && ((65 == a237[1]) && (((-193 < a32) && (-162 >= a32)) && (a13 == 32 &&  cf==1 )))) && a322 == 34) && a362 == a242[2]) && (a359 == 34 && ((input == inputs[3] && (a359 == 34 && a304 == 9)) && a155 == 10)))) {
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(((!(a13 == 34) || ((((121 < a376) && (248 >= a376)) || a362 == 9) || a161 == a19[2])) && !(a0 == 34))) {
    	a331 = 32 ;
    	a381 = a390;
    	a376 = (((((a376 * 10) / 6) * 10) / 9) + 9483);
    	a208 = 10;
    	a217 = a233[6];
    	a204 = 16;
    	a304 = 8;
    	a43 = a61[((a388 - a369) - -3)];
    	a387 = 35 ;
    	a287 = 32 ;
    	a257 = ((((a257 * 17) / 10) * 5) + 8552);
    	a330 = a391[6];
    	a362 = a242[4];
    	a355 = a235[6];
    	a237 = a345;
    	a234 = a372;
    	a42 = a197;
    	a369 = 13;
    	a219 = 13;
    	a277 = a338;
    	a359 = 35 ;
    	a293 = a311[6];
    	a394 = 2;
    	a232 = 34 ;
    	a324 = a341[3];
    	a98 = a67[(a380 - 1)];
    	a224 = a342[5];
    	a388 = 9;
    	a380 = 7; 
    	}else {
    	a129 = a186[(a155 - 8)];
    	a20 = a71;
    	a42 = a76;
    	a150 = (a155 - 1);
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a362 == a242[2] && (a13 == 32 && (a322 == 34 && (((94 == a42[2]) && ((input == inputs[1] &&  cf==1 ) && ((-193 < a32) && (-162 >= a32)))) && a287 == 34)))) && a304 == 9) && ((a155 == 10 && a324 == a341[2]) && a362 == a242[2]))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a42 = a76;
    	a129 = a186[(a219 - 2)];
    	a20 = a71;
    	a140 = a120; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((94 == a42[2]) && (((-193 < a32) && (-162 >= a32)) && (a295 == a302[2] && ((76 == a236[3]) && (a155 == 10 && (input == inputs[4] &&  cf==1 )))))) && (a219 == 8 && (a295 == a302[2] && ((((166 < a279) && (330 >= a279)) && (54 == a234[0])) && a13 == 32))))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a20 = a170;
    	a234 = a305;
    	a354 = (((54 - 208) - 27) - 8);
    	a215 = a223;
    	a299 = 33 ;
    	a304 = 7;
    	a356 = ((((1 * 5) - 1048) + -22868) - -47553);
    	a344 = (((((93 * -21) / 10) * 5) * 10) / 9);
    	a204 = 17;
    	a370 = 33 ;
    	a232 = 35 ;
    	a359 = 35 ;
    	a322 = 36 ;
    	a362 = a242[7];
    	a224 = a342[5];
    	a230 = 35 ;
    	a376 = ((((a376 - 25725) - 2887) % 66) + 335);
    	a331 = 34 ;
    	a42 = a76;
    	a260 = ((((a260 * -5) * 10) / 9) - 22667);
    	a219 = 13;
    	a41 = (a369 + -1);
    	a277 = a368;
    	a347 = ((((39 - -15210) * 10) / -9) - 8997);
    	a328 = 6;
    	a350 = a323;
    	a380 = 8;
    	a388 = 14;
    	a330 = a391[3];
    	a324 = a341[5];
    	a208 = 12;
    	a293 = a311[7];
    	a326 = a321;
    	a279 = (((a279 - 18472) / 5) * 5);
    	a387 = 33 ;
    	a369 = 8;
    	a129 = a186[(a41 + -3)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm113(int input) {
    if(((a219 == 8 && (a155 == 10 && (( cf==1  && input == inputs[0]) && ((-162 < a32) && (-15 >= a32))))) && (a13 == 32 && ((a388 == 10 && ((76 == a236[3]) && (a217 == a233[2] && (((-88 < a356) && (-18 >= a356)) && (94 == a42[2]))))) && ((-88 < a356) && (-18 >= a356)))))) {
    	cf = 0;
    	a106 = (a155 - -3);
    	a155 = ((a380 - a380) - -11); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((input == inputs[3] && ((a380 == 6 && a330 == a391[2]) && (36 == a326[0]))) && (((65 == a237[1]) && (a13 == 32 && (((94 == a42[2]) && ((((-162 < a32) && (-15 >= a32)) &&  cf==1 ) && a155 == 10)) && ((-144 < a354) && (-28 >= a354))))) && (65 == a237[1])))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	if( cf==1 ) {
    	a299 = 33 ;
    	a344 = (((((a354 * a32) - 29020) + -631) + 8674) - 8332);
    	a75 = a176[((a155 - a155) + 1)];
    	a219 = (a208 + -2);
    	a155 = (a328 + 7);
    	a330 = a391[(a388 - 10)];
    	a234 = a305;
    	a331 = 33 ;
    	a293 = a311[((a208 / a369) - -2)];
    	a377 = a374[((a380 - a304) - -3)]; 
    	}else {
    	a103 = (a155 - 7);
    	a299 = 33 ;
    	a234 = a305;
    	a277 = a368;
    	a344 = (((((a32 * a354) * 1) + -12398) / 5) + -9203);
    	a13 = 33 ;
    	a91 = ((((((a32 * a32) % 76) - -266) - -17404) * 1) - 17391);
    	a219 = ((a204 / a388) - -5);
    	a293 = a311[((a388 + a103) + -11)];
    	}printf("%d\n", 23); fflush(stdout); 
    } 
    if(((((-144 < a354) && (-28 >= a354)) && ((94 == a42[2]) && (((145 < a280) && (181 >= a280)) && (a155 == 10 && ((a13 == 32 && ( cf==1  && input == inputs[2])) && ((-48 < a347) && (127 >= a347))))))) && (((a328 == 6 && (101 == a350[5])) && ((-162 < a32) && (-15 >= a32))) && ((316 < a260) && (416 >= a260))))) {
    	cf = 0;
    	a237 = a349;
    	a347 = ((((a347 * a344) - 16617) / 5) + -14607);
    	a306 = a262;
    	a13 = 34 ;
    	a232 = 33 ;
    	a324 = a341[(a380 - 6)];
    	a29 = (a380 + 11);
    	a217 = a233[((a369 * a208) - 80)];
    	a161 = a19[((a388 - a155) + 6)];
    	a331 = 33 ;
    	a394 = (a219 - 7); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm114(int input) {
    if(((((a324 == a341[2] && (input == inputs[2] && a362 == a242[2])) && a324 == a341[2]) && a155 == 10) && (((a369 == 10 && (a219 == 8 && (( cf==1  && (94 == a42[2])) && -15 < a32))) && a377 == a374[2]) && a13 == 32))) {
    	cf = 0;
    	a224 = a342[(a369 + -9)];
    	a377 = a374[(a380 + -4)];
    	a347 = (((((a347 * a354) + 6830) - 3739) % 58) - 107);
    	a376 = ((((((a376 * a279) % 14999) + -14320) % 63) - -184) + 1);
    	a42 = a76;
    	a322 = 32 ;
    	a324 = a341[(a208 - 7)];
    	a217 = a233[(a369 + -9)];
    	a330 = a391[(a304 - 7)];
    	a41 = ((a208 + a369) - 9);
    	a129 = a186[(a388 + -3)];
    	a232 = 32 ;
    	a260 = ((((((a260 * a279) % 14999) % 79) - -237) - 1) * 1);
    	a362 = a242[(a155 + -9)];
    	a387 = 32 ;
    	a388 = ((a369 + a219) - 9);
    	a219 = (a155 + -3);
    	a20 = a170;
    	a208 = (a155 + -3);
    	a331 = 32 ;
    	a350 = a367;
    	a369 = ((a204 / a204) + 8); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm119(int input) {
    if(((((a293 == a311[2] && (input == inputs[4] && a208 == 8)) && ((-144 < a354) && (-28 >= a354))) && a13 == 32) && (((-144 < a354) && (-28 >= a354)) && (((-88 < a356) && (-18 >= a356)) && (((((94 == a42[2]) &&  cf==1 ) && a155 == 13) && a370 == 34) && a75 == a176[1]))))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a344 = (((((((a347 * a279) % 14999) % 90) + -14) - 21549) * 1) + 21548);
    	a215 = a223;
    	a230 = 34 ;
    	a293 = a311[(a204 - 11)];
    	a295 = a302[(a388 + -8)];
    	a257 = (((((((a347 * a260) % 14999) - 10956) / 5) / 5) % 72) - -308);
    	a359 = 34 ;
    	a299 = 34 ;
    	a219 = (a304 + -1);
    	a330 = a391[((a208 + a219) + -14)];
    	a377 = a374[((a328 - a369) - -6)];
    	a155 = (a204 - 2);
    	a331 = 34 ;
    	a234 = a214;
    	a264 = a393;
    	a362 = a242[(a388 - 8)];
    	a287 = 34 ;
    	a304 = (a380 - -3);
    	a32 = (((((60 - 126) * 9) / 10) + -27016) + 27058); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((((51 == a215[1]) && (94 == a42[2])) && a295 == a302[2]) && ((a204 == 12 && (((input == inputs[1] && ((a75 == a176[1] && ( cf==1  && a13 == 32)) && a387 == 34)) && a155 == 13) && a295 == a302[2])) && (22 == a264[5])))) {
    	cf = 0;
    	a13 = 35 ;
    	a54 = ((a155 + a155) + -18);
    	a57 = a49[((a155 * a54) - 103)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a230 == 34 && (((-48 < a347) && (127 >= a347)) && (a369 == 10 && (input == inputs[3] && ((-88 < a356) && (-18 >= a356)))))) && ((94 == a42[2]) && (a380 == 6 && (a369 == 10 && (((a155 == 13 &&  cf==1 ) && a75 == a176[1]) && a13 == 32)))))) {
    	cf = 0;
    	a347 = ((((a347 * a354) * 1) + -10543) / 5);
    	a369 = (a155 + -5);
    	a279 = (((((((a260 * a354) % 14999) % 81) + 248) / 5) + -12740) - -12931);
    	a264 = a393;
    	a370 = 33 ;
    	a237 = a298;
    	a277 = a368;
    	a359 = 34 ;
    	a230 = 33 ;
    	a381 = a390;
    	a362 = a242[((a388 - a369) + -2)];
    	a208 = (a369 - 2);
    	a324 = a341[((a155 / a369) + -1)];
    	a217 = a233[((a388 - a204) - -2)];
    	a257 = ((((((a347 * a354) % 14999) % 72) - -266) + 41) - 1);
    	a98 = a67[(a380 + -5)];
    	a304 = ((a204 - a380) + 1);
    	a287 = 33 ;
    	a388 = ((a208 / a155) + 8);
    	a326 = a360;
    	a42 = a197;
    	a224 = a342[((a204 * a204) - 144)];
    	a322 = 33 ;
    	a215 = a205;
    	a306 = a262;
    	a380 = (a155 + -9);
    	a355 = a235[(a304 - 7)];
    	a137 = a84;
    	a293 = a311[(a155 - 12)];
    	a295 = a302[(a219 - 6)];
    	a204 = (a369 + 2);
    	a354 = ((((((a354 * a356) + 9817) % 57) - 105) + 28113) - 28134);
    	a356 = ((((a356 * a280) + -2454) * 1) - 7502); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm122(int input) {
    if(((a13 == 32 && (((104 == a381[4]) &&  cf==1 ) && input == inputs[3])) && ((a155 == 14 && ((a232 == 34 && ((98 == a277[3]) && (((65 == a237[1]) && (98 == a277[3])) && a204 == 12))) && (76 == a236[3]))) && (94 == a42[2])))) {
	if((a4 + 20) > a4){
	a4  +=  1 ;}
	 else{	
	a4  +=  0;}
	if((a167 - 20) < a167){
	a167  -=  4 ;}
	 else{	
	a167  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if((a130 == 1 && (!(a362 == 11) && (a25 == 12 && (a31 == 5 && a161 == a19[0]))))) {
    	a331 = 34 ;
    	a370 = 33 ;
    	a215 = a205;
    	a377 = a374[((a155 / a155) + 1)];
    	a293 = a311[(a380 - 6)];
    	a347 = (((((((a347 * a376) % 14999) - 2718) + -9769) - 102) % 14917) + -15082);
    	a326 = a360;
    	a161 = a19[(a155 - 13)];
    	a355 = a235[((a369 + a328) + -16)];
    	a362 = a242[(a369 + -10)];
    	a332 = (a388 - 5);
    	a328 = (a304 + -5);
    	a13 = 34 ;
    	a204 = ((a155 + a332) + -9);
    	a295 = a302[(a208 + -8)]; 
    	}else {
    	a13 = 33 ;
    	a135 = (a388 - -5);
    	a103 = (a304 - 1);
    	}printf("%d\n", 26); fflush(stdout); 
    } 
    if((((104 == a381[4]) && (a13 == 32 && ((a304 == 9 && a224 == a342[2]) && (101 == a350[5])))) && ((((a370 == 34 && (((94 == a42[2]) &&  cf==1 ) && input == inputs[4])) && a217 == a233[2]) && a387 == 34) && a155 == 14))) {
    	cf = 0;
    	a161 = a19[((a328 / a388) - -2)];
    	a354 = (((((((a354 * a260) % 14999) + 12792) % 57) + -84) / 5) - 72);
    	a279 = ((((((a347 * a257) % 14999) % 81) + 249) / 5) - -186);
    	a370 = 34 ;
    	a356 = (((((((a376 * a280) % 14999) % 34) + -66) + -14528) - -42544) + -28011);
    	a398 = a339;
    	a280 = (((((a280 * a347) + -21170) % 17) - -164) + -1);
    	a306 = a262;
    	a324 = a341[(a328 - 4)];
    	a13 = 34 ;
    	a347 = (((((((a347 * a257) % 14999) % 87) + 39) - -1) - -4557) - 4556); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((a331 == 34 && ((94 == a42[2]) && ((a362 == a242[2] && (a13 == 32 && a299 == 34)) && a219 == 8))) && a324 == a341[2]) && (a322 == 34 && (a155 == 14 && ((input == inputs[1] &&  cf==1 ) && (104 == a381[4])))))) {
    	cf = 0;
    	a13 = 35 ;
    	a161 = a19[((a155 - a155) - -6)];
    	a54 = (a155 - 4); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((51 == a215[1]) && (a380 == 6 && ((104 == a381[4]) && (a13 == 32 &&  cf==1 )))) && ((234 < a257) && (380 >= a257))) && ((((-48 < a347) && (127 >= a347)) && (((input == inputs[2] && a388 == 10) && a155 == 14) && (94 == a42[2]))) && (54 == a234[0])))) {
    	cf = 0;
    	a204 = ((a208 / a219) - -9);
    	a103 = (a328 - 4);
    	a200 = a152[(a103 - -2)];
    	a347 = (((((a347 * a356) - 7757) / 5) * 10) / 9);
    	a370 = 33 ;
    	a13 = 33 ;
    	a287 = 33 ;
    	a280 = (((((a280 * a260) % 14999) - 21141) + -4030) - 1266); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm124(int input) {
    if(((((a401 == a272[2] &&  cf==1 ) && a155 == 15) && input == inputs[0]) && (a324 == a341[2] && (a230 == 34 && ((((94 == a42[2]) && (a369 == 10 && (((316 < a260) && (416 >= a260)) && a331 == 34))) && a13 == 32) && a232 == 34))))) {
    	cf = 0;
    	if(((29 == a326[5]) && (!(a362 == a242[0]) || a331 == 34))) {
    	a377 = a374[4];
    	a103 = (a394 + 2);
    	a13 = 33 ;
    	a264 = a273;
    	a293 = a311[6];
    	a299 = 36 ;
    	a279 = (((a279 + 781) * 5) * 5);
    	a347 = ((((84 - -1662) + 6243) * 10) / 9);
    	a358 = a310[((a388 / a103) + 1)]; 
    	}else {
    	a326 = a360;
    	a356 = ((((98 - 7738) + 7609) - 21776) + 21774);
    	a306 = a213;
    	a279 = (((a279 + 27894) - -855) / 5);
    	a257 = (((((a257 % 72) - -302) - 67) + 17910) + -17890);
    	a299 = 36 ;
    	a41 = (a394 + 8);
    	a293 = a311[2];
    	a232 = 36 ;
    	a20 = a170;
    	a280 = ((((a280 + -11679) / 5) * 5) - -34725);
    	a193 = (a219 - 2);
    	a260 = (((a260 - -13922) * 2) - 41442);
    	a369 = 14;
    	a322 = 35 ;
    	a330 = a391[7];
    	a42 = a76;
    	a331 = 34 ;
    	a219 = 12;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a155 == 15 && (a362 == a242[2] && ((a401 == a272[2] &&  cf==1 ) && (94 == a42[2])))) && a331 == 34) && input == inputs[3]) && (((101 == a350[5]) && ((a322 == 34 && a380 == 6) && a13 == 32)) && a377 == a374[2]))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a75 = a176[(a380 + -2)];
    	a155 = 13; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((98 == a277[3]) && ((a155 == 15 && ( cf==1  && a13 == 32)) && a304 == 9)) && (94 == a42[2])) && (a401 == a272[2] && (a230 == 34 && ((((234 < a257) && (380 >= a257)) && (((248 < a376) && (381 >= a376)) && ((145 < a280) && (181 >= a280)))) && input == inputs[4]))))) {
    	cf = 0;
    	a13 = 34 ;
    	a161 = a19[((a388 / a204) - -4)];
    	a57 = a49[((a155 / a155) + 3)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((a401 == a272[2] && (((-144 < a354) && (-28 >= a354)) && (input == inputs[1] && ((101 == a350[5]) && a322 == 34)))) && a330 == a391[2]) && a204 == 12) && ((a13 == 32 && (((94 == a42[2]) &&  cf==1 ) && a155 == 15)) && a230 == 34))) {
    	cf = 0;
    	a103 = ((a388 * a369) + -97);
    	a13 = 33 ;
    	a91 = (((87 - -4254) + 17154) * 1); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a380 == 6 && ((a155 == 15 && ((76 == a236[3]) && a295 == a302[2])) && a359 == 34)) && a293 == a311[2]) && ((94 == a42[2]) && ((a401 == a272[2] && (input == inputs[2] && (a13 == 32 &&  cf==1 ))) && a387 == 34)))) {
    	cf = 0;
    	a200 = a152[(a204 + -6)];
    	a13 = 33 ;
    	a356 = (((58 + 27816) + 1295) - -633);
    	a299 = 36 ;
    	a376 = ((((a376 % 63) + 149) + 6114) - 6079);
    	a330 = a391[5];
    	a354 = (((a354 / -5) * 5) + 8059);
    	a103 = (a369 + -8);
    	a293 = a311[3];
    	a359 = 33 ;
    	a264 = a273;
    	a377 = a374[5];
    	a324 = a341[5];
    	a279 = (((((a279 * -1) / 10) * 10) / 9) + -1);
    	a355 = a235[1];
    	a280 = (((a280 - 8456) - 12862) * 1);
    	a204 = 10; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm126(int input) {
    if(((((((94 == a42[2]) && ((a155 == 15 &&  cf==1 ) && a401 == a272[4])) && input == inputs[1]) && a370 == 34) && a331 == 34) && ((((98 == a277[3]) && (a13 == 32 && (98 == a277[3]))) && a287 == 34) && ((-48 < a347) && (127 >= a347))))) {
	if((a167 - 20) < a167){
	a167  -=  2 ;}
	 else{	
	a167  -=  0;}
    	cf = 0;
    	a41 = ((a369 - a388) + 8);
    	a42 = a76;
    	a2 = a139[(a369 - 7)];
    	a20 = a170; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a401 == a272[4] &&  cf==1 ) && (94 == a42[2])) && a208 == 8) && ((a295 == a302[2] && ((a13 == 32 && ((((-88 < a356) && (-18 >= a356)) && (a155 == 15 && a394 == 3)) && a322 == 34)) && input == inputs[0])) && a359 == 34))) {
    	cf = 0;
    	if(( cf==1  && (a43 == a61[6] && ((243 < a185) && (431 >= a185))))) {
    	a237 = a345;
    	a293 = a311[2];
    	a377 = a374[0];
    	a217 = a233[3];
    	a260 = (((a260 + 21781) - 8247) + 8752);
    	a42 = a197;
    	a376 = ((((((a376 + 1401) % 63) + 181) / 5) * 34) / 10);
    	a326 = a201;
    	a280 = ((((((69 * 9) / 10) * 10) / 9) * 10) / 9);
    	a306 = a213;
    	a380 = 7;
    	a264 = a393;
    	a234 = a214;
    	a324 = a341[6];
    	a279 = ((((a279 / 5) / 5) - -20816) - 20544);
    	a224 = a342[1];
    	a355 = a235[1];
    	a208 = 10;
    	a236 = a329;
    	a359 = 35 ;
    	a215 = a223;
    	a394 = 7;
    	a388 = 15;
    	a304 = 8;
    	a347 = (((a347 - -22200) / 5) + 12231);
    	a150 = ((a328 * a369) + -56);
    	a232 = 34 ;
    	a287 = 32 ;
    	a230 = 36 ;
    	a169 = ((((94 * 9) / 10) - 27255) - -27256);
    	a257 = (((((91 * 9) / 10) + -8891) * 3) + 26599);
    	a370 = 35 ;
    	a331 = 34 ;
    	a387 = 34 ;
    	a356 = (((a356 / 5) / 5) - 36);
    	a299 = 33 ;
    	a277 = a338;
    	a204 = 15;
    	a219 = 13;
    	a381 = a395;
    	a295 = a302[7];
    	a369 = 11; 
    	}else {
    	a287 = 34 ;
    	a326 = a321;
    	a355 = a235[1];
    	a295 = a302[4];
    	a354 = ((((41 - -14327) + -14530) - 3302) - -3311);
    	a103 = (a204 - 7);
    	a219 = 8;
    	a344 = (((((41 / 5) * 97) / 10) * 10) / 9);
    	a299 = 32 ;
    	a330 = a391[3];
    	a359 = 33 ;
    	a13 = 33 ;
    	a380 = 6;
    	a347 = (((((a347 % 58) + -106) + -1) + 25738) + -25736);
    	a306 = a262;
    	a232 = 32 ;
    	a257 = (((1 + 290) - -54) - -10);
    	a264 = a273;
    	a215 = a248;
    	a237 = a345;
    	a362 = a242[6];
    	a376 = ((((a376 * 5) / 5) * 10) / 16);
    	a304 = 14;
    	a358 = a310[(a103 - -1)];
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a355 == a235[2] && ((a219 == 8 && ((a401 == a272[4] && ( cf==1  && a155 == 15)) && input == inputs[4])) && a208 == 8)) && ((36 == a326[0]) && (a295 == a302[2] && ((a13 == 32 && ((248 < a376) && (381 >= a376))) && (94 == a42[2])))))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a150 = ((a328 * a328) - 30);
    	a381 = a395;
    	a42 = a197;
    	a398 = a315; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a204 == 12 && (((a13 == 32 && (a287 == 34 && a232 == 34)) && a394 == 3) && a328 == 6)) && (((a388 == 10 && (( cf==1  && a401 == a272[4]) && (94 == a42[2]))) && input == inputs[3]) && a155 == 15))) {
    	cf = 0;
    	a155 = (a219 + 3);
    	a106 = (a155 + 2); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((a232 == 34 && ((316 < a260) && (416 >= a260))) && a295 == a302[2]) && (((a401 == a272[4] && (a377 == a374[2] && (((input == inputs[2] && (a13 == 32 &&  cf==1 )) && a155 == 15) && (98 == a277[3])))) && a387 == 34) && (94 == a42[2])))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
	if((a157 - 20) < a157){
	a157  -=  3 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	if((!(a102 == 12) || ((181 < a280 && (26 == a79[5])) || a380 == 10))) {
    	a20 = a170;
    	a41 = ((a155 * a155) - 218);
    	a42 = a76;
    	a65 = a12; 
    	}else {
    	a219 = 8;
    	a234 = a214;
    	a356 = ((((a356 * 5) % 34) - 42) - -15);
    	a217 = a233[6];
    	a369 = 11;
    	a381 = a254;
    	a370 = 32 ;
    	a204 = 17;
    	a230 = 32 ;
    	a306 = a262;
    	a347 = (((a347 - -29526) - -177) + -29113);
    	a42 = a197;
    	a322 = 36 ;
    	a295 = a302[2];
    	a78 = ((((((22 * 39) / 10) + -18) / 5) * 79) / 10);
    	a11 = a40;
    	}printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm8(int input) {
    if(((((22 == a264[5]) && (65 == a237[1])) && ((316 < a260) && (416 >= a260))) && ((((76 == a236[3]) && (a155 == 8 &&  cf==1 )) && a219 == 8) && (98 == a277[3])))) {
    	if((((a293 == a311[2] && (( cf==1  && (94 == a163[4])) && a355 == a235[2])) && a287 == 34) && ((54 == a234[0]) && (((234 < a257) && (380 >= a257)) && a299 == 34)))) {
    		calculate_outputm109(input);
    	} 
    	if((((((a204 == 12 && ((248 < a376) && (381 >= a376))) && (22 == a264[5])) && ((-88 < a356) && (-18 >= a356))) && a377 == a374[2]) && (a331 == 34 && ( cf==1  && (100 == a163[4]))))) {
    		calculate_outputm110(input);
    	} 
    } 
    if((((a331 == 34 && (a330 == a391[2] && a369 == 10)) && (76 == a236[3])) && (a324 == a341[2] && (a369 == 10 && (a155 == 10 &&  cf==1 ))))) {
    	if(((((a304 == 9 && a369 == 10) && (98 == a277[3])) && a293 == a311[2]) && ((a232 == 34 && ( cf==1  && ((-193 < a32) && (-162 >= a32)))) && a359 == 34))) {
    		calculate_outputm112(input);
    	} 
    	if(((((-88 < a356) && (-18 >= a356)) && (a204 == 12 && a387 == 34)) && ((101 == a350[5]) && ((( cf==1  && ((-162 < a32) && (-15 >= a32))) && a324 == a341[2]) && ((166 < a279) && (330 >= a279)))))) {
    		calculate_outputm113(input);
    	} 
    	if(((a331 == 34 && ((65 == a237[1]) && (65 == a237[1]))) && (((( cf==1  && -15 < a32) && ((-48 < a347) && (127 >= a347))) && ((248 < a376) && (381 >= a376))) && a331 == 34))) {
    		calculate_outputm114(input);
    	} 
    } 
    if((((((a355 == a235[2] && ((145 < a280) && (181 >= a280))) && (98 == a277[3])) && a304 == 9) && a362 == a242[2]) && (( cf==1  && a155 == 13) && a388 == 10))) {
    	if(((((-48 < a347) && (127 >= a347)) && ((101 == a350[5]) && ((-144 < a354) && (-28 >= a354)))) && ((a324 == a341[2] && ((a75 == a176[1] &&  cf==1 ) && (65 == a237[1]))) && (36 == a326[0])))) {
    		calculate_outputm119(input);
    	} 
    } 
    if(((a204 == 12 && (a380 == 6 && a324 == a341[2])) && (((234 < a257) && (380 >= a257)) && (a359 == 34 && ((51 == a215[1]) && (a155 == 14 &&  cf==1 )))))) {
    	if(((((145 < a280) && (181 >= a280)) && a322 == 34) && ((a370 == 34 && ((a387 == 34 && ( cf==1  && (104 == a381[4]))) && ((-144 < a354) && (-28 >= a354)))) && a299 == 34))) {
    		calculate_outputm122(input);
    	} 
    } 
    if(((a230 == 34 && (a155 == 15 &&  cf==1 )) && (a230 == 34 && (a217 == a233[2] && (((84 == a306[2]) && ((166 < a279) && (330 >= a279))) && a295 == a302[2]))))) {
    	if((((((316 < a260) && (416 >= a260)) && a331 == 34) && a208 == 8) && (a377 == a374[2] && ((( cf==1  && a401 == a272[2]) && a355 == a235[2]) && a224 == a342[2])))) {
    		calculate_outputm124(input);
    	} 
    	if((((((-88 < a356) && (-18 >= a356)) && (a388 == 10 && (a322 == 34 && ((65 == a237[1]) && (36 == a326[0]))))) && a293 == a311[2]) && (a401 == a272[4] &&  cf==1 ))) {
    		calculate_outputm126(input);
    	} 
    } 
}
 void calculate_outputm129(int input) {
    if(((((145 < a280) && (181 >= a280)) && ((((a332 == 5 && ( cf==1  && input == inputs[4])) && a161 == a19[1]) && a13 == 34) && a380 == 6)) && (((54 == a234[0]) && ((a330 == a391[2] && (94 == a42[2])) && (65 == a237[1]))) && a230 == 34))) {
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a54 = ((a388 + a332) - 6);
    	a399 = a332; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a324 == a341[2] && ((a161 == a19[1] && (a369 == 10 && (((234 < a257) && (380 >= a257)) && ((145 < a280) && (181 >= a280))))) && (65 == a237[1]))) && (((a230 == 34 && ((a332 == 5 &&  cf==1 ) && (94 == a42[2]))) && input == inputs[2]) && a13 == 34))) {
    	cf = 0;
    	if(((((a369 == 10 || a388 == 14) && (23 == a9[3])) || a180 == 7) || ((234 < a257) && (380 >= a257)))) {
    	a380 = (a332 - 1);
    	a236 = a397;
    	a322 = 33 ;
    	a42 = a197;
    	a78 = (((((((a354 * a279) % 14999) % 96) + 160) + 21193) / 5) + -4180);
    	a264 = a273;
    	a230 = 33 ;
    	a394 = (a332 + -4);
    	a299 = 33 ;
    	a304 = ((a388 / a219) + 6);
    	a217 = a233[(a388 + -10)];
    	a219 = (a332 - -1);
    	a306 = a213;
    	a350 = a283;
    	a232 = 33 ;
    	a237 = a298;
    	a11 = a162;
    	a287 = 33 ;
    	a369 = (a380 + 4);
    	a344 = (((((a280 * a257) % 14999) - -14542) - 22571) - 9596);
    	a381 = a254;
    	a354 = (((((a347 * a257) % 14999) - 13122) - 293) + 2124);
    	a324 = a341[(a208 - 8)];
    	a356 = (((((a356 * a376) % 14999) + -14122) + -730) * 1);
    	a330 = a391[(a304 + -7)];
    	a224 = a342[(a208 + -8)];
    	a388 = ((a204 + a304) - 9);
    	a234 = a305;
    	a376 = ((((((a376 * a344) % 14999) - 4787) * 10) / 9) * 1); 
    	}else {
    	a328 = (a208 - 2);
    	a347 = ((((((a260 * a279) % 14999) % 87) - -33) - -7) - 52);
    	a293 = a311[((a388 * a328) + -58)];
    	a215 = a223;
    	a370 = 34 ;
    	a54 = (a219 + -2);
    	a355 = a235[(a328 + -4)];
    	a13 = 35 ;
    	a28 = 36 ;
    	a204 = (a208 - -4);
    	a295 = a302[(a208 + -6)];
    	a362 = a242[(a394 - 1)];
    	}printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm131(int input) {
    if(((((a287 == 34 && (( cf==1  && a13 == 34) && (94 == a42[2]))) && input == inputs[1]) && a328 == 6) && (a369 == 10 && ((a362 == a242[2] && (a161 == a19[2] && ((18 == a398[4]) && a232 == 34))) && a304 == 9)))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a356 = (((((a344 * a344) % 34) + -53) + 2) + -2);
    	a370 = 34 ;
    	a279 = (((((((a376 * a376) % 14999) + -15512) % 81) + 249) - -1361) - 1284);
    	a280 = ((((((a344 * a344) * 2) * 1) + -7189) % 17) - -163);
    	a306 = a262;
    	a324 = a341[(a208 - 6)];
    	a347 = ((((((((a257 * a376) % 14999) % 87) + 3) * 10) / 9) - 19566) + 19564);
    	a354 = ((((((a344 * a344) * 2) % 57) - 85) + 14797) - 14797); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((a293 == a311[2] && (((18 == a398[4]) && ( cf==1  && (94 == a42[2]))) && a161 == a19[2])) && ((-105 < a344) && (76 >= a344))) && ((((a13 == 34 && (input == inputs[3] && a362 == a242[2])) && a304 == 9) && a331 == 34) && a331 == 34))) {
    	cf = 0;
    	a280 = (((50 + 109) + -10) + 8);
    	a279 = ((((((a376 * a344) % 14999) / 5) % 81) - -247) * 1);
    	a347 = (((((((a257 * a376) % 14999) % 87) - 30) - 16008) / 5) + 3258);
    	a324 = a341[(a380 + -4)];
    	a356 = (((79 * 5) + -437) - 21);
    	a306 = a262;
    	a370 = 34 ;
    	a354 = ((((((((a376 * a376) % 14999) % 57) + -113) * 9) / 10) * 9) / 10); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a208 == 8 && (a355 == a235[2] && ((a328 == 6 && a369 == 10) && (18 == a398[4])))) && (a161 == a19[2] && ((a355 == a235[2] && (((94 == a42[2]) && ( cf==1  && input == inputs[4])) && a322 == 34)) && a13 == 34)))) {
	if((a167 - 20) < a167){
	a167  -=  1 ;}
	 else{	
	a167  -=  0;}
    	cf = 0;
    	a116 = a53[(a208 - 7)];
    	a13 = 36 ;
    	a180 = a35[(a388 - 9)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((( cf==1  && a161 == a19[2]) && (94 == a42[2])) && input == inputs[2]) && (a208 == 8 && ((((((-105 < a344) && (76 >= a344)) && (a13 == 34 && ((18 == a398[4]) && a230 == 34))) && a387 == 34) && a330 == a391[2]) && a217 == a233[2])))) {
    	cf = 0;
    	if((!(a98 == 12) || ((!(a208 == 8) || (94 == a47[0])) && a394 == 4))) {
    	a180 = a35[((a380 - a204) + 8)];
    	a230 = 32 ;
    	a299 = 32 ;
    	a13 = 36 ;
    	a234 = a372;
    	a264 = a270;
    	a369 = (a380 - -3);
    	a14 = a182[0];
    	a331 = 32 ;
    	a347 = ((((a344 * a354) / 5) - 7461) * 3);
    	a279 = ((((((a354 * a376) % 14999) - -2609) * 2) % 101) + 63);
    	a377 = a374[((a394 / a204) - -1)]; 
    	}else {
    	a380 = (a204 - 7);
    	a234 = a372;
    	a264 = a270;
    	a326 = a201;
    	a377 = a374[(a219 - 7)];
    	a13 = 33 ;
    	a299 = 32 ;
    	a103 = ((a204 + a388) - 21);
    	a295 = a302[((a204 + a204) - 23)];
    	a52 = a113;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((a394 == 3 && (a331 == 34 && (((( cf==1  && (94 == a42[2])) && a161 == a19[2]) && ((234 < a257) && (380 >= a257))) && a219 == 8))) && a13 == 34) && ((36 == a326[0]) && ((input == inputs[0] && a219 == 8) && (18 == a398[4])))) && a111 == 4742)) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a98 = a67[((a388 + a369) - 13)];
    	a54 = 6;
    	a42 = a197;
    	a381 = a390; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm133(int input) {
    if(((input == inputs[1] && (a388 == 10 && (a13 == 34 && ((51 == a215[1]) && (a224 == a342[2] && ((( cf==1  && a161 == a19[3]) && (94 == a42[2])) && a377 == a374[2])))))) && ((((166 < a279) && (330 >= a279)) && a328 == 6) && a386 == 12))) {
	if((a157 + 20) > a157){
	a157  +=  1 ;}
	 else{	
	a157  +=  0;}
    	cf = 0;
    	if(((a399 == 3 || ((a29 == 14 || a330 == 5) && !(a191 == 35))) && a31 == 4)) {
    	a322 = 33 ;
    	a380 = ((a386 + a388) - 18);
    	a215 = a205;
    	a234 = a305;
    	a78 = (((51 * 5) - 18500) + 18303);
    	a347 = (((((a356 * a260) % 14999) + -3603) * 1) * 1);
    	a279 = (((((((a279 * a354) % 14999) - 11262) % 101) - -88) + -23864) + 23895);
    	a362 = a242[((a394 + a394) - 2)];
    	a306 = a250;
    	a354 = ((((((a280 * a347) % 14999) + -8377) * 1) - -15117) + -16601);
    	a330 = a391[(a328 / a388)];
    	a287 = 32 ;
    	a236 = a397;
    	a328 = (a219 - 4);
    	a387 = 33 ;
    	a377 = a374[((a388 - a380) - 6)];
    	a376 = (((((((a376 * a344) % 14999) - 9520) % 63) - -212) * 10) / 9);
    	a277 = a338;
    	a257 = ((((((a257 * a347) % 14999) + -5611) + 30445) * 1) * -1);
    	a232 = 33 ;
    	a219 = (a386 - 5);
    	a299 = 33 ;
    	a42 = a197;
    	a381 = a254;
    	a369 = (a394 - -8);
    	a264 = a273;
    	a169 = (((((a78 * a78) * 10) / -9) + -4570) + -14695);
    	a295 = a302[((a394 * a380) - 4)];
    	a230 = 33 ;
    	a388 = ((a380 * a208) + -24); 
    	}else {
    	a304 = (a328 - -3);
    	a394 = (a386 + -9);
    	a355 = a235[((a208 * a208) + -62)];
    	a380 = ((a328 + a394) + -4);
    	a215 = a248;
    	a257 = ((((((((a257 * a354) % 14999) + -14031) % 107) - -165) * 5) % 107) + 80);
    	a155 = ((a386 - a386) + 8);
    	a306 = a262;
    	a344 = (((((a354 * a280) % 41) - 120) - 6401) + 6380);
    	a356 = ((((((a347 * a354) / 5) % 34) - 53) - -6248) + -6247);
    	a293 = a311[(a219 + -6)];
    	a295 = a302[(a204 - 11)];
    	a299 = 32 ;
    	a326 = a201;
    	a13 = 32 ;
    	a370 = 34 ;
    	a330 = a391[(a369 + -9)];
    	a163 = a188;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((94 == a42[2]) && ((a295 == a302[2] && (a386 == 12 && (( cf==1  && a13 == 34) && a161 == a19[3]))) && input == inputs[3])) && (a219 == 8 && ((((101 == a350[5]) && ((145 < a280) && (181 >= a280))) && ((234 < a257) && (380 >= a257))) && (84 == a306[2]))))) {
    	cf = 0;
    	a54 = (a386 - 3);
    	a13 = 35 ;
    	a399 = ((a369 + a388) + -10); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm134(int input) {
    if(((a359 == 34 && (input == inputs[4] && (a386 == 14 && (a331 == 34 && a370 == 34)))) && (a293 == a311[2] && (((-88 < a356) && (-18 >= a356)) && ((((a13 == 34 &&  cf==1 ) && (94 == a42[2])) && a161 == a19[3]) && a295 == a302[2]))))) {
    	cf = 0;
    	a204 = ((a304 - a208) - -9);
    	a370 = 33 ;
    	a330 = a391[(a208 - 8)];
    	a369 = (a204 + -2);
    	a381 = a254;
    	a356 = (((((a356 * a376) % 14999) + 494) - 3498) + -11412);
    	a42 = a197;
    	a299 = 33 ;
    	a295 = a302[(a219 + -8)];
    	a219 = (a208 + -2);
    	a322 = 33 ;
    	a347 = ((((((a347 * a344) % 14999) % 14917) - 15082) + 26773) + -26773);
    	a78 = (((((28 + 64) + -27) / 5) * 169) / 10);
    	a380 = (a204 - 6);
    	a230 = 33 ;
    	a11 = a40; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a161 == a19[3] && ((a370 == 34 && (a369 == 10 && (((a13 == 34 &&  cf==1 ) && (94 == a42[2])) && a386 == 14))) && a387 == 34)) && ((((-48 < a347) && (127 >= a347)) && (a304 == 9 && ((-88 < a356) && (-18 >= a356)))) && input == inputs[1]))) {
    	cf = 0;
    	if(((!(a116 == 13) || a331 == 36) && !(a116 == 13))) {
    	a347 = (((((((a347 * a279) / 5) % 58) + -106) * 5) % 58) - 91);
    	a354 = (((((((a257 * a260) % 14999) % 24) + -189) * 5) % 24) + -159);
    	a215 = a248;
    	a280 = (((((((a280 * a279) % 14999) + -14473) % 60) - -83) / 5) + 38);
    	a376 = ((((((a376 * a257) % 14999) + 14777) - -90) % 63) + 166);
    	a264 = a270;
    	a129 = a186[(a304 + -4)];
    	a362 = a242[(a386 + -13)];
    	a331 = 33 ;
    	a370 = 34 ;
    	a260 = (((((((a260 * a279) % 14999) / 5) / 5) - 10579) % 49) - -410);
    	a20 = a71;
    	a230 = 32 ;
    	a350 = a367;
    	a344 = ((((((a257 * a257) % 14999) % 41) - 148) + 17692) - 17716);
    	a217 = a233[(a386 - 13)];
    	a304 = ((a219 / a204) + 9);
    	a387 = 32 ;
    	a236 = a267;
    	a330 = a391[(a386 - 13)];
    	a295 = a302[((a386 + a208) - 21)];
    	a306 = a262;
    	a322 = 32 ;
    	a208 = (a204 - 5);
    	a103 = (a380 - 4);
    	a299 = 32 ;
    	a234 = a372;
    	a369 = (a386 - 5);
    	a356 = (((((a356 * a354) % 27) - 117) / 5) + -112);
    	a204 = (a219 + 4);
    	a293 = a311[((a328 * a388) + -44)];
    	a42 = a76;
    	a380 = ((a219 / a219) - -4);
    	a277 = a338;
    	a219 = (a394 + 5); 
    	}else {
    	a362 = a242[((a380 - a380) - -1)];
    	a293 = a311[(a380 - 5)];
    	a264 = a270;
    	a359 = 32 ;
    	a388 = (a380 + 4);
    	a42 = a76;
    	a224 = a342[(a304 + -8)];
    	a230 = 32 ;
    	a377 = a374[((a380 - a380) + 2)];
    	a219 = (a386 - 7);
    	a215 = a248;
    	a330 = a391[((a208 - a208) - -1)];
    	a20 = a170;
    	a369 = (a219 + 2);
    	a354 = (((((((a257 * a257) % 14999) / 5) - -5583) - -10661) % 24) - 191);
    	a236 = a267;
    	a344 = ((((((a260 * a279) % 14999) % 41) + -146) * 5) / 5);
    	a212 = a314[((a204 - a386) - -4)];
    	a347 = ((((((a347 * a260) % 14999) % 58) - 107) + -2239) - -2240);
    	a356 = ((((((a356 * a354) % 27) + -132) - -11) - -5231) - 5227);
    	a208 = ((a394 * a204) - 17);
    	a295 = a302[((a204 / a394) - 5)];
    	a306 = a262;
    	a387 = 32 ;
    	a299 = 32 ;
    	a41 = (a386 - 2);
    	a328 = a380;
    	a280 = ((((((a280 * a376) % 14999) % 60) + 71) / 5) * 5);
    	a350 = a367;
    	a331 = 32 ;
    	a324 = a341[(a380 + -6)];
    	a204 = (a380 - -5);
    	a234 = a372;
    	a376 = (((((((a376 * a260) % 14999) % 63) - -153) * 9) / 10) + -4);
    	a380 = (a394 - -3);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm137(int input) {
    if((((a377 == a374[2] && ((36 == a326[0]) && ((a57 == a49[5] &&  cf==1 ) && input == inputs[2]))) && ((234 < a257) && (380 >= a257))) && (((76 == a236[3]) && (((a230 == 34 && a161 == a19[4]) && (94 == a42[2])) && a13 == 34)) && a330 == a391[2]))) {
    	cf = 0;
    	a377 = a374[2];
    	a237 = a298;
    	a234 = a214;
    	a232 = 35 ;
    	a324 = a341[2];
    	a217 = a233[2];
    	a326 = a321;
    	a359 = 33 ;
    	a20 = a170;
    	a219 = 8;
    	a260 = ((((a260 + -19856) - 2735) % 49) + 414);
    	a350 = a323;
    	a304 = 14;
    	a279 = ((((((a279 % 81) - -190) * 9) / 10) + 23118) - 23099);
    	a42 = a76;
    	a388 = 11;
    	a347 = (((((a347 % 87) + 40) - 1) - -10386) + -10385);
    	a287 = 34 ;
    	a356 = ((((((a356 + -21821) % 27) - 97) / 5) * 49) / 10);
    	a322 = 33 ;
    	a330 = a391[5];
    	a277 = a368;
    	a224 = a342[5];
    	a293 = a311[0];
    	a362 = a242[5];
    	a41 = 11;
    	a370 = 36 ;
    	a355 = a235[4];
    	a306 = a213;
    	a394 = 5;
    	a280 = (((20 * 5) * 5) - 22619);
    	a354 = ((((93 * 5) * 5) - 21330) - -32901);
    	a257 = ((((((a257 % 72) - -247) - -37) * 5) % 72) - -242);
    	a299 = 33 ;
    	a369 = 14;
    	a193 = (a41 + -1); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a57 == a49[5] && (((84 == a306[2]) && ((-48 < a347) && (127 >= a347))) && a388 == 10)) && ((-88 < a356) && (-18 >= a356))) && (a293 == a311[2] && (a224 == a342[2] && (((( cf==1  && a13 == 34) && (94 == a42[2])) && a161 == a19[4]) && input == inputs[4]))))) {
    	cf = 0;
    	if(a304 == 8) {
    	a126 = 35 ;
    	a98 = a67[((a388 * a380) + -56)];
    	a381 = a390;
    	a42 = a197; 
    	}else {
    	a279 = ((((a279 / 5) - 29472) + 12539) + 17077);
    	a230 = 32 ;
    	a380 = 9;
    	a330 = a391[2];
    	a208 = 12;
    	a264 = a393;
    	a387 = 34 ;
    	a306 = a213;
    	a394 = 4;
    	a260 = ((((a260 + 28207) / 5) - 24949) - -19518);
    	a150 = 4;
    	a355 = a235[3];
    	a234 = a372;
    	a359 = 35 ;
    	a304 = 13;
    	a277 = a382;
    	a347 = ((((a347 + 14559) * 2) % 87) - 34);
    	a388 = 13;
    	a356 = (((((a356 * 5) % 34) + -52) * 9) / 10);
    	a370 = 36 ;
    	a381 = a395;
    	a257 = (((a257 / 5) / 5) + 15040);
    	a232 = 34 ;
    	a42 = a197;
    	a369 = 14;
    	a377 = a374[6];
    	a236 = a329;
    	a293 = a311[7];
    	a215 = a248;
    	a219 = 7;
    	a287 = 32 ;
    	a217 = a233[6];
    	a299 = 35 ;
    	a326 = a360;
    	a224 = a342[4];
    	a376 = (((((a376 % 66) + 298) * 5) % 66) + 297);
    	a169 = (((((93 + -115) + -38) - -487) * -1) / 10);
    	}printf("%d\n", 22); fflush(stdout); 
    } 
    if(((a217 == a233[2] && (a224 == a342[2] && a293 == a311[2])) && ((((-48 < a347) && (127 >= a347)) && ((a287 == 34 && (a13 == 34 && (input == inputs[1] && ((94 == a42[2]) && ( cf==1  && a161 == a19[4]))))) && a57 == a49[5])) && ((-88 < a356) && (-18 >= a356))))) {
    	cf = 0;
    	a103 = (a328 - -2);
    	a161 = a19[(a103 + -3)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a355 == a235[2] && (((a57 == a49[5] &&  cf==1 ) && a161 == a19[4]) && a394 == 3)) && ((51 == a215[1]) && (a370 == 34 && ((a13 == 34 && (((94 == a42[2]) && a232 == 34) && input == inputs[0])) && a369 == 10))))) {
	if((a111 + 20) > a111){
	a111  +=  1 ;}
	 else{	
	a111  +=  0;}
	if((a157 - 20) < a157){
	a157  -=  1 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	if(a362 == a242[6]) {
    	a257 = (((((a257 % 72) + 281) + 25) * 9) / 10);
    	a208 = 12;
    	a279 = (((a279 + 26332) / 5) / 5);
    	a347 = (((a347 + 10968) / 5) - -19099);
    	a328 = 11;
    	a150 = (a388 + -1);
    	a376 = (((((a376 % 66) + 302) * 9) / 10) - 12);
    	a217 = a233[6];
    	a356 = ((((a356 * 5) % 34) - 46) + 24);
    	a299 = 36 ;
    	a277 = a338;
    	a394 = 5;
    	a42 = a197;
    	a219 = 8;
    	a370 = 34 ;
    	a232 = 33 ;
    	a359 = 35 ;
    	a380 = 8;
    	a230 = 35 ;
    	a215 = a205;
    	a293 = a311[7];
    	a234 = a372;
    	a260 = ((((((a260 * 10) / 14) * 9) / 10) * 10) / 9);
    	a326 = a360;
    	a387 = 36 ;
    	a381 = a395;
    	a306 = a262;
    	a354 = (((88 - -16037) / 5) + 8677);
    	a43 = a61[((a150 + a150) + -18)]; 
    	}else {
    	a354 = ((((30 / 5) / 5) / 5) + -189);
    	a295 = a302[6];
    	a13 = 36 ;
    	a280 = ((((96 / 5) + 20928) * 10) / 9);
    	a204 = 11;
    	a356 = ((((a356 * 10) / 1) - 19571) - 5467);
    	a331 = 32 ;
    	a237 = a298;
    	a362 = a242[4];
    	a324 = a341[5];
    	a180 = a35[(a369 - 6)];
    	a264 = a273;
    	a306 = a213;
    	a344 = (((((71 - 262) * -1) / 10) * 5) - 132);
    	a79 = a133;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a219 == 8 && (((316 < a260) && (416 >= a260)) && (((98 == a277[3]) && ((54 == a234[0]) && ((94 == a42[2]) && a377 == a374[2]))) && a355 == a235[2]))) && (a161 == a19[4] && ((a13 == 34 && ( cf==1  && input == inputs[3])) && a57 == a49[5])))) {
    	cf = 0;
    	if(a130 == 3) {
    	a150 = 9;
    	a43 = a61[(a388 - 8)];
    	a381 = a395;
    	a42 = a197; 
    	}else {
    	a54 = (a328 - -4);
    	a13 = 35 ;
    	a161 = a19[(a304 + -2)];
    	}printf("%d\n", 23); fflush(stdout); 
    } 
}
 void calculate_outputm139(int input) {
    if(((a161 == a19[5] && (((-48 < a347) && (127 >= a347)) && (a13 == 34 && (( cf==1  && input == inputs[4]) && (94 == a42[2]))))) && (((a324 == a341[2] && ((((-48 < a347) && (127 >= a347)) && a103 == 2) && a370 == 34)) && a328 == 6) && a217 == a233[2]))) {
    	cf = 0;
    	 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((a224 == a342[2] && (a388 == 10 && (a13 == 34 && a380 == 6))) && (((-144 < a354) && (-28 >= a354)) && ((22 == a264[5]) && (a103 == 2 && ((94 == a42[2]) && ((a161 == a19[5] && (input == inputs[2] &&  cf==1 )) && a355 == a235[2]))))))) {
	if((a167 + 20) > a167){
	a167  +=  3 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a204 = ((a388 + a388) - 10);
    	a224 = a342[(a204 - 10)];
    	a326 = a360;
    	a232 = 33 ;
    	a324 = a341[(a388 - 10)];
    	a219 = (a204 + -4);
    	a304 = (a204 + -3);
    	a208 = a380;
    	a217 = a233[(a204 - 10)];
    	a234 = a305;
    	a43 = a61[(a103 + 1)];
    	a394 = (a204 + -9);
    	a287 = 33 ;
    	a328 = (a219 + -2);
    	a356 = ((((((a280 * a257) % 14999) + 11954) * 1) * -1) / 10);
    	a279 = (((((((a376 * a376) % 14999) / 5) - -7976) - -6814) % 81) + 214);
    	a230 = 33 ;
    	a42 = a197;
    	a264 = a270;
    	a347 = ((((((a347 * a356) % 14999) % 14917) + -15082) * 1) - 1);
    	a299 = 33 ;
    	a381 = a390;
    	a370 = 33 ;
    	a330 = a391[(a219 - 6)];
    	a359 = 33 ;
    	a362 = a242[((a204 + a388) + -20)];
    	a387 = 33 ;
    	a277 = a368;
    	a354 = (((((a354 * a260) % 14999) - 11807) / 5) / 5);
    	a98 = a67[((a103 + a103) - -1)];
    	a388 = ((a204 * a204) - 92);
    	a344 = ((((((a344 * a376) % 14999) % 14906) + -15093) / 5) + -19517);
    	a293 = a311[(a380 + -5)];
    	a369 = (a394 - -7);
    	a355 = a235[(a394 + -1)];
    	a257 = ((((((((a257 * a260) % 14999) % 107) - -89) * 5) - 17112) % 107) - -155);
    	a380 = ((a394 + a304) + -4);
    	a331 = 33 ;
    	a376 = ((((a376 / 5) + -4193) + 12662) - 35193); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((-105 < a344) && (76 >= a344)) && ((input == inputs[0] && (((a208 == 8 && a103 == 2) && a13 == 34) && ((145 < a280) && (181 >= a280)))) && (98 == a277[3]))) && ((-105 < a344) && (76 >= a344))) && ((( cf==1  && (94 == a42[2])) && a161 == a19[5]) && a370 == 34))) {
    	cf = 0;
    	a13 = 32 ;
    	a155 = ((a219 / a304) - -13);
    	a75 = a176[(a155 - 9)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a224 == a342[2] && (a388 == 10 && a13 == 34)) && a355 == a235[2]) && (((((94 == a42[2]) && ((a161 == a19[5] && ( cf==1  && a103 == 2)) && input == inputs[1])) && a217 == a233[2]) && (54 == a234[0])) && ((234 < a257) && (380 >= a257))))) {
    	cf = 0;
    	a293 = a311[(a219 / a328)];
    	a20 = a170;
    	a344 = ((((((a354 * a354) % 41) - 185) - -29947) + -46379) - -16434);
    	a232 = 32 ;
    	a299 = 32 ;
    	a44 = ((((((a260 * a347) % 14999) % 11) + -123) + -1) - -3);
    	a234 = a372;
    	a42 = a76;
    	a380 = ((a304 - a219) - -4);
    	a217 = a233[(a328 - 5)];
    	a376 = ((((((((a376 * a279) % 14999) % 63) + 185) + -1) * 5) % 63) - -162);
    	a330 = a391[(a328 / a388)];
    	a215 = a205;
    	a230 = 32 ;
    	a347 = ((((((a344 * a354) / 5) % 58) - 122) * 10) / 9);
    	a394 = a103;
    	a264 = a270;
    	a369 = (a204 + -2);
    	a219 = (a208 + -1);
    	a377 = a374[a103];
    	a41 = (a103 + 8);
    	a324 = a341[(a388 - 9)];
    	a370 = 32 ;
    	a295 = a302[(a204 - 9)];
    	a277 = a338;
    	a355 = a235[(a380 - 4)];
    	a354 = (((((a354 * a260) % 14999) - 14128) - 605) + -193);
    	a257 = ((((((a257 * a280) % 14999) % 107) - -24) + -1) - -33);
    	a388 = ((a103 / a208) + 9);
    	a328 = (a41 - 5); 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
}
 void calculate_outputm144(int input) {
    if((((a355 == a235[2] && (a161 == a19[6] && ((94 == a42[2]) &&  cf==1 ))) && a328 == 6) && (a287 == 34 && ((((a29 == 14 && (input == inputs[0] && (84 == a306[2]))) && a13 == 34) && a217 == a233[2]) && ((248 < a376) && (381 >= a376)))))) {
    	cf = 0;
    	a129 = a186[(a394 - -4)];
    	a20 = a71;
    	a130 = (a29 - 10);
    	a42 = a76; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((a29 == 14 && ((166 < a279) && (330 >= a279))) && ((-144 < a354) && (-28 >= a354))) && (a370 == 34 && (a331 == 34 && (((94 == a42[2]) && (a13 == 34 && (((-48 < a347) && (127 >= a347)) && (( cf==1  && a161 == a19[6]) && input == inputs[2])))) && ((166 < a279) && (330 >= a279))))))) {
    	cf = 0;
    	a116 = a53[(a369 - 5)];
    	a13 = 36 ;
    	a180 = a35[(a388 - 9)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((((a377 == a374[2] && (94 == a42[2])) && ((145 < a280) && (181 >= a280))) && input == inputs[3]) && a219 == 8) && ((a394 == 3 && ((a29 == 14 && (( cf==1  && a161 == a19[6]) && a13 == 34)) && ((234 < a257) && (380 >= a257)))) && a224 == a342[2]))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a13 = 32 ;
    	a155 = (a29 - -1);
    	a401 = a272[(a29 + -13)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((((a13 == 34 && (a161 == a19[6] && a295 == a302[2])) && a380 == 6) && (94 == a42[2])) && a362 == a242[2]) && ((51 == a215[1]) && (a304 == 9 && ((a29 == 14 && (input == inputs[1] &&  cf==1 )) && a370 == 34))))) {
	if((a4 - 20) < a4){
	a4  -=  1 ;}
	 else{	
	a4  -=  0;}
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(((!(a155 == 13) || ((12 == a264[1]) && a299 == 35)) || !(15 == a9[1]))) {
    	a42 = a76;
    	a290 = 34 ;
    	a20 = a170;
    	a41 = a380; 
    	}else {
    	a102 = a17[(a29 - 14)];
    	a13 = 36 ;
    	a180 = a35[((a29 * a29) - 190)];
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if((((((a161 == a19[6] && ( cf==1  && a29 == 14)) && (22 == a264[5])) && (94 == a42[2])) && (76 == a236[3])) && ((input == inputs[4] && (a331 == 34 && ((a208 == 8 && ((-144 < a354) && (-28 >= a354))) && a304 == 9))) && a13 == 34))) {
    	cf = 0;
    	if((((((-137 < a7) && (23 >= a7)) || a31 == a22[3]) || a355 == a235[6]) || !(12 == a264[1]))) {
    	a57 = a49[((a369 + a369) - 19)];
    	a161 = a19[(a380 + -2)]; 
    	}else {
    	a98 = a67[(a29 + -7)];
    	a42 = a197;
    	a54 = ((a29 * a29) - 184);
    	a381 = a390;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm145(int input) {
    if(((a295 == a302[2] && (a369 == 10 && a304 == 9)) && ((a362 == a242[2] && ((a13 == 34 && (a161 == a19[6] && (input == inputs[4] && ((a29 == 17 &&  cf==1 ) && (94 == a42[2]))))) && ((-105 < a344) && (76 >= a344)))) && ((316 < a260) && (416 >= a260))))) {
    	cf = 0;
    	if(((45 == a234[3]) || a129 == a186[1])) {
    	a204 = (a29 + -6);
    	a394 = ((a204 + a304) - 18);
    	a369 = (a204 - 2);
    	a330 = a391[((a394 * a29) + -34)];
    	a42 = a76;
    	a359 = 32 ;
    	a287 = 32 ;
    	a237 = a345;
    	a234 = a305;
    	a376 = ((((((a376 * a344) % 14999) % 63) + 185) - -4767) - 4767);
    	a370 = 32 ;
    	a354 = (((((((a354 * a260) % 14999) % 24) - 168) / 5) * 10) / 2);
    	a362 = a242[((a328 * a328) - 36)];
    	a350 = a367;
    	a326 = a201;
    	a388 = (a204 + -2);
    	a280 = (((((97 * 9) / 10) + -12) - 17387) + 17411);
    	a344 = (((((((a257 * a356) % 14999) % 41) + -145) - 2) + 14398) - 14396);
    	a299 = 32 ;
    	a279 = (((((a280 * a280) - -7185) + 468) % 101) + -18);
    	a324 = a341[(a304 - 8)];
    	a236 = a267;
    	a102 = a17[(a29 + -15)];
    	a328 = ((a204 / a204) + 4);
    	a347 = (((((a279 * a280) + -12958) % 58) + -105) - 2);
    	a215 = a248;
    	a322 = 33 ;
    	a355 = a235[(a369 + -8)];
    	a356 = ((((((a347 * a279) % 14928) - 15071) * 1) + 19632) + -19633);
    	a377 = a374[((a304 - a204) - -3)];
    	a257 = ((((((a279 * a279) + -22263) / 5) / 5) % 107) + 126);
    	a20 = a16;
    	a232 = 32 ;
    	a295 = a302[((a204 - a304) - 1)];
    	a219 = ((a29 + a304) + -19);
    	a277 = a338;
    	a256 = a312;
    	a264 = a270;
    	a208 = (a388 - 2);
    	a387 = 32 ;
    	a380 = (a304 - 4);
    	a230 = 32 ;
    	a304 = (a219 - -1); 
    	}else {
    	a326 = a201;
    	a204 = (a328 - -4);
    	a380 = (a204 + -6);
    	a377 = a374[((a328 * a204) - 59)];
    	a369 = (a304 + -1);
    	a277 = a368;
    	a387 = 33 ;
    	a150 = ((a388 * a29) - 165);
    	a322 = 33 ;
    	a376 = ((((((a376 * a344) % 14999) * 2) % 15060) - 14938) - 1);
    	a295 = a302[(a328 / a204)];
    	a163 = a174;
    	a350 = a367;
    	a234 = a305;
    	a280 = (((((((a347 * a347) % 14999) + -6762) % 60) - -83) - -24546) - 24545);
    	a279 = (((((((a347 * a347) % 14999) + 10480) * -1) / 10) * 10) / 9);
    	a287 = 32 ;
    	a370 = 33 ;
    	a264 = a273;
    	a306 = a250;
    	a362 = a242[(a328 + -6)];
    	a394 = (a328 - 4);
    	a359 = 33 ;
    	a344 = (((((a279 * a279) % 14999) - 29583) + -283) - 18);
    	a381 = a395;
    	a42 = a197;
    	a330 = a391[(a328 / a388)];
    	a354 = (((((a354 * a356) * 2) / 5) * 5) + -29206);
    	a356 = (((((((a260 * a257) % 14999) - -4543) * 10) / -9) * 10) / 9);
    	a355 = a235[(a208 + -7)];
    	a257 = (((((((a347 * a347) % 14999) % 107) - -120) * 5) % 107) + 124);
    	a237 = a345;
    	a230 = 33 ;
    	a299 = 33 ;
    	a208 = ((a328 + a219) + -7);
    	a388 = (a219 - -1);
    	a236 = a397;
    	a219 = (a204 - 4);
    	a215 = a205;
    	a328 = ((a204 / a204) + 4);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((((248 < a376) && (381 >= a376)) && (((((94 == a42[2]) && (( cf==1  && a13 == 34) && a161 == a19[6])) && a29 == 17) && input == inputs[3]) && (22 == a264[5]))) && a328 == 6) && ((a359 == 34 && ((316 < a260) && (416 >= a260))) && ((-88 < a356) && (-18 >= a356))))) {
    	cf = 0;
    	a328 = ((a208 * a208) + -60);
    	a388 = (a328 + a328);
    	a257 = ((((((a257 * a356) % 14999) - -28400) % 107) - -102) - 43);
    	a43 = a61[(a304 - 6)];
    	a264 = a270;
    	a380 = ((a219 + a369) + -14);
    	a219 = (a388 - 2);
    	a234 = a305;
    	a356 = ((((a356 * a344) / 5) / 5) + -21455);
    	a287 = 33 ;
    	a354 = (((((((a354 * a260) % 14999) + 10994) - 19161) + 33103) * -1) / 10);
    	a359 = 33 ;
    	a362 = a242[(a208 + -8)];
    	a381 = a390;
    	a355 = a235[(a204 - 12)];
    	a369 = (a304 + -1);
    	a98 = a67[(a29 - 12)];
    	a224 = a342[(a208 + -8)];
    	a387 = 33 ;
    	a204 = (a394 + 9);
    	a370 = 33 ;
    	a344 = ((((((a344 * a347) % 14999) * 2) - 3) % 14906) + -15093);
    	a277 = a368;
    	a42 = a197;
    	a299 = 33 ;
    	a215 = a205;
    	a230 = 33 ;
    	a376 = ((((((a376 * a279) % 14999) + 6367) - 22534) * 10) / 9);
    	a330 = a391[(a208 + -8)];
    	a304 = (a394 + 6);
    	a208 = (a380 + 2); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a13 == 34 && (51 == a215[1])) && a387 == 34) && a299 == 34) && ((input == inputs[1] && ((a204 == 12 && (a330 == a391[2] && ((94 == a42[2]) && ( cf==1  && a29 == 17)))) && a161 == a19[6])) && a204 == 12))) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	if((a224 == 6 || (((a208 == 10 || a290 == 34) && !(51 == a215[1])) || !(a358 == 2)))) {
    	a324 = a341[(a204 - 11)];
    	a237 = a345;
    	a359 = 32 ;
    	a322 = 32 ;
    	a347 = ((((((a257 * a257) % 14999) + 10220) % 58) - 163) + -2);
    	a377 = a374[((a204 + a204) + -24)];
    	a193 = ((a29 / a380) - -8);
    	a217 = a233[(a204 - 11)];
    	a20 = a170;
    	a388 = ((a193 * a204) + -111);
    	a355 = a235[(a369 - 10)];
    	a369 = (a380 + 3);
    	a326 = a201;
    	a370 = 33 ;
    	a234 = a372;
    	a356 = ((((a356 * a279) / 5) / 5) - 4933);
    	a41 = ((a219 + a304) - 6);
    	a344 = ((((a344 * a354) + -16604) - 830) - 1092);
    	a260 = ((((((a260 * a376) % 14999) / 5) % 79) - -208) - -21);
    	a279 = ((((((a279 * a347) % 14999) - -7841) % 101) + 65) + 1);
    	a42 = a76;
    	a330 = a391[(a204 + -11)];
    	a350 = a367;
    	a287 = 32 ;
    	a264 = a270;
    	a219 = ((a208 * a328) - 41);
    	a295 = a302[(a193 - 10)];
    	a394 = (a204 + -10);
    	a277 = a338;
    	a299 = 32 ;
    	a362 = a242[(a204 - 11)];
    	a224 = a342[(a193 - a388)];
    	a304 = (a394 + 5);
    	a232 = 32 ;
    	a257 = ((((((a257 * a347) % 14999) % 107) - -127) / 5) + 28);
    	a204 = (a388 - -1); 
    	}else {
    	a234 = a305;
    	a394 = (a29 + -14);
    	a293 = a311[(a380 - 4)];
    	a13 = 33 ;
    	a232 = 34 ;
    	a331 = 34 ;
    	a344 = ((((((a344 * a260) % 14999) - -14672) % 14906) - 15093) + -2);
    	a91 = ((((((a354 * a354) % 76) - -324) - 2) / 5) - -223);
    	a237 = a345;
    	a347 = (((((((a376 * a257) % 14999) % 87) - -3) * 5) % 87) + 33);
    	a324 = a341[(a328 + -4)];
    	a219 = (a204 - 6);
    	a217 = a233[((a388 + a394) - 11)];
    	a277 = a368;
    	a299 = 33 ;
    	a306 = a213;
    	a103 = (a29 + -14);
    	}printf("%d\n", 23); fflush(stdout); 
    } 
    if(((a13 == 34 && ((a304 == 9 && ((input == inputs[2] && a287 == 34) && (94 == a42[2]))) && a224 == a342[2])) && (((166 < a279) && (330 >= a279)) && (((a161 == a19[6] && ( cf==1  && a29 == 17)) && a322 == 34) && ((234 < a257) && (380 >= a257)))))) {
    	cf = 0;
    	a57 = a49[(a380 + -2)];
    	a161 = a19[(a369 - 6)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm9(int input) {
    if((((22 == a264[5]) && ((84 == a306[2]) && ((248 < a376) && (381 >= a376)))) && (((316 < a260) && (416 >= a260)) && ((a304 == 9 && ( cf==1  && a161 == a19[1])) && ((-88 < a356) && (-18 >= a356)))))) {
    	if((((65 == a237[1]) && ((101 == a350[5]) && (a332 == 5 &&  cf==1 ))) && ((a388 == 10 && (a299 == 34 && ((316 < a260) && (416 >= a260)))) && a217 == a233[2]))) {
    		calculate_outputm129(input);
    	} 
    } 
    if(((a355 == a235[2] && (a161 == a19[2] &&  cf==1 )) && ((((a377 == a374[2] && a331 == 34) && (54 == a234[0])) && a304 == 9) && a380 == 6))) {
    	if((((((98 == a277[3]) && a359 == 34) && a388 == 10) && a293 == a311[2]) && ((65 == a237[1]) && (a331 == 34 && ( cf==1  && (18 == a398[4])))))) {
    		calculate_outputm131(input);
    	} 
    } 
    if(((((316 < a260) && (416 >= a260)) && ((65 == a237[1]) && (a161 == a19[3] &&  cf==1 ))) && ((98 == a277[3]) && ((((145 < a280) && (181 >= a280)) && (22 == a264[5])) && a331 == 34)))) {
    	if(((a330 == a391[2] && (a369 == 10 && (((-144 < a354) && (-28 >= a354)) && (a386 == 12 &&  cf==1 )))) && ((((166 < a279) && (330 >= a279)) && a362 == a242[2]) && a362 == a242[2]))) {
    		calculate_outputm133(input);
    	} 
    	if(((a295 == a302[2] && (((-88 < a356) && (-18 >= a356)) && ((( cf==1  && a386 == 14) && a219 == 8) && a370 == 34))) && (a299 == 34 && a369 == 10))) {
    		calculate_outputm134(input);
    	} 
    } 
    if((((36 == a326[0]) && ((a208 == 8 && (a377 == a374[2] && (((248 < a376) && (381 >= a376)) && ((166 < a279) && (330 >= a279))))) && (98 == a277[3]))) && (a161 == a19[4] &&  cf==1 ))) {
    	if(((((84 == a306[2]) && (36 == a326[0])) && a370 == 34) && ((a359 == 34 && ((a57 == a49[5] &&  cf==1 ) && a369 == 10)) && a359 == 34))) {
    		calculate_outputm137(input);
    	} 
    } 
    if(((a322 == 34 && (a380 == 6 && a293 == a311[2])) && (a355 == a235[2] && (((a161 == a19[5] &&  cf==1 ) && a359 == 34) && a369 == 10)))) {
    	if(((a377 == a374[2] && (a369 == 10 && (54 == a234[0]))) && ((((a103 == 2 &&  cf==1 ) && a295 == a302[2]) && ((145 < a280) && (181 >= a280))) && ((234 < a257) && (380 >= a257))))) {
    		calculate_outputm139(input);
    	} 
    } 
    if(((a380 == 6 && (a322 == 34 && ( cf==1  && a161 == a19[6]))) && (a355 == a235[2] && ((((248 < a376) && (381 >= a376)) && a370 == 34) && ((316 < a260) && (416 >= a260)))))) {
    	if(((((248 < a376) && (381 >= a376)) && (a324 == a341[2] && (a204 == 12 && ((-144 < a354) && (-28 >= a354))))) && (a394 == 3 && (a230 == 34 && (a29 == 14 &&  cf==1 ))))) {
    		calculate_outputm144(input);
    	} 
    	if((((((36 == a326[0]) && (a29 == 17 &&  cf==1 )) && a359 == 34) && (36 == a326[0])) && ((a369 == 10 && ((248 < a376) && (381 >= a376))) && ((248 < a376) && (381 >= a376))))) {
    		calculate_outputm145(input);
    	} 
    } 
}
 void calculate_outputm148(int input) {
    if((((a13 == 35 && (a387 == 34 && ((a54 == 6 && a394 == 3) && a377 == a374[2]))) && (94 == a42[2])) && (a370 == 34 && ((((-48 < a347) && (127 >= a347)) && (a28 == 36 && (input == inputs[1] &&  cf==1 ))) && (76 == a236[3]))))) {
	if((a167 + 20) > a167){
	a167  +=  2 ;}
	 else{	
	a167  +=  0;}
    	cf = 0;
    	a54 = (a219 + 2);
    	a161 = a19[((a54 - a394) - 1)]; 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if(((((94 == a42[2]) && (a13 == 35 &&  cf==1 )) && a54 == 6) && (((a388 == 10 && (a324 == a341[2] && ((76 == a236[3]) && ((a322 == 34 && (84 == a306[2])) && input == inputs[4])))) && a28 == 36) && a208 == 8))) {
    	cf = 0;
    	a161 = a19[((a369 + a394) - 11)];
    	a347 = ((((((a347 * a354) * 1) % 87) - -39) - 28721) - -28721);
    	a324 = a341[(a204 - 10)];
    	a354 = (((((((a344 * a257) % 14999) * 2) % 57) + -84) / 5) + -25);
    	a279 = (((((((a376 * a344) % 14999) % 81) - -248) + 21767) / 5) + -4190);
    	a370 = 34 ;
    	a306 = a262;
    	a280 = (((((((a344 * a344) - 161) % 17) + 163) / 5) * 51) / 10);
    	a13 = 34 ;
    	a356 = (((((a344 * a344) / 5) % 34) - 51) - 1);
    	a398 = a339; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a362 == a242[2] && (((-144 < a354) && (-28 >= a354)) && (94 == a42[2]))) && a359 == 34) && input == inputs[2]) && (((((234 < a257) && (380 >= a257)) && (((234 < a257) && (380 >= a257)) && (( cf==1  && a13 == 35) && a54 == 6))) && a217 == a233[2]) && a28 == 36))) {
    	cf = 0;
    	a347 = ((((((a347 * a260) % 14999) * 2) / 5) + 14505) - 28485);
    	a103 = ((a54 * a54) + -34);
    	a370 = 33 ;
    	a13 = 33 ;
    	a287 = 33 ;
    	a280 = ((((((a376 * a344) % 14999) - 14984) + 15024) * 1) - 15030);
    	a204 = (a328 + 4);
    	a200 = a152[((a54 / a54) + 3)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a54 == 6 && (((a293 == a311[2] && (a217 == a233[2] && a380 == 6)) && (65 == a237[1])) && input == inputs[3])) && ((a387 == 34 && ((((94 == a42[2]) &&  cf==1 ) && a13 == 35) && ((-144 < a354) && (-28 >= a354)))) && a28 == 36))) {
	if((a4 + 20) > a4){
	a4  +=  1 ;}
	 else{	
	a4  +=  0;}
	if((a167 - 20) < a167){
	a167  -=  4 ;}
	 else{	
	a167  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if(((((a356 <=  -144 && a258 <=  -43) || (31 == a11[2])) && a212 == 15) && !(27 == a72[0]))) {
    	a362 = a242[(a304 + -9)];
    	a326 = a360;
    	a355 = a235[(a394 - 3)];
    	a347 = ((((((a347 * a376) % 14999) % 14917) + -15082) * 1) + -2);
    	a161 = a19[((a54 + a54) - 11)];
    	a332 = ((a328 / a54) - -4);
    	a370 = 33 ;
    	a295 = a302[(a332 - 5)];
    	a215 = a205;
    	a377 = a374[(a380 - 4)];
    	a331 = 34 ;
    	a13 = 34 ;
    	a328 = ((a388 + a380) - 12);
    	a204 = ((a304 * a304) - 71);
    	a293 = a311[(a369 + -10)]; 
    	}else {
    	a135 = (a388 - -5);
    	a13 = 33 ;
    	a103 = (a135 + -7);
    	}printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm162(int input) {
    if(((a362 == a242[2] && (a13 == 35 && ((((94 == a42[2]) &&  cf==1 ) && (31 == a11[2])) && a54 == 12))) && (a293 == a311[2] && ((a328 == 6 && (((54 == a234[0]) && ((-105 < a344) && (76 >= a344))) && input == inputs[1])) && a295 == a302[2])))) {
    	cf = 0;
    	if(a191 == 36) {
    	a102 = a17[(a394 - 2)];
    	a42 = a76;
    	a256 = a312;
    	a20 = a16; 
    	}else {
    	a280 = ((((a280 - 21055) / 5) - -25654) * -1);
    	a380 = 4;
    	a279 = ((((((a279 * 10) / -9) + 24694) - -3058) * -1) / 10);
    	a328 = 4;
    	a277 = a368;
    	a306 = a213;
    	a354 = ((((a354 + -15371) + 39290) / 5) + -4852);
    	a234 = a305;
    	a370 = 34 ;
    	a299 = 34 ;
    	a324 = a341[1];
    	a359 = 36 ;
    	a356 = ((((a356 * 81) / 10) - 7596) * 3);
    	a293 = a311[4];
    	a295 = a302[5];
    	a155 = ((a54 + a54) - 14);
    	a204 = 13;
    	a13 = 32 ;
    	a257 = (((a257 + 17000) + 8771) * 1);
    	a230 = 36 ;
    	a32 = (((10 * 5) * 5) / 5);
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((((94 == a42[2]) && (a13 == 35 && (a54 == 12 &&  cf==1 ))) && (54 == a234[0])) && a355 == a235[2]) && ((a331 == 34 && ((((98 == a277[3]) && a330 == a391[2]) && input == inputs[3]) && (31 == a11[2]))) && a287 == 34))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if(((-194 < a354) && (-144 >= a354))) {
    	a54 = (a204 + -7);
    	a62 = a198; 
    	}else {
    	a354 = ((((a354 - -17639) + -32303) / 5) - -2770);
    	a279 = ((((a279 % 81) - -231) - -13700) + -13689);
    	a387 = 34 ;
    	a234 = a214;
    	a219 = 11;
    	a380 = 8;
    	a232 = 34 ;
    	a293 = a311[0];
    	a350 = a283;
    	a277 = a368;
    	a260 = (((88 - 23109) / 5) + -1744);
    	a230 = 33 ;
    	a359 = 36 ;
    	a388 = 11;
    	a322 = 35 ;
    	a376 = ((((43 - 26528) - -26804) - -15251) - 15285);
    	a331 = 36 ;
    	a299 = 33 ;
    	a204 = 10;
    	a208 = 6;
    	a42 = a76;
    	a370 = 33 ;
    	a362 = a242[0];
    	a330 = a391[2];
    	a306 = a250;
    	a224 = a342[6];
    	a328 = 4;
    	a369 = 12;
    	a356 = (((((a356 + 6238) * 10) / 9) - 12694) - -5879);
    	a347 = (((a347 - -20557) - -3954) - -382);
    	a41 = (a54 + -3);
    	a129 = a186[((a41 * a54) + -102)];
    	a20 = a170;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a54 == 12 && ((a204 == 12 && (((-48 < a347) && (127 >= a347)) && a217 == a233[2])) && a299 == 34)) && (31 == a11[2])) && (a322 == 34 && ((((-88 < a356) && (-18 >= a356)) && (((94 == a42[2]) &&  cf==1 ) && input == inputs[4])) && a13 == 35)))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a103 = (a54 - 4);
    	a13 = 33 ;
    	a135 = (a394 + 7); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((-144 < a354) && (-28 >= a354)) && (a380 == 6 && (((-48 < a347) && (127 >= a347)) && (((a13 == 35 && ( cf==1  && (31 == a11[2]))) && a232 == 34) && input == inputs[0])))) && (a330 == a391[2] && ((((145 < a280) && (181 >= a280)) && (94 == a42[2])) && a54 == 12)))) {
    	cf = 0;
    	a326 = a321;
    	a330 = a391[6];
    	a354 = (((((a354 + 5434) * 10) / 9) * 10) / 9);
    	a362 = a242[4];
    	a299 = 35 ;
    	a215 = a223;
    	a13 = 32 ;
    	a324 = a341[0];
    	a155 = (a328 + 9);
    	a380 = 10;
    	a344 = (((a344 + -13458) - -35156) - -7262);
    	a401 = a272[((a155 + a155) + -26)]; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((a362 == a242[2] && (a54 == 12 && ((a219 == 8 && (a299 == 34 && input == inputs[2])) && ((234 < a257) && (380 >= a257))))) && ((((-144 < a354) && (-28 >= a354)) && (a293 == a311[2] && ((a13 == 35 &&  cf==1 ) && (31 == a11[2])))) && (94 == a42[2])))) {
    	cf = 0;
    	a264 = a270;
    	a180 = a35[(a219 + -5)];
    	a13 = 36 ;
    	a324 = a341[5];
    	a326 = a201;
    	a215 = a248;
    	a98 = a67[(a369 + -6)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm10(int input) {
    if((((a208 == 8 && (a387 == 34 && a304 == 9)) && a388 == 10) && ((a388 == 10 && ( cf==1  && a54 == 6)) && ((248 < a376) && (381 >= a376))))) {
    	if((((a370 == 34 && (a204 == 12 && a224 == a342[2])) && ((248 < a376) && (381 >= a376))) && (((a28 == 36 &&  cf==1 ) && a217 == a233[2]) && a219 == 8))) {
    		calculate_outputm148(input);
    	} 
    } 
    if(((a387 == 34 && ((101 == a350[5]) && (((166 < a279) && (330 >= a279)) && a394 == 3))) && ((( cf==1  && a54 == 12) && a377 == a374[2]) && a359 == 34))) {
    	if(((((166 < a279) && (330 >= a279)) && (a394 == 3 && a299 == 34)) && ((54 == a234[0]) && ((84 == a306[2]) && (a369 == 10 && ( cf==1  && (31 == a11[2]))))))) {
    		calculate_outputm162(input);
    	} 
    } 
}
 void calculate_outputm167(int input) {
    if(((a116 == a53[4] && ((a293 == a311[2] && ((65 == a237[1]) && a13 == 36)) && a224 == a342[2])) && (input == inputs[0] && ((a232 == 34 && ((( cf==1  && (94 == a42[2])) && a180 == a35[1]) && a362 == a242[2])) && (65 == a237[1]))))) {
    	cf = 0;
    	if((!(a116 == a53[5]) && (((-4 < a258) && (161 >= a258)) && ((!(a129 == a186[3]) && a191 == 34) || !(a355 == 6))))) {
    	a41 = ((a204 + a388) + -11);
    	a193 = (a328 + 1);
    	a20 = a170;
    	a42 = a76; 
    	}else {
    	a13 = 35 ;
    	a54 = ((a328 + a369) - 8);
    	a57 = a49[((a54 * a54) + -62)];
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((input == inputs[4] && ((((((54 == a234[0]) && a331 == 34) && a322 == 34) && a13 == 36) && a116 == a53[4]) && a293 == a311[2])) && (a362 == a242[2] && ((( cf==1  && a180 == a35[1]) && (94 == a42[2])) && a331 == 34)))) {
    	cf = 0;
    	if(a330 == a391[7]) {
    	a13 = 33 ;
    	a103 = 8;
    	a135 = (a204 - -2); 
    	}else {
    	a299 = 35 ;
    	a150 = ((a328 + a204) - 14);
    	a237 = a345;
    	a330 = a391[3];
    	a380 = 5;
    	a208 = 9;
    	a219 = 9;
    	a279 = ((((86 + 17167) * 10) / 9) - -1323);
    	a295 = a302[1];
    	a350 = a323;
    	a394 = 2;
    	a260 = ((((a260 % 49) + 320) + 15094) - 15071);
    	a322 = 35 ;
    	a370 = 36 ;
    	a215 = a223;
    	a376 = ((((12 * 249) / 10) - -17180) + -17221);
    	a42 = a197;
    	a257 = (((14 + -6169) + -6957) - 16234);
    	a326 = a360;
    	a306 = a250;
    	a377 = a374[4];
    	a354 = (((17 * 5) - 6302) + 6070);
    	a280 = (((98 * 5) - -19751) - -6342);
    	a293 = a311[3];
    	a217 = a233[5];
    	a344 = ((((a344 - -10089) - 33341) * -1) / 10);
    	a331 = 35 ;
    	a324 = a341[6];
    	a236 = a329;
    	a234 = a372;
    	a381 = a395;
    	a356 = ((((((a356 % 27) - 102) * 5) + 8762) % 27) + -139);
    	a328 = 7;
    	a230 = 32 ;
    	a347 = (((50 * 5) * 5) + 26077);
    	a304 = 10;
    	a369 = 12;
    	a362 = a242[1];
    	a264 = a273;
    	a232 = 35 ;
    	a169 = (((42 / 5) - -22578) + 6607);
    	a355 = a235[1];
    	a388 = 9;
    	a387 = 32 ;
    	a204 = 13;
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a208 == 8 && (a369 == 10 && (((54 == a234[0]) && a116 == a53[4]) && input == inputs[1]))) && a304 == 9) && (a180 == a35[1] && ((((a13 == 36 &&  cf==1 ) && (94 == a42[2])) && a369 == 10) && (51 == a215[1]))))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
	if((a157 - 20) < a157){
	a157  -=  1 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a355 == a235[2] && ((94 == a42[2]) && ( cf==1  && a116 == a53[4]))) && (a13 == 36 && ((((((((316 < a260) && (416 >= a260)) && a330 == a391[2]) && a387 == 34) && a230 == 34) && a331 == 34) && a180 == a35[1]) && input == inputs[3])))) {
    	cf = 0;
    	a54 = a204;
    	a13 = 35 ;
    	a11 = a40; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a299 == 34 && (a370 == 34 && ((a287 == 34 && (( cf==1  && a116 == a53[4]) && (94 == a42[2]))) && a180 == a35[1]))) && (input == inputs[2] && (((a293 == a311[2] && a369 == 10) && a13 == 36) && (84 == a306[2]))))) {
    	cf = 0;
    	if(((!(a41 == 8) || (a14 == a182[6] && a126 == 32)) && a401 == 2)) {
    	a230 = 34 ;
    	a330 = a391[6];
    	a42 = a76;
    	a215 = a223;
    	a217 = a233[6];
    	a277 = a382;
    	a356 = (((a356 + 29481) * 1) - -126);
    	a350 = a283;
    	a306 = a250;
    	a380 = 10;
    	a295 = a302[4];
    	a219 = 9;
    	a204 = 10;
    	a293 = a311[5];
    	a299 = 36 ;
    	a370 = 36 ;
    	a236 = a329;
    	a354 = (((18 + 10794) / 5) + 23738);
    	a394 = 3;
    	a264 = a273;
    	a377 = a374[7];
    	a376 = (((48 - 10825) - 639) / 5);
    	a328 = 9;
    	a287 = 33 ;
    	a232 = 34 ;
    	a256 = a312;
    	a359 = 34 ;
    	a355 = a235[6];
    	a20 = a16;
    	a347 = (((((95 * 14) / 10) * 5) - 22192) - -41422);
    	a322 = 36 ;
    	a280 = (((25 - -134) + -4) * 1);
    	a208 = 8;
    	a369 = 12;
    	a234 = a372;
    	a387 = 34 ;
    	a324 = a341[7];
    	a304 = 9;
    	a388 = 11;
    	a344 = ((((a344 - 18168) * -1) / 10) * 5);
    	a279 = ((((51 * 5) * 5) / 5) - -24680);
    	a362 = a242[7];
    	a102 = a17[2]; 
    	}else {
    	a362 = a242[1];
    	a217 = a233[4];
    	a306 = a213;
    	a287 = 33 ;
    	a234 = a214;
    	a328 = 10;
    	a355 = a235[4];
    	a324 = a341[5];
    	a377 = a374[0];
    	a394 = 8;
    	a215 = a223;
    	a344 = ((((a344 - 18408) % 41) - 118) + 5);
    	a354 = ((((3 - 170) - 16633) - -24793) - 8138);
    	a161 = a19[((a380 + a388) + -13)];
    	a386 = 14;
    	a279 = ((((85 - 7250) * 10) / -9) - -7104);
    	a232 = 34 ;
    	a13 = 34 ;
    	a388 = 8;
    	}printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm169(int input) {
    if((((((a13 == 36 && ( cf==1  && a14 == a182[0])) && (98 == a277[3])) && (36 == a326[0])) && a380 == 6) && (a224 == a342[2] && (((94 == a42[2]) && ((input == inputs[3] && ((234 < a257) && (380 >= a257))) && a180 == a35[2])) && ((248 < a376) && (381 >= a376)))))) {
    	cf = 0;
    	a204 = (a388 - -1);
    	a20 = a16;
    	a208 = ((a219 / a328) + 6);
    	a232 = 32 ;
    	a326 = a201;
    	a295 = a302[(a394 + -2)];
    	a376 = ((((((a376 * a257) % 14999) - 4664) / 5) % 63) - -185);
    	a236 = a267;
    	a256 = a312;
    	a359 = 32 ;
    	a42 = a76;
    	a354 = (((((a354 * a279) % 24) - 167) + 28022) + -28023);
    	a219 = (a394 + 4);
    	a380 = (a394 - -2);
    	a102 = a17[3]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a287 == 34 && (a180 == a35[2] && (input == inputs[0] && (((94 == a42[2]) && (a13 == 36 && ( cf==1  && a14 == a182[0]))) && (36 == a326[0]))))) && a295 == a302[2]) && ((((-144 < a354) && (-28 >= a354)) && a293 == a311[2]) && a322 == 34)) && a4 >= 2)) {
    	cf = 0;
    	a377 = a374[(a388 - 8)];
    	a54 = ((a328 / a219) + 12);
    	a13 = 35 ;
    	a299 = 34 ;
    	a11 = a40;
    	a279 = ((((((a354 * a260) % 14999) % 81) + 249) / 5) - -151); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a180 == a35[2] && (a13 == 36 &&  cf==1 )) && a295 == a302[2]) && ((101 == a350[5]) && ((input == inputs[1] && ((((a14 == a182[0] && a224 == a342[2]) && (94 == a42[2])) && ((-144 < a354) && (-28 >= a354))) && a295 == a302[2])) && (101 == a350[5]))))) {
    	cf = 0;
    	a377 = a374[(a380 + -4)];
    	a264 = a393;
    	a13 = 32 ;
    	a230 = 34 ;
    	a279 = (((((a344 * a354) % 81) - -248) - -1) + 1);
    	a306 = a213;
    	a369 = a388;
    	a155 = 8;
    	a331 = 34 ;
    	a234 = a214;
    	a299 = 34 ;
    	a163 = a174; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm171(int input) {
    if((((a355 == a235[2] && (a14 == a182[5] && ((94 == a42[2]) && (input == inputs[1] &&  cf==1 )))) && a293 == a311[2]) && (((166 < a279) && (330 >= a279)) && ((a324 == a341[2] && (a13 == 36 && (a180 == a35[2] && (84 == a306[2])))) && ((248 < a376) && (381 >= a376)))))) {
	if((a111 - 20) < a111){
	a111  -=  3 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a155 = 13;
    	a13 = 32 ;
    	a75 = a176[(a155 - 13)]; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((-144 < a354) && (-28 >= a354)) && ((84 == a306[2]) && (a13 == 36 && a232 == 34))) && (a208 == 8 && ((((input == inputs[2] && ((94 == a42[2]) && (a14 == a182[5] &&  cf==1 ))) && a180 == a35[2]) && a331 == 34) && a330 == a391[2])))) {
	if((a4 - 20) < a4){
	a4  -=  3 ;}
	 else{	
	a4  -=  0;}
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a344 = (((((16 - -29422) * 1) / 5) * -1) / 10);
    	a217 = a233[3];
    	a98 = a67[(a394 + 1)];
    	a180 = a35[(a219 - 5)]; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a13 == 36 && (a180 == a35[2] && ((a330 == a391[2] && (((145 < a280) && (181 >= a280)) && (((a14 == a182[5] &&  cf==1 ) && (94 == a42[2])) && a232 == 34))) && ((145 < a280) && (181 >= a280))))) && ((a394 == 3 && input == inputs[3]) && a287 == 34))) {
    	cf = 0;
    	if((a180 == 4 && 76 < a344)) {
    	a155 = (a204 - -3);
    	a13 = 32 ;
    	a401 = a272[(a155 - 12)]; 
    	}else {
    	a150 = (a388 + -5);
    	a381 = a395;
    	a42 = a197;
    	a163 = a143;
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((((a328 == 6 && a180 == a35[2]) && a362 == a242[2]) && a328 == 6) && ((((145 < a280) && (181 >= a280)) && (a299 == 34 && (((94 == a42[2]) && ((a13 == 36 &&  cf==1 ) && input == inputs[4])) && a377 == a374[2]))) && a14 == a182[5]))) {
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a0 = 36 ;
    	a180 = a35[(a388 - 10)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((( cf==1  && a14 == a182[5]) && input == inputs[0]) && a293 == a311[2]) && (a180 == a35[2] && (((((51 == a215[1]) && ((94 == a42[2]) && (a230 == 34 && a293 == a311[2]))) && a359 == 34) && a13 == 36) && ((166 < a279) && (330 >= a279)))))) {
    	cf = 0;
    	a287 = 33 ;
    	a279 = (((a279 - -2671) * 5) - -13108);
    	a377 = a374[4];
    	a13 = 34 ;
    	a326 = a360;
    	a394 = 3;
    	a232 = 33 ;
    	a355 = a235[7];
    	a215 = a248;
    	a324 = a341[6];
    	a161 = a19[((a380 / a369) - -3)];
    	a354 = ((((a354 % 24) + -154) - 4) - -2);
    	a362 = a242[4];
    	a306 = a262;
    	a257 = ((((((a257 % 72) - -263) - 9551) * 3) % 72) - -322);
    	a388 = 10;
    	a328 = 8;
    	a386 = (a369 - -4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm173(int input) {
    if(((((a98 == a67[4] &&  cf==1 ) && input == inputs[1]) && (76 == a236[3])) && ((36 == a326[0]) && ((((234 < a257) && (380 >= a257)) && ((((94 == a42[2]) && (a232 == 34 && a330 == a391[2])) && a13 == 36) && a180 == a35[3])) && ((166 < a279) && (330 >= a279)))))) {
    	cf = 0;
    	a42 = a197;
    	a150 = (a388 + -1);
    	a43 = a61[((a150 - a204) + 5)];
    	a381 = a395; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((a330 == a391[2] && ((((94 == a42[2]) && (a98 == a67[4] &&  cf==1 )) && a299 == 34) && a13 == 36)) && (a359 == 34 && ((a380 == 6 && (input == inputs[3] && (((316 < a260) && (416 >= a260)) && ((234 < a257) && (380 >= a257))))) && a180 == a35[3])))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if((!(a287 == 33) && (94 == a47[0]))) {
    	a150 = 8;
    	a381 = a395;
    	a42 = a197;
    	a7 = (((37 - -16760) - 35457) - 9319); 
    	}else {
    	a103 = (a388 - 5);
    	a13 = 34 ;
    	a161 = a19[a103];
    	}printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a98 == a67[4] && ((((316 < a260) && (416 >= a260)) && (((input == inputs[2] && (a13 == 36 &&  cf==1 )) && a180 == a35[3]) && (22 == a264[5]))) && a324 == a341[2])) && (a370 == 34 && ((94 == a42[2]) && ((36 == a326[0]) && a287 == 34))))) {
	if((a157 - 20) < a157){
	a157  -=  2 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a54 = 8;
    	a13 = 35 ;
    	a57 = a49[((a54 * a54) + -63)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a180 == a35[3] && (input == inputs[0] && ((76 == a236[3]) && a13 == 36))) && a293 == a311[2]) && (((a359 == 34 && (((94 == a42[2]) && ( cf==1  && a98 == a67[4])) && (84 == a306[2]))) && ((-48 < a347) && (127 >= a347))) && a394 == 3))) {
    	cf = 0;
    	a13 = 35 ;
    	a54 = (a394 - -2);
    	a62 = a149; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((a295 == a302[2] && (((a208 == 8 && (36 == a326[0])) && a230 == 34) && (94 == a42[2]))) && a13 == 36) && ((((76 == a236[3]) && (input == inputs[4] && (a180 == a35[3] &&  cf==1 ))) && a299 == 34) && a98 == a67[4]))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a41 = (a394 + 8);
    	a20 = a170;
    	a42 = a76;
    	a193 = (a41 + -3); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm175(int input) {
    if((((51 == a215[1]) && (((a180 == a35[4] && ( cf==1  && input == inputs[4])) && (22 == a264[5])) && (94 == a42[2]))) && (a299 == 34 && (a13 == 36 && (a204 == 12 && (a322 == 34 && ((26 == a79[5]) && a217 == a233[2]))))))) {
    	cf = 0;
    	a237 = a349;
    	a217 = a233[(a388 - 10)];
    	a347 = ((((((a347 * a279) % 14999) % 14917) + -15082) * 1) + -2);
    	a356 = (((((((a260 * a257) % 14999) % 34) - 82) / 5) * 49) / 10);
    	a232 = 33 ;
    	a324 = a341[(a219 - 8)];
    	a293 = a311[(a380 + -5)];
    	a13 = 34 ;
    	a394 = (a204 + -11);
    	a29 = (a304 + 8);
    	a331 = 33 ;
    	a344 = ((((((a260 * a376) % 14999) % 90) + -19) - 59) - -15);
    	a161 = a19[(a388 + -4)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a232 == 34 && (a324 == a341[2] && ((a304 == 9 && (((166 < a279) && (330 >= a279)) && (a180 == a35[4] && ((248 < a376) && (381 >= a376))))) && a322 == 34))) && ((94 == a42[2]) && (((a13 == 36 &&  cf==1 ) && (26 == a79[5])) && input == inputs[1]))) && a157 >= -2)) {
    	cf = 0;
    	a20 = a170;
    	a232 = 32 ;
    	a215 = a248;
    	a230 = 32 ;
    	a219 = ((a380 * a369) + -53);
    	a41 = ((a304 / a304) - -5);
    	a264 = a270;
    	a299 = 32 ;
    	a394 = ((a219 + a388) - 15);
    	a326 = a201;
    	a290 = 33 ;
    	a279 = ((((((a279 * a260) % 14999) - 29032) / 5) % 101) - -77);
    	a42 = a76;
    	a347 = ((((((a347 * a376) % 14999) + 10590) / 5) % 58) + -107);
    	a369 = (a208 - -1);
    	a380 = (a41 + -1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a293 == a311[2] && ((((248 < a376) && (381 >= a376)) && (((36 == a326[0]) && a13 == 36) && (65 == a237[1]))) && a369 == 10)) && ((94 == a42[2]) && ((((a180 == a35[4] &&  cf==1 ) && (26 == a79[5])) && (36 == a326[0])) && input == inputs[0])))) {
	if((a157 - 20) < a157){
	a157  -=  4 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a13 = 34 ;
    	a161 = a19[5];
    	a103 = 7; 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if((((98 == a277[3]) && (((-48 < a347) && (127 >= a347)) && ((a208 == 8 && a370 == 34) && (26 == a79[5])))) && (((input == inputs[2] && ((94 == a42[2]) && (a13 == 36 && (a180 == a35[4] &&  cf==1 )))) && a219 == 8) && (98 == a277[3])))) {
    	cf = 0;
    	a324 = a341[(a369 + -10)];
    	a293 = a311[(a328 - 5)];
    	a344 = ((((((a376 * a354) % 14999) % 90) - 13) + -1) + 1);
    	a394 = ((a369 - a208) + -1);
    	a13 = 34 ;
    	a217 = a233[(a328 / a304)];
    	a237 = a349;
    	a347 = ((((a347 * a354) - 11748) * 1) + -62);
    	a232 = 33 ;
    	a331 = 33 ;
    	a29 = ((a328 - a328) - -17);
    	a161 = a19[((a380 * a369) - 54)];
    	a356 = ((((((a279 * a344) % 14999) * 2) % 34) - 53) + 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm178(int input) {
    if((((((248 < a376) && (381 >= a376)) && ((a359 == 34 && (a13 == 36 && ((166 < a279) && (330 >= a279)))) && (94 == a42[2]))) && ((234 < a257) && (380 >= a257))) && ((((input == inputs[2] && ( cf==1  && a180 == a35[6])) && a324 == a341[2]) && a102 == a17[2]) && a394 == 3))) {
	if((a111 + 20) > a111){
	a111  +=  3 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	a180 = a35[(a388 - 7)];
    	a98 = a67[((a388 + a388) - 15)]; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((94 == a42[2]) && ((((98 == a277[3]) && a304 == 9) && a102 == a17[2]) && input == inputs[3])) && (((((76 == a236[3]) && (a13 == 36 && ( cf==1  && a180 == a35[6]))) && a394 == 3) && a331 == 34) && a362 == a242[2]))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	if(a290 == 36) {
    	a13 = 35 ;
    	a54 = (a208 - -4);
    	a11 = a40; 
    	}else {
    	a264 = a273;
    	a401 = a272[(a208 - 6)];
    	a13 = 32 ;
    	a155 = (a204 - -3);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((a380 == 6 && (((248 < a376) && (381 >= a376)) && (a102 == a17[2] && (a180 == a35[6] && ( cf==1  && input == inputs[1]))))) && a377 == a374[2]) && ((84 == a306[2]) && ((a13 == 36 && (((248 < a376) && (381 >= a376)) && ((-144 < a354) && (-28 >= a354)))) && (94 == a42[2]))))) {
	if((a111 + 20) > a111){
	a111  +=  2 ;}
	 else{	
	a111  +=  0;}
    	cf = 0;
    	if((!(a161 == a19[0]) || (a161 == a19[4] || (54 == a234[0])))) {
    	a54 = 8;
    	a13 = 35 ;
    	a57 = a49[((a54 - a388) + 3)]; 
    	}else {
    	a102 = a17[((a369 / a328) + -1)];
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if((((98 == a277[3]) && (((51 == a215[1]) && ((a180 == a35[6] && (a13 == 36 &&  cf==1 )) && input == inputs[4])) && ((-144 < a354) && (-28 >= a354)))) && ((a299 == 34 && ((((248 < a376) && (381 >= a376)) && a102 == a17[2]) && (94 == a42[2]))) && (84 == a306[2])))) {
	if((a167 + 20) > a167){
	a167  +=  1 ;}
	 else{	
	a167  +=  0;}
	if((a111 - 20) < a111){
	a111  -=  1 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a13 = 35 ;
    	a161 = a19[(a388 - 3)];
    	a54 = 10; 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((((a102 == a17[2] && (a204 == 12 && (a287 == 34 && (a180 == a35[6] && (a13 == 36 && ( cf==1  && input == inputs[0])))))) && a362 == a242[2]) && a293 == a311[2]) && (a304 == 9 && ((94 == a42[2]) && a293 == a311[2])))) {
	if((a157 - 20) < a157){
	a157  -=  3 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a41 = (a394 - -3);
    	a20 = a170;
    	a290 = 34 ;
    	a42 = a76; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
}
 void calculate_outputm179(int input) {
    if(((((94 == a42[2]) && ((a13 == 36 && (54 == a234[0])) && a219 == 8)) && a355 == a235[2]) && (a204 == 12 && ((a230 == 34 && (((a102 == a17[4] &&  cf==1 ) && a180 == a35[6]) && ((-105 < a344) && (76 >= a344)))) && input == inputs[1])))) {
    	cf = 0;
    	a13 = 35 ;
    	a54 = (a380 + 2);
    	a57 = a49[(a369 - a304)]; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if(((a322 == 34 && ((a102 == a17[4] && (a13 == 36 && ((94 == a42[2]) &&  cf==1 ))) && ((-88 < a356) && (-18 >= a356)))) && ((a232 == 34 && (((a180 == a35[6] && (84 == a306[2])) && input == inputs[3]) && a387 == 34)) && a331 == 34))) {
    	cf = 0;
    	a369 = (a388 - 2);
    	a354 = (((((((a344 * a260) % 14999) % 57) + -84) * 5) % 57) + -52);
    	a344 = (((((a344 * a257) % 14999) / 5) + -12153) * 1);
    	a219 = (a369 + -2);
    	a230 = 33 ;
    	a204 = a388;
    	a293 = a311[(a394 + -2)];
    	a264 = a393;
    	a324 = a341[(a394 + -3)];
    	a234 = a305;
    	a217 = a233[(a369 + -8)];
    	a42 = a197;
    	a380 = ((a388 - a394) + -3);
    	a287 = 33 ;
    	a331 = 33 ;
    	a257 = ((((((a356 * a376) % 14999) / 5) % 72) + 306) * 1);
    	a347 = ((((((a260 * a260) % 14999) - -11075) * 1) * 10) / -9);
    	a279 = ((((((((a376 * a356) % 14999) - -12862) % 81) - -249) * 5) % 81) - -245);
    	a237 = a298;
    	a306 = a262;
    	a322 = 33 ;
    	a98 = a67[((a388 - a388) - -1)];
    	a356 = ((((((a356 * a376) % 14999) - 2623) * 10) / 9) - 10138);
    	a295 = a302[(a388 + -10)];
    	a224 = a342[((a219 + a369) + -14)];
    	a381 = a390;
    	a304 = (a204 + -3);
    	a355 = a235[(a388 - 10)];
    	a326 = a360;
    	a137 = a84;
    	a208 = (a204 + -4);
    	a215 = a205;
    	a359 = 34 ;
    	a388 = (a219 + 2); 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((a224 == a342[2] && (input == inputs[4] && (a180 == a35[6] && (((248 < a376) && (381 >= a376)) && ((a102 == a17[4] && ( cf==1  && (94 == a42[2]))) && (101 == a350[5])))))) && (51 == a215[1])) && (a359 == 34 && (a13 == 36 && (65 == a237[1]))))) {
    	cf = 0;
    	a295 = a302[((a394 / a394) + 1)];
    	a277 = a382;
    	a155 = ((a388 / a388) - -9);
    	a287 = 34 ;
    	a32 = (((((((a344 * a344) % 73) + -88) * 5) + 4520) % 73) + -102);
    	a377 = a374[(a219 - 6)];
    	a370 = 34 ;
    	a330 = a391[(a380 + -4)];
    	a215 = a223;
    	a299 = 34 ;
    	a264 = a393;
    	a293 = a311[(a155 - 9)];
    	a359 = 34 ;
    	a304 = (a204 + -3);
    	a13 = 32 ;
    	a362 = a242[((a369 / a155) - -1)];
    	a230 = 34 ;
    	a257 = (((((((a257 * a32) % 14999) % 72) + 307) / 5) + -7598) - -7878);
    	a344 = (((((a344 * a347) % 90) - 14) + -1) - -2); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm180(int input) {
    if((((22 == a264[5]) && ((22 == a264[5]) && (((a13 == 36 && (a180 == a35[6] &&  cf==1 )) && (94 == a42[2])) && a232 == 34))) && ((((a102 == a17[6] && a299 == 34) && input == inputs[1]) && (76 == a236[3])) && a330 == a391[2]))) {
	if((a157 + 20) > a157){
	a157  +=  1 ;}
	 else{	
	a157  +=  0;}
    	cf = 0;
    	a304 = (a328 - -1);
    	a232 = 33 ;
    	a13 = 33 ;
    	a103 = 5;
    	a355 = a235[(a204 + -10)];
    	a359 = 34 ;
    	a330 = a391[(a219 + -8)];
    	a287 = 33 ;
    	a295 = a302[((a380 - a394) + -1)];
    	a264 = a270;
    	a306 = a250;
    	a257 = ((((((a257 * a347) % 14999) + -14984) - 5) + 19999) + -19995);
    	a215 = a205;
    	a237 = a298;
    	a326 = a201;
    	a344 = ((((a344 * a356) - 15311) * 1) * 1);
    	a380 = (a103 - 1);
    	a358 = a310[(a103 + 1)];
    	a299 = 34 ;
    	a219 = (a394 - -3);
    	a376 = (((((a376 * a279) % 14999) - 21614) + -6032) * 1);
    	a347 = ((((a347 * a354) / 5) + -22576) * 1); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a299 == 34 && ((94 == a42[2]) && ((((-48 < a347) && (127 >= a347)) && (a13 == 36 && (a180 == a35[6] &&  cf==1 ))) && a219 == 8))) && ((input == inputs[3] && (a102 == a17[6] && (((-105 < a344) && (76 >= a344)) && a377 == a374[2]))) && ((-88 < a356) && (-18 >= a356))))) {
	if((a4 - 20) < a4){
	a4  -=  4 ;}
	 else{	
	a4  -=  0;}
    	cf = 0;
    	a399 = (a208 - -2);
    	a13 = 35 ;
    	a54 = (a399 - 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm181(int input) {
    if((((a370 == 34 && ((((a180 == a35[7] && (a41 == 6 &&  cf==1 )) && (51 == a215[1])) && ((248 < a376) && (381 >= a376))) && a287 == 34)) && (94 == a42[2])) && (a387 == 34 && (input == inputs[3] && (a13 == 36 && (98 == a277[3])))))) {
	if((a157 - 20) < a157){
	a157  -=  4 ;}
	 else{	
	a157  -=  0;}
    	cf = 0;
    	a290 = 34 ;
    	a98 = a67[(a328 + -3)];
    	a381 = a390;
    	a42 = a197; 
    	 printf("%d\n", 20); fflush(stdout); 
    } 
    if((((((76 == a236[3]) && ((65 == a237[1]) && (a41 == 6 && (36 == a326[0])))) && ((-48 < a347) && (127 >= a347))) && a13 == 36) && ((94 == a42[2]) && (a322 == 34 && (a331 == 34 && (( cf==1  && input == inputs[0]) && a180 == a35[7])))))) {
    	cf = 0;
    	if((a75 == 13 && a2 == a139[4])) {
    	a180 = a35[(a204 - 7)];
    	a31 = a22[(a41 - 4)]; 
    	}else {
    	a13 = 32 ;
    	a155 = ((a369 * a394) - 18);
    	a44 = ((((83 - 177) - 8927) * 3) - -27050);
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((((234 < a257) && (380 >= a257)) && (input == inputs[2] && ((316 < a260) && (416 >= a260)))) && ((a180 == a35[7] && ((((94 == a42[2]) && (a208 == 8 && (a13 == 36 && (a41 == 6 &&  cf==1 )))) && a230 == 34) && a295 == a302[2])) && ((-48 < a347) && (127 >= a347))))) {
    	cf = 0;
    	if(((a377 == 6 && (!(a31 == 10) && (a388 == 12 || a41 == 8))) || a332 == 11)) {
    	a41 = ((a208 * a369) + -72);
    	a20 = a170;
    	a2 = a139[((a369 / a204) - -7)];
    	a42 = a76; 
    	}else {
    	a75 = a176[((a394 + a369) + -9)];
    	a13 = 32 ;
    	a155 = (a388 + 3);
    	}printf("%d\n", 24); fflush(stdout); 
    } 
    if(((a324 == a341[2] && (a369 == 10 && (((166 < a279) && (330 >= a279)) && (a13 == 36 && ((( cf==1  && a41 == 6) && a180 == a35[7]) && input == inputs[1]))))) && (a394 == 3 && (((94 == a42[2]) && a330 == a391[2]) && a362 == a242[2])))) {
    	cf = 0;
    	if(a299 == 36) {
    	a180 = a35[(a304 + -3)];
    	a102 = a17[(a208 + -8)]; 
    	}else {
    	a155 = a369;
    	a347 = (((a347 * 5) / 5) + 18557);
    	a328 = 11;
    	a230 = 36 ;
    	a356 = ((((12 - 89) / 5) - -1900) + -1949);
    	a354 = ((((a354 % 57) + -37) + -23202) - -23198);
    	a32 = ((((((a344 * a279) % 14999) / 5) / 5) % 15) + -177);
    	a370 = 34 ;
    	a13 = 32 ;
    	a215 = a223;
    	a344 = (((a344 * 5) - -24032) * 1);
    	}printf("%d\n", 21); fflush(stdout); 
    } 
    if(((a224 == a342[2] && (a362 == a242[2] && (a41 == 6 && a232 == 34))) && ((65 == a237[1]) && (a359 == 34 && (((94 == a42[2]) && (a180 == a35[7] && (a13 == 36 && ( cf==1  && input == inputs[4])))) && a355 == a235[2]))))) {
	if((a111 - 20) < a111){
	a111  -=  2 ;}
	 else{	
	a111  -=  0;}
    	cf = 0;
    	a42 = a197;
    	a150 = (a369 - 2);
    	a381 = a395;
    	a7 = (((27 - 25877) - 3271) / 5); 
    	 printf("%d\n", 24); fflush(stdout); 
    } 
}
 void calculate_outputm11(int input) {
    if(((((54 == a234[0]) && a204 == 12) && a295 == a302[2]) && (((51 == a215[1]) && (( cf==1  && a180 == a35[1]) && a217 == a233[2])) && (22 == a264[5])))) {
    	if((((a322 == 34 && ( cf==1  && a116 == a53[4])) && a388 == 10) && (((((-105 < a344) && (76 >= a344)) && a328 == 6) && ((-88 < a356) && (-18 >= a356))) && a324 == a341[2]))) {
    		calculate_outputm167(input);
    	} 
    } 
    if(((a370 == 34 && (((a180 == a35[2] &&  cf==1 ) && a359 == 34) && a322 == 34)) && ((a204 == 12 && a287 == 34) && ((234 < a257) && (380 >= a257))))) {
    	if(((a328 == 6 && (((a14 == a182[0] &&  cf==1 ) && (98 == a277[3])) && ((316 < a260) && (416 >= a260)))) && (a232 == 34 && ((76 == a236[3]) && a355 == a235[2])))) {
    		calculate_outputm169(input);
    	} 
    	if(((((-144 < a354) && (-28 >= a354)) && ((a394 == 3 && (36 == a326[0])) && a359 == 34)) && (a287 == 34 && (((-88 < a356) && (-18 >= a356)) && ( cf==1  && a14 == a182[5]))))) {
    		calculate_outputm171(input);
    	} 
    } 
    if(((((a217 == a233[2] && ((166 < a279) && (330 >= a279))) && a369 == 10) && ((-105 < a344) && (76 >= a344))) && (((76 == a236[3]) && ( cf==1  && a180 == a35[3])) && a204 == 12))) {
    	if(((a362 == a242[2] && ((51 == a215[1]) && (a232 == 34 && (a98 == a67[4] &&  cf==1 )))) && (a230 == 34 && ((65 == a237[1]) && a355 == a235[2])))) {
    		calculate_outputm173(input);
    	} 
    } 
    if(((a208 == 8 && (((a230 == 34 && a322 == 34) && a293 == a311[2]) && (98 == a277[3]))) && (((-48 < a347) && (127 >= a347)) && ( cf==1  && a180 == a35[4])))) {
    	if(((a355 == a235[2] && (a295 == a302[2] && (((26 == a79[5]) &&  cf==1 ) && a359 == 34))) && (a322 == 34 && (a331 == 34 && ((166 < a279) && (330 >= a279)))))) {
    		calculate_outputm175(input);
    	} 
    } 
    if((((84 == a306[2]) && ((a304 == 9 && ( cf==1  && a180 == a35[6])) && a219 == 8)) && ((36 == a326[0]) && (a232 == 34 && ((234 < a257) && (380 >= a257)))))) {
    	if((((a102 == a17[2] &&  cf==1 ) && (51 == a215[1])) && (a331 == 34 && (a369 == 10 && (((-48 < a347) && (127 >= a347)) && (((-105 < a344) && (76 >= a344)) && a328 == 6)))))) {
    		calculate_outputm178(input);
    	} 
    	if(((a304 == 9 && (a324 == a341[2] && (a208 == 8 && (54 == a234[0])))) && ((a324 == a341[2] && ( cf==1  && a102 == a17[4])) && ((-105 < a344) && (76 >= a344))))) {
    		calculate_outputm179(input);
    	} 
    	if((((( cf==1  && a102 == a17[6]) && a299 == 34) && (65 == a237[1])) && (a299 == 34 && ((54 == a234[0]) && (((248 < a376) && (381 >= a376)) && ((316 < a260) && (416 >= a260))))))) {
    		calculate_outputm180(input);
    	} 
    } 
    if(((((((65 == a237[1]) && (a180 == a35[7] &&  cf==1 )) && (51 == a215[1])) && a304 == 9) && a217 == a233[2]) && (a359 == 34 && a362 == a242[2]))) {
    	if(((((65 == a237[1]) && (a217 == a233[2] && ( cf==1  && a41 == 6))) && a304 == 9) && ((((-144 < a354) && (-28 >= a354)) && a219 == 8) && a224 == a342[2]))) {
    		calculate_outputm181(input);
    	} 
    } 
}

 void calculate_output(int input) {
        cf = 1;

    if(((((a344 <=  -188 && a230 == 33) && a356 <=  -144) && a370 == 33) && ((45 == a234[3]) && (((85 == a42[5]) &&  cf==1 ) && a347 <=  -166)))) {
    	if((((((98 == a381[4]) &&  cf==1 ) && a380 == 4) && a380 == 4) && ((a295 == a302[0] && (a354 <=  -194 && a299 == 33)) && a330 == a391[0]))) {
    		calculate_outputm1(input);
    	} 
    	if(((a224 == a342[0] && (a356 <=  -144 && ((104 == a381[4]) &&  cf==1 ))) && ((a331 == 33 && (a304 == 7 && a304 == 7)) && a217 == a233[0]))) {
    		calculate_outputm2(input);
    	} 
    	if(((((a219 == 6 && (((110 == a381[4]) &&  cf==1 ) && a370 == 33)) && a331 == 33) && (45 == a234[3])) && (a324 == a341[0] && a362 == a242[0]))) {
    		calculate_outputm3(input);
    	} 
    } 
    if(((a219 == 7 && ((a369 == 9 && a299 == 32) && a232 == 32)) && (((78 == a306[2]) && ( cf==1  && (90 == a42[4]))) && (33 == a326[3])))) {
    	if((((22 == a20[3]) &&  cf==1 ) && ((a324 == a341[1] && (((12 == a264[1]) && (a328 == 5 && a330 == a391[1])) && (49 == a234[1]))) && (89 == a277[0])))) {
    		calculate_outputm4(input);
    	} 
    	if((((((78 == a306[2]) && a369 == 9) && a377 == a374[1]) && (70 == a236[3])) && (((-194 < a354) && (-144 >= a354)) && (a380 == 5 && ( cf==1  && (30 == a20[5])))))) {
    		calculate_outputm5(input);
    	} 
    	if(((((a232 == 32 && ( cf==1  && (33 == a20[2]))) && a299 == 32) && (12 == a264[1])) && ((33 == a326[3]) && (((-38 < a279) && (166 >= a279)) && ((-38 < a279) && (166 >= a279)))))) {
    		calculate_outputm6(input);
    	} 
    } 
    if((((101 == a350[5]) && (a208 == 8 && (((94 == a42[2]) &&  cf==1 ) && a387 == 34))) && ((a224 == a342[2] && a322 == 34) && (76 == a236[3])))) {
    	if(((a230 == 34 && (a394 == 3 && (a13 == 33 &&  cf==1 ))) && (a217 == a233[2] && (a328 == 6 && (a394 == 3 && a331 == 34))))) {
    		calculate_outputm7(input);
    	} 
    	if((((a217 == a233[2] && a208 == 8) && ((316 < a260) && (416 >= a260))) && ((((a13 == 32 &&  cf==1 ) && (101 == a350[5])) && a232 == 34) && a355 == a235[2]))) {
    		calculate_outputm8(input);
    	} 
    	if(((a230 == 34 && (98 == a277[3])) && (((((a13 == 34 &&  cf==1 ) && ((248 < a376) && (381 >= a376))) && a299 == 34) && a208 == 8) && a330 == a391[2]))) {
    		calculate_outputm9(input);
    	} 
    	if(((a217 == a233[2] && a387 == 34) && (a287 == 34 && ((a380 == 6 && (( cf==1  && a13 == 35) && (65 == a237[1]))) && a232 == 34)))) {
    		calculate_outputm10(input);
    	} 
    	if(((a295 == a302[2] && (a388 == 10 && (a13 == 36 &&  cf==1 ))) && (((51 == a215[1]) && (a380 == 6 && ((316 < a260) && (416 >= a260)))) && a394 == 3))) {
    		calculate_outputm11(input);
    	} 
    } 
    errorCheck();

  if((cf==1)) 
    {
    
    }
    	//fprintf(stderr, "Invalid input: %d\n", input); 
}


int main()
{
kappa = 0;
    // main i/o-loop
   int symb;   
    for (int FLAG=0;FLAG<BOUND;FLAG++)
    {
          klee_make_symbolic(&symb, sizeof(int), "symb");  
        // operate eca engine
          if((symb != 2) && (symb != 1) && (symb != 4) && (symb != 5) && (symb != 3))
          return -2;
        calculate_output(symb);
    }
    
 return 0;

}


