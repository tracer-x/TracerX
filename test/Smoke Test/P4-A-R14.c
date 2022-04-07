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
	// inputs
	int inputs[] = {9,2,3,4,1,10,7,5,8,6};

	 int a86  = 32;
	 int a303  = 32;
	 int a184 = 1;
	 int a254 = 7;
	 int a104 = 7;
	 int a359 = 0;
	 int a162 = 0;
	 int a133 = 0;
	 int a23 = 8;
	 int a199 = 5;
	 int a289  = 33;
	 int a44 = 0;
	 int a320 = 13;
	 int a382  = 35;
	 int a183 = 0;
	 int a212  = 36;
	 int a121 = 13;
	 int a171 = 11;
	 int a313 = 5;
	 int a161  = 35;
	 int a74 = 8;
	 int a25 = 4;
	 int a42 = 13;
	 int a232 = 0;
	 int a341 = 10;
	 int a164  = 32;
	 int a89 = 8;
	 int a125 = 10;
	 int a330  = 36;
	 int a91 = 8;
	 int cf = 1;
	 int a52 = 6;
	 int a175  = 36;
	 int a103  = 35;
	 int a123 = 1;
	 int a270 = 0;
	 int a160 = 9;
	 int a374 = 1;
	 int a81 = 1;
	 int a107 = 2;
	 int a66 = 1;
	 int a29 = 10;
	 int a351  = 36;
	 int a215  = 35;
	 int a41 = 0;
	 int a369 = 3;
	 int a243 = 0;
	 int a240 = 0;
	 int a230 = 0;
	 int a188  = 36;
	 int a150 = 1;
	 int a276  = 36;
	 int a185  = 32;
	 int a151 = 0;
	 int a172 = 10;
	 int a391 = 1;
	 int a238  = 33;
	 int a187  = 36;
	 int a34 = 0;
	 int a51 = 1;
	 int a20  = 34;
	 int a209  = 36;
	 int a93  = 33;
	 int a139 = 1;
	 int a82 = 0;
	 int a59 = 13;
	 int a235  = 35;
	 int a282 = 1;
	 int a114 = 0;
	 int a117  = 36;
	 int a380 = 1;
	 int a80 = 6;
	 int a98 = 16;
	 int a269 = 7;
	 int a127 = 9;
	 int a367 = 8;
	 int a154 = 0;
	 int a241  = 32;
	 int a344 = 0;
	 int a83 = 1;
	 int a141 = 0;
	 int a56  = 34;
	 int a7 = 11;
	 int a8  = 35;
	 int a318 = 1;
	 int a202 = 8;
	 int a197 = 1;
	 int a384  = 35;
	 int a274 = 12;
	 int a280 = 1;
	 int a35  = 33;
	 int a135 = 9;
	 int a193  = 35;
	 int a90 = 0;
	 int a96 = 0;
	 int a234 = 0;
	 int a353 = 1;
	 int a38 = 1;
	 int a383 = 13;
	 int a110  = 35;
	 int a116 = 1;
	 int a258  = 33;
	 int a118 = 1;
	 int a28  = 35;
	 int a5  = 33;
	 int a370 = 1;
	 int a288 = 1;
	 int a278  = 32;
	 int a92 = 10;
	 int a321 = 1;
	 int a131 = 14;
	 int a67 = 13;
	 int a10 = 0;
	 int a271 = 8;
	 int a54 = 7;
	 int a61 = 11;
	 int a350 = 1;
	 int a189 = 0;
	 int a158  = 34;
	 int a324 = 1;
	 int a180 = 1;
	 int a122 = 3;
	 int a379 = 0;
	 int a194  = 36;
	 int a6 = 0;
	 int a248 = 0;
	 int a279  = 33;
	 int a312  = 32;
	 int a224  = 35;
	 int a400 = 1;
	 int a345 = 0;
	 int a157 = 11;
	 int a204 = 14;
	 int a149 = 10;
	 int a356  = 35;


	void errorCheck() {
	    if(((((a38==4) && (a74==10)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 0: assert(!//error_ 0);
	    }
	    if(((((a44!=1) && (a135==15)) && (a6==1)) && (a54==6))){
	    cf = (0);
	    //error_ 1: assert(!//error_ 1);
	    }
	    if(((((a194==33) && (a23==6)) && (a160==11)) && (a54==7))){
	    cf = (0);
	    //error_ 2: assert(!//error_ 2);
	    }
	    if(((((a234!=1) && (a367==3)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 3: assert(!//error_ 3);
	    }
	    if(((((a367==8) && (a161==33)) && (a235==36)) && (a54==5))){
	    cf = (0);
	    //error_ 4: assert(!//error_ 4);
	    }
	    if(((((a98==9) && (a116!=1)) && (a235==33)) && (a54==5))){
	    cf = (0);
	    //error_ 5: assert(!//error_ 5);
	    }
	    if(((((a157==10) && (a243!=1)) && (a61==4)) && (a54==10))){
	    cf = (0);
	    //error_ 6: assert(!//error_ 6);
	    }
	    if(((((a91==14) && (a139==1)) && (a61==9)) && (a54==10))){
	    cf = (0);
	    //error_ 7: assert(!//error_ 7);
	    }
	    if(((((a29==10) && (a135==10)) && (a6==1)) && (a54==6))){
	    cf = (0);
	    //error_ 8: assert(!//error_ 8);
	    }
	    if(((((a282==1) && (a161==32)) && (a235==36)) && (a54==5))){
	    cf = (0);
	    //error_ 9: assert(!//error_ 9);
	    }
	    if(((((a157==13) && (a243!=1)) && (a61==4)) && (a54==10))){
	    cf = (0);
	    //error_ 10: assert(!//error_ 10);
	    }
	    if(((((a38==5) && (a90==1)) && (a230==1)) && (a54==4))){
	    cf = (0);
	    //error_ 11: assert(!//error_ 11);
	    }
	    if(((((a123!=1) && (a194==36)) && (a303==33)) && (a54==11))){
	    cf = (0);
	    //error_ 12: assert(!//error_ 12);
	    }
	    if(((((a280==1) && (a367==7)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 13: assert(!//error_ 13);
	    }
	    if(((((a330==33) && (a279==35)) && (a6!=1)) && (a54==6))){
	    cf = (0);
	    //error_ 14: assert(!//error_ 14);
	    }
	    if(((((a232==1) && (a350!=1)) && (a160==10)) && (a54==7))){
	    cf = (0);
	    //error_ 15: assert(!//error_ 15);
	    }
	    if(((((a59==8) && (a90!=1)) && (a230==1)) && (a54==4))){
	    cf = (0);
	    //error_ 16: assert(!//error_ 16);
	    }
	    if(((((a224==34) && (a258==36)) && (a303==35)) && (a54==11))){
	    cf = (0);
	    //error_ 17: assert(!//error_ 17);
	    }
	    if(((((a8==35) && (a279==32)) && (a6!=1)) && (a54==6))){
	    cf = (0);
	    //error_ 18: assert(!//error_ 18);
	    }
	    if(((((a121==8) && (a367==1)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 19: assert(!//error_ 19);
	    }
	    if(((((a86==36) && (a161==35)) && (a160==12)) && (a54==7))){
	    cf = (0);
	    //error_ 20: assert(!//error_ 20);
	    }
	    if(((((a157==14) && (a188==35)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 21: assert(!//error_ 21);
	    }
	    if(((((a382==35) && (a139!=1)) && (a61==9)) && (a54==10))){
	    cf = (0);
	    //error_ 22: assert(!//error_ 22);
	    }
	    if(((((a38==6) && (a74==10)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 23: assert(!//error_ 23);
	    }
	    if(((((a157==12) && (a188==35)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 24: assert(!//error_ 24);
	    }
	    if(((((a175==34) && (a313==7)) && (a82!=1)) && (a54==9))){
	    cf = (0);
	    //error_ 25: assert(!//error_ 25);
	    }
	    if(((((a289==36) && (a313==5)) && (a61==11)) && (a54==10))){
	    cf = (0);
	    //error_ 26: assert(!//error_ 26);
	    }
	    if(((((a42==16) && (a313==7)) && (a61==11)) && (a54==10))){
	    cf = (0);
	    //error_ 27: assert(!//error_ 27);
	    }
	    if(((((a180!=1) && (a258==32)) && (a303==35)) && (a54==11))){
	    cf = (0);
	    //error_ 28: assert(!//error_ 28);
	    }
	    if(((((a271==12) && (a74==9)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 29: assert(!//error_ 29);
	    }
	    if(((((a193==36) && (a383==7)) && (a61==10)) && (a54==10))){
	    cf = (0);
	    //error_ 30: assert(!//error_ 30);
	    }
	    if(((((a93==35) && (a149==8)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 31: assert(!//error_ 31);
	    }
	    if(((((a122==10) && (a149==4)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 32: assert(!//error_ 32);
	    }
	    if(((((a56==33) && (a35==35)) && (a160==9)) && (a54==7))){
	    cf = (0);
	    //error_ 33: assert(!//error_ 33);
	    }
	    if(((((a5==35) && (a125==9)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 34: assert(!//error_ 34);
	    }
	    if(((((a180==1) && (a274==10)) && (a61==5)) && (a54==10))){
	    cf = (0);
	    //error_ 35: assert(!//error_ 35);
	    }
	    if(((((a330==36) && (a279==35)) && (a6!=1)) && (a54==6))){
	    cf = (0);
	    //error_ 36: assert(!//error_ 36);
	    }
	    if(((((a187==33) && (a125==10)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 37: assert(!//error_ 37);
	    }
	    if(((((a320==7) && (a279==33)) && (a6!=1)) && (a54==6))){
	    cf = (0);
	    //error_ 38: assert(!//error_ 38);
	    }
	    if(((((a38==6) && (a125==7)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 39: assert(!//error_ 39);
	    }
	    if(((((a204==14) && (a212==32)) && (a370==1)) && (a54==8))){
	    cf = (0);
	    //error_ 40: assert(!//error_ 40);
	    }
	    if(((((a199==3) && (a383==10)) && (a61==10)) && (a54==10))){
	    cf = (0);
	    //error_ 41: assert(!//error_ 41);
	    }
	    if(((((a254==6) && (a149==10)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 42: assert(!//error_ 42);
	    }
	    if(((((a38==1) && (a74==10)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 43: assert(!//error_ 43);
	    }
	    if(((((a28==34) && (a212==35)) && (a370==1)) && (a54==8))){
	    cf = (0);
	    //error_ 44: assert(!//error_ 44);
	    }
	    if(((((a7==14) && (a240==1)) && (a303==36)) && (a54==11))){
	    cf = (0);
	    //error_ 45: assert(!//error_ 45);
	    }
	    if(((((a194==35) && (a23==6)) && (a160==11)) && (a54==7))){
	    cf = (0);
	    //error_ 46: assert(!//error_ 46);
	    }
	    if(((((a204==11) && (a212==32)) && (a370==1)) && (a54==8))){
	    cf = (0);
	    //error_ 47: assert(!//error_ 47);
	    }
	    if(((((a122==6) && (a149==4)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 48: assert(!//error_ 48);
	    }
	    if(((((a312==34) && (a164==34)) && (a303==32)) && (a54==11))){
	    cf = (0);
	    //error_ 49: assert(!//error_ 49);
	    }
	    if(((((a81==1) && (a151==1)) && (a370!=1)) && (a54==8))){
	    cf = (0);
	    //error_ 50: assert(!//error_ 50);
	    }
	    if(((((a318==6) && (a274==8)) && (a61==5)) && (a54==10))){
	    cf = (0);
	    //error_ 51: assert(!//error_ 51);
	    }
	    if(((((a93==35) && (a23==8)) && (a160==11)) && (a54==7))){
	    cf = (0);
	    //error_ 52: assert(!//error_ 52);
	    }
	    if(((((a183==1) && (a379==1)) && (a235==32)) && (a54==5))){
	    cf = (0);
	    //error_ 53: assert(!//error_ 53);
	    }
	    if(((((a341==11) && (a125==5)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 54: assert(!//error_ 54);
	    }
	    if(((((a324==1) && (a121==9)) && (a303==34)) && (a54==11))){
	    cf = (0);
	    //error_ 55: assert(!//error_ 55);
	    }
	    if(((((a121==14) && (a367==1)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 56: assert(!//error_ 56);
	    }
	    if(((((a271==9) && (a74==9)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 57: assert(!//error_ 57);
	    }
	    if(((((a157==13) && (a188==35)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 58: assert(!//error_ 58);
	    }
	    if(((((a172==10) && (a161==36)) && (a235==36)) && (a54==5))){
	    cf = (0);
	    //error_ 59: assert(!//error_ 59);
	    }
	    if(((((a93==34) && (a149==8)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 60: assert(!//error_ 60);
	    }
	    if(((((a271==7) && (a74==9)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 61: assert(!//error_ 61);
	    }
	    if(((((a93==34) && (a23==8)) && (a160==11)) && (a54==7))){
	    cf = (0);
	    //error_ 62: assert(!//error_ 62);
	    }
	    if(((((a160==8) && (a345!=1)) && (a61==6)) && (a54==10))){
	    cf = (0);
	    //error_ 63: assert(!//error_ 63);
	    }
	    if(((((a276==35) && (a313==4)) && (a61==11)) && (a54==10))){
	    cf = (0);
	    //error_ 64: assert(!//error_ 64);
	    }
	    if(((((a121==9) && (a367==1)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 65: assert(!//error_ 65);
	    }
	    if(((((a122==8) && (a149==4)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 66: assert(!//error_ 66);
	    }
	    if(((((a38==7) && (a125==7)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 67: assert(!//error_ 67);
	    }
	    if(((((a194==36) && (a23==6)) && (a160==11)) && (a54==7))){
	    cf = (0);
	    //error_ 68: assert(!//error_ 68);
	    }
	    if(((((a374==1) && (a164==36)) && (a303==32)) && (a54==11))){
	    cf = (0);
	    //error_ 69: assert(!//error_ 69);
	    }
	    if(((((a356==35) && (a184!=1)) && (a235==35)) && (a54==5))){
	    cf = (0);
	    //error_ 70: assert(!//error_ 70);
	    }
	    if(((((a86==35) && (a379!=1)) && (a235==32)) && (a54==5))){
	    cf = (0);
	    //error_ 71: assert(!//error_ 71);
	    }
	    if(((((a81==1) && (a313==10)) && (a82!=1)) && (a54==9))){
	    cf = (0);
	    //error_ 72: assert(!//error_ 72);
	    }
	    if(((((a356==33) && (a184!=1)) && (a235==35)) && (a54==5))){
	    cf = (0);
	    //error_ 73: assert(!//error_ 73);
	    }
	    if(((((a52==7) && (a367==8)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 74: assert(!//error_ 74);
	    }
	    if(((((a172==8) && (a164==33)) && (a303==32)) && (a54==11))){
	    cf = (0);
	    //error_ 75: assert(!//error_ 75);
	    }
	    if(((((a29==16) && (a135==10)) && (a6==1)) && (a54==6))){
	    cf = (0);
	    //error_ 76: assert(!//error_ 76);
	    }
	    if(((((a400!=1) && (a367==4)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 77: assert(!//error_ 77);
	    }
	    if(((((a104==2) && (a161==36)) && (a160==12)) && (a54==7))){
	    cf = (0);
	    //error_ 78: assert(!//error_ 78);
	    }
	    if(((((a127==10) && (a74==8)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 79: assert(!//error_ 79);
	    }
	    if(((((a38==8) && (a90==1)) && (a230==1)) && (a54==4))){
	    cf = (0);
	    //error_ 80: assert(!//error_ 80);
	    }
	    if(((((a160==11) && (a345!=1)) && (a61==6)) && (a54==10))){
	    cf = (0);
	    //error_ 81: assert(!//error_ 81);
	    }
	    if(((((a86==34) && (a379!=1)) && (a235==32)) && (a54==5))){
	    cf = (0);
	    //error_ 82: assert(!//error_ 82);
	    }
	    if(((((a157==11) && (a188==35)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 83: assert(!//error_ 83);
	    }
	    if(((((a303==34) && (a125==4)) && (a82==1)) && (a54==9))){
	    cf = (0);
	    //error_ 84: assert(!//error_ 84);
	    }
	    if(((((a238==34) && (a274==12)) && (a61==5)) && (a54==10))){
	    cf = (0);
	    //error_ 85: assert(!//error_ 85);
	    }
	    if(((((a25==5) && (a114==1)) && (a61==7)) && (a54==10))){
	    cf = (0);
	    //error_ 86: assert(!//error_ 86);
	    }
	    if(((((a154==1) && (a74==12)) && (a160==8)) && (a54==7))){
	    cf = (0);
	    //error_ 87: assert(!//error_ 87);
	    }
	    if(((((a89==10) && (a258==35)) && (a303==35)) && (a54==11))){
	    cf = (0);
	    //error_ 88: assert(!//error_ 88);
	    }
	    if(((((a183==1) && (a212==33)) && (a370==1)) && (a54==8))){
	    cf = (0);
	    //error_ 89: assert(!//error_ 89);
	    }
	    if(((((a193==32) && (a383==7)) && (a61==10)) && (a54==10))){
	    cf = (0);
	    //error_ 90: assert(!//error_ 90);
	    }
	    if(((((a92==13) && (a149==3)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 91: assert(!//error_ 91);
	    }
	    if(((((a269==3) && (a274==9)) && (a61==5)) && (a54==10))){
	    cf = (0);
	    //error_ 92: assert(!//error_ 92);
	    }
	    if(((((a61==10) && (a188==36)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 93: assert(!//error_ 93);
	    }
	    if(((((a117==35) && (a149==7)) && (a235==34)) && (a54==5))){
	    cf = (0);
	    //error_ 94: assert(!//error_ 94);
	    }
	    if(((((a180==1) && (a258==32)) && (a303==35)) && (a54==11))){
	    cf = (0);
	    //error_ 95: assert(!//error_ 95);
	    }
	    if(((((a171==6) && (a121==10)) && (a303==34)) && (a54==11))){
	    cf = (0);
	    //error_ 96: assert(!//error_ 96);
	    }
	    if(((((a400==1) && (a367==4)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 97: assert(!//error_ 97);
	    }
	    if(((((a121==10) && (a367==1)) && (a160==13)) && (a54==7))){
	    cf = (0);
	    //error_ 98: assert(!//error_ 98);
	    }
	    if(((((a61==5) && (a188==36)) && (a160==7)) && (a54==7))){
	    cf = (0);
	    //error_ 99: assert(!//error_ 99);
	    }
	}
 void calculate_outputm2(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a92 = (11);
    	a313 = (5);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a150 = (0);
    	a243 = (1);
    	a61 = (4);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm3(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a235 = 36 ;
    	a367 = (1);
    	a161 = 33 ;
    	a54 = (5);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm4(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a248 = (0);
    	a23 = (4);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a271 = (5);
    	a74 = (9);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a271 = (5);
    	a74 = (9);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm1(int input) {
    if(((cf==1) && (a90==1))){
    	if(((cf==1) && (a38==6))){
    		calculate_outputm2(input);
    	} 
    } 
    if(((cf==1) && (a90!=1))){
    	if(((a59==11) && (cf==1))){
    		calculate_outputm3(input);
    	} 
    	if(((cf==1) && (a59==15))){
    		calculate_outputm4(input);
    	} 
    } 
} void calculate_outputm6(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a235 = 36 ;
    	a161 = 33 ;
    	a367 = (3);
    	a54 = (5);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm7(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	  printf("%d\n", 17);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a34 = (1);
    	a313 = (10);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm8(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a258 = 36 ;
    	a224 = 35 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 17);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a235 = 33 ;
    	a98 = (10);
    	a116 = (0);
    	a54 = (5);
    	  printf("%d\n", 25);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm5(int input) {
    if(((a83==1) && (cf==1))){
    	if(((cf==1) && (a369==3))){
    		calculate_outputm6(input);
    	} 
    	if(((a369==5) && (cf==1))){
    		calculate_outputm7(input);
    	} 
    	if(((a369==7) && (cf==1))){
    		calculate_outputm8(input);
    	} 
    } 
} void calculate_outputm10(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a384 = 36 ;
    	a135 = (13);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm11(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a278 = 32 ;
    	a383 = (6);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a202 = (8);
    	a118 = (0);
    	a160 = (14);
    	a54 = (7);
    	  printf("%d\n", 21);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a384 = 36 ;
    	a135 = (13);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm12(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a248 = (0);
    	a23 = (4);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm9(int input) {
    if(((a116==1) && (cf==1))){
    	if(((a369==3) && (cf==1))){
    		calculate_outputm10(input);
    	} 
    	if(((a369==4) && (cf==1))){
    		calculate_outputm11(input);
    	} 
    } 
    if(((cf==1) && (a116!=1))){
    	if(((cf==1) && (a98==10))){
    		calculate_outputm12(input);
    	} 
    } 
} void calculate_outputm14(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a161 = 32 ;
    	a204 = (15);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a199 = (8);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm13(int input) {
    if(((cf==1) && (a379!=1))){
    	if(((cf==1) && (a86==36))){
    		calculate_outputm14(input);
    	} 
    } 
} void calculate_outputm16(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a25 = (4);
    	a114 = (1);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm17(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a351 = 35 ;
    	a149 = (6);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a67 = (8);
    	a118 = (1);
    	a160 = (14);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a369 = (3);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a303 = 35 ;
    	a96 = (1);
    	a258 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm18(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 34 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm19(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm20(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a171 = (9);
    	a149 = (5);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a254 = (7);
    	a149 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a59 = (11);
    	a90 = (0);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm21(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a131 = (11);
    	a303 = 33 ;
    	a194 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a391 = (1);
    	a121 = (13);
    	a303 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm22(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a103 = 35 ;
    	a313 = (11);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a288 = (0);
    	a274 = (13);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm23(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a28 = 36 ;
    	a212 = 35 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a92 = (15);
    	a149 = (3);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a5 = 36 ;
    	a125 = (9);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm24(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a303 = 36 ;
    	a7 = (9);
    	a240 = (1);
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a258 = 35 ;
    	a303 = 35 ;
    	a89 = (11);
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm15(int input) {
    if(((a149==3) && (cf==1))){
    	if(((cf==1) && (a92==15))){
    		calculate_outputm16(input);
    	} 
    } 
    if(((a149==4) && (cf==1))){
    	if(((a122==9) && (cf==1))){
    		calculate_outputm17(input);
    	} 
    } 
    if(((a149==5) && (cf==1))){
    	if(((a171==9) && (cf==1))){
    		calculate_outputm18(input);
    	} 
    	if(((a171==12) && (cf==1))){
    		calculate_outputm19(input);
    	} 
    } 
    if(((a149==6) && (cf==1))){
    	if(((a351==33) && (cf==1))){
    		calculate_outputm20(input);
    	} 
    	if(((a351==35) && (cf==1))){
    		calculate_outputm21(input);
    	} 
    } 
    if(((cf==1) && (a149==8))){
    	if(((cf==1) && (a93==33))){
    		calculate_outputm22(input);
    	} 
    } 
    if(((cf==1) && (a149==9))){
    	if(((a162!=1) && (cf==1))){
    		calculate_outputm23(input);
    	} 
    } 
    if(((a149==10) && (cf==1))){
    	if(((a254==7) && (cf==1))){
    		calculate_outputm24(input);
    	} 
    } 
} void calculate_outputm26(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a303 = 36 ;
    	a7 = (15);
    	a240 = (1);
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a320 = (10);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm27(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a81 = (0);
    	a151 = (1);
    	a370 = (0);
    	a54 = (8);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm28(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a189 = (0);
    	a303 = 33 ;
    	a194 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 19);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 36 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm29(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a38 = (5);
    	a74 = (10);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a279 = 33 ;
    	a320 = (11);
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 20);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a345 = (0);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm30(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a91 = (13);
    	a139 = (1);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a235 = 33 ;
    	a98 = (10);
    	a116 = (0);
    	  printf("%d\n", 17);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a224 = 35 ;
    	a258 = 36 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a44 = (0);
    	a135 = (15);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 5))){
    	 cf = (0);
    	a188 = 35 ;
    	a157 = (12);
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a172 = (4);
    	a164 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a320 = (7);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 22);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a35 = 35 ;
    	a56 = 33 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a235 = 32 ;
    	a86 = 35 ;
    	a379 = (0);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a187 = 33 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm31(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);

    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm32(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a160 = (7);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a303 = 34 ;
    	a125 = (6);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 36 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a215 = 36 ;
    	a188 = 34 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm25(int input) {
    if(((a161==33) && (cf==1))){
    	if(((a367==1) && (cf==1))){
    		calculate_outputm26(input);
    	} 
    	if(((a367==3) && (cf==1))){
    		calculate_outputm27(input);
    	} 
    	if(((cf==1) && (a367==4))){
    		calculate_outputm28(input);
    	} 
    } 
    if(((a161==34) && (cf==1))){
    	if(((a66==1) && (cf==1))){
    		calculate_outputm29(input);
    	} 
    	if(((cf==1) && (a66!=1))){
    		calculate_outputm30(input);
    	} 
    } 
    if(((a161==35) && (cf==1))){
    	if(((cf==1) && (a20==35))){
    		calculate_outputm31(input);
    	} 
    } 
    if(((cf==1) && (a161==36))){
    	if(((a172==3) && (cf==1))){
    		calculate_outputm32(input);
    	} 
    } 
} void calculate_outputm34(int input) {
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a164 = 34 ;
    	a303 = 32 ;
    	a312 = 36 ;
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a279 = 34 ;
    	a209 = 33 ;
    	a6 = (0);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm35(int input) {
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a303 = 32 ;
    	a164 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a161 = 34 ;
    	a345 = (0);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((input == 5) && (cf==1))){
    	 cf = (0);
    	a194 = 35 ;
    	a23 = (6);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a258 = 35 ;
    	a89 = (10);
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a303 = 32 ;
    	a232 = (0);
    	a164 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a157 = (11);
    	a188 = 35 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a289 = 36 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm36(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a110 = 36 ;
    	a35 = 33 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a35 = 33 ;
    	a110 = 32 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm37(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a96 = (1);
    	a258 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a330 = 32 ;
    	a279 = 35 ;
    	a6 = (0);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a202 = (8);
    	a118 = (0);
    	a160 = (14);
    	a54 = (7);
    	  printf("%d\n", 23);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a52 = (5);
    	a367 = (8);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm38(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a110 = 33 ;
    	a35 = 33 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a303 = 34 ;
    	a158 = 32 ;
    	a121 = (12);
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm39(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a321 = (1);
    	a151 = (0);
    	a370 = (0);
    	a54 = (8);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a312 = 32 ;
    	a303 = 32 ;
    	a164 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm40(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a7 = (9);
    	a303 = 36 ;
    	a240 = (1);
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a7 = (9);
    	a240 = (1);
    	a303 = 36 ;
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a351 = 33 ;
    	a149 = (6);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm33(int input) {
    if(((a135==8) && (cf==1))){
    	if(((cf==1) && (a172==5))){
    		calculate_outputm34(input);
    	} 
    	if(((a172==8) && (cf==1))){
    		calculate_outputm35(input);
    	} 
    	if(((cf==1) && (a172==9))){
    		calculate_outputm36(input);
    	} 
    } 
    if(((a135==9) && (cf==1))){
    	if(((a270==1) && (cf==1))){
    		calculate_outputm37(input);
    	} 
    } 
    if(((cf==1) && (a135==10))){
    	if(((cf==1) && (a29==11))){
    		calculate_outputm38(input);
    	} 
    } 
    if(((cf==1) && (a135==11))){
    	if(((a344!=1) && (cf==1))){
    		calculate_outputm39(input);
    	} 
    } 
    if(((cf==1) && (a135==13))){
    	if(((a384==36) && (cf==1))){
    		calculate_outputm40(input);
    	} 
    } 
} void calculate_outputm42(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a59 = (11);
    	a90 = (0);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 16);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 25);  
    } 
} void calculate_outputm43(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a141 = (0);
    	a313 = (8);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a276 = 34 ;
    	a313 = (4);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a279 = 34 ;
    	a209 = 36 ;
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a212 = 34 ;
    	a185 = 36 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm44(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a81 = (0);
    	a313 = (10);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm45(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm46(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a258 = 33 ;
    	a188 = 32 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a164 = 33 ;
    	a172 = (4);
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm47(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm48(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a367 = (4);
    	a161 = 33 ;
    	a235 = 36 ;
    	a54 = (5);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a42 = (11);
    	a313 = (7);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a172 = (3);
    	a235 = 36 ;
    	a161 = 36 ;
    	a54 = (5);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a235 = 36 ;
    	a161 = 34 ;
    	a66 = (1);
    	a54 = (5);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm49(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a96 = (0);
    	a258 = 34 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a96 = (0);
    	a303 = 35 ;
    	a258 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a212 = 35 ;
    	a28 = 32 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm50(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a52 = (5);
    	a367 = (8);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a41 = (1);
    	a383 = (11);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a104 = (3);
    	a161 = 36 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm41(int input) {
    if(((a279==33) && (cf==1))){
    	if(((cf==1) && (a320==10))){
    		calculate_outputm42(input);
    	} 
    	if(((cf==1) && (a320==11))){
    		calculate_outputm43(input);
    	} 
    	if(((a320==14) && (cf==1))){
    		calculate_outputm44(input);
    	} 
    } 
    if(((a279==32) && (cf==1))){
    	if(((cf==1) && (a8==32))){
    		calculate_outputm45(input);
    	} 
    } 
    if(((a279==34) && (cf==1))){
    	if(((a209==33) && (cf==1))){
    		calculate_outputm46(input);
    	} 
    	if(((cf==1) && (a209==35))){
    		calculate_outputm47(input);
    	} 
    	if(((cf==1) && (a209==36))){
    		calculate_outputm48(input);
    	} 
    } 
    if(((a279==35) && (cf==1))){
    	if(((a330==32) && (cf==1))){
    		calculate_outputm49(input);
    	} 
    } 
    if(((a279==36) && (cf==1))){
    	if(((a353==1) && (cf==1))){
    		calculate_outputm50(input);
    	} 
    } 
} void calculate_outputm52(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a171 = (12);
    	a149 = (5);
    	a235 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 19);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a161 = 32 ;
    	a204 = (10);
    	a160 = (12);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm53(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a161 = 34 ;
    	a345 = (0);
    	a160 = (12);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a235 = 34 ;
    	a171 = (12);
    	a149 = (5);
    	a54 = (5);
    	  printf("%d\n", 25);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a98 = (10);
    	a116 = (0);
    	a235 = 33 ;
    	a54 = (5);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm54(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a66 = (1);
    	a121 = (11);
    	a303 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a35 = 36 ;
    	a258 = 33 ;
    	a160 = (9);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm55(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a204 = (10);
    	a212 = 32 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (3);
    	a74 = (10);
    	a160 = (8);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a160 = (9);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a81 = (0);
    	a367 = (6);
    	a160 = (13);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm56(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a34 = (1);
    	a313 = (10);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm57(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a278 = 32 ;
    	a383 = (6);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (8);
    	a74 = (10);
    	a160 = (8);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm58(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a303 = 33 ;
    	a194 = 33 ;
    	a51 = (1);
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a194 = 32 ;
    	a350 = (1);
    	a160 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a171 = (8);
    	a121 = (10);
    	a303 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm51(int input) {
    if(((cf==1) && (a188==32))){
    	if(((a81!=1) && (cf==1))){
    		calculate_outputm52(input);
    	} 
    } 
    if(((cf==1) && (a188==34))){
    	if(((cf==1) && (a215==33))){
    		calculate_outputm53(input);
    	} 
    	if(((a215==34) && (cf==1))){
    		calculate_outputm54(input);
    	} 
    	if(((a215==35) && (cf==1))){
    		calculate_outputm55(input);
    	} 
    	if(((cf==1) && (a215==36))){
    		calculate_outputm56(input);
    	} 
    } 
    if(((a188==35) && (cf==1))){
    	if(((a157==8) && (cf==1))){
    		calculate_outputm57(input);
    	} 
    } 
    if(((a188==36) && (cf==1))){
    	if(((cf==1) && (a61==9))){
    		calculate_outputm58(input);
    	} 
    } 
} void calculate_outputm60(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a164 = 33 ;
    	a172 = (4);
    	a303 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm61(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a248 = (0);
    	a23 = (4);
    	a160 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm62(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a303 = 34 ;
    	a171 = (10);
    	a121 = (10);
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm63(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a80 = (12);
    	a74 = (11);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a224 = 36 ;
    	a303 = 35 ;
    	a258 = 36 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm64(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a199 = (7);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm65(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);

    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);

    	  printf("%d\n", 20);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm66(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 36 ;
    	a224 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm67(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a235 = 33 ;
    	a369 = (4);
    	a116 = (1);
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a5 = 33 ;
    	a125 = (9);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a258 = 32 ;
    	a313 = (11);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm68(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a91 = (13);
    	a139 = (1);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm69(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm70(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a241 = 32 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a160 = (7);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm59(int input) {
    if(((cf==1) && (a74==8))){
    	if(((a127==16) && (cf==1))){
    		calculate_outputm60(input);
    	} 
    } 
    if(((cf==1) && (a74==9))){
    	if(((cf==1) && (a271==5))){
    		calculate_outputm61(input);
    	} 
    	if(((a271==8) && (cf==1))){
    		calculate_outputm62(input);
    	} 
    } 
    if(((cf==1) && (a74==10))){
    	if(((a38==3) && (cf==1))){
    		calculate_outputm63(input);
    	} 
    	if(((a38==5) && (cf==1))){
    		calculate_outputm64(input);
    	} 
    	if(((a38==8) && (cf==1))){
    		calculate_outputm65(input);
    	} 
    } 
    if(((a74==11) && (cf==1))){
    	if(((cf==1) && (a80==8))){
    		calculate_outputm66(input);
    	} 
    	if(((a80==11) && (cf==1))){
    		calculate_outputm67(input);
    	} 
    	if(((a80==12) && (cf==1))){
    		calculate_outputm68(input);
    	} 
    } 
    if(((cf==1) && (a74==12))){
    	if(((a154!=1) && (cf==1))){
    		calculate_outputm69(input);
    	} 
    } 
    if(((a74==14) && (cf==1))){
    	if(((cf==1) && (a10!=1))){
    		calculate_outputm70(input);
    	} 
    } 
} void calculate_outputm72(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a41 = (1);
    	a383 = (11);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a154 = (0);
    	a74 = (12);
    	a160 = (8);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a29 = (11);
    	a135 = (10);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm73(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm74(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a224 = 33 ;
    	a258 = 36 ;
    	a54 = (11);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a86 = 36 ;
    	a235 = 32 ;
    	a379 = (0);
    	a54 = (5);
    	  printf("%d\n", 26);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a125 = (10);
    	a164 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((input == 5) && (cf==1))){
    	 cf = (0);
    	a38 = (8);
    	a125 = (7);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 26);  
    } 
} void calculate_outputm75(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a172 = (9);
    	a135 = (8);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	  printf("%d\n", 17);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a303 = 36 ;
    	a7 = (15);
    	a240 = (1);
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm76(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a199 = (7);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm77(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a160 = (10);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a175 = 33 ;
    	a313 = (7);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a162 = (0);
    	a235 = 34 ;
    	a149 = (9);
    	a54 = (5);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm78(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a269 = (8);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm79(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a41 = (1);
    	a383 = (11);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a91 = (13);
    	a139 = (1);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a303 = 34 ;
    	a171 = (10);
    	a121 = (10);
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm80(int input) {
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a258 = 36 ;
    	a313 = (11);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 20);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a114 = (0);
    	a23 = (9);
    	a160 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a172 = (5);
    	a135 = (8);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm71(int input) {
    if(((cf==1) && (a35==33))){
    	if(((a110==33) && (cf==1))){
    		calculate_outputm72(input);
    	} 
    	if(((cf==1) && (a110==32))){
    		calculate_outputm73(input);
    	} 
    	if(((a110==35) && (cf==1))){
    		calculate_outputm74(input);
    	} 
    	if(((a110==36) && (cf==1))){
    		calculate_outputm75(input);
    	} 
    } 
    if(((cf==1) && (a35==32))){
    	if(((cf==1) && (a224==33))){
    		calculate_outputm76(input);
    	} 
    } 
    if(((cf==1) && (a35==35))){
    	if(((a56==34) && (cf==1))){
    		calculate_outputm77(input);
    	} 
    } 
    if(((cf==1) && (a35==36))){
    	if(((cf==1) && (a258==33))){
    		calculate_outputm78(input);
    	} 
    	if(((cf==1) && (a258==32))){
    		calculate_outputm79(input);
    	} 
    	if(((a258==34) && (cf==1))){
    		calculate_outputm80(input);
    	} 
    } 
} void calculate_outputm82(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a224 = 35 ;
    	a23 = (7);
    	a160 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a369 = (5);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm83(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a25 = (4);
    	a114 = (1);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a202 = (8);
    	a118 = (0);
    	a160 = (14);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm84(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a61 = (9);
    	a188 = 36 ;
    	a160 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a172 = (9);
    	a135 = (8);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm81(int input) {
    if(((cf==1) && (a350==1))){
    	if(((cf==1) && (a194==32))){
    		calculate_outputm82(input);
    	} 
    	if(((cf==1) && (a194==36))){
    		calculate_outputm83(input);
    	} 
    } 
    if(((cf==1) && (a350!=1))){
    	if(((cf==1) && (a232!=1))){
    		calculate_outputm84(input);
    	} 
    } 
} void calculate_outputm86(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a269 = (2);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm87(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a204 = (10);
    	a161 = 32 ;
    	a160 = (12);
    	  printf("%d\n", 22);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a204 = (10);
    	a161 = 32 ;
    	a160 = (12);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a278 = 32 ;
    	a383 = (6);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a345 = (0);
    	a161 = 34 ;
    	a160 = (12);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm88(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a320 = (10);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 19);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm89(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a235 = 34 ;
    	a254 = (7);
    	a149 = (10);
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a254 = (7);
    	a149 = (10);
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
} void calculate_outputm90(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm91(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (8);
    	a74 = (10);
    	a160 = (8);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a7 = (13);
    	a303 = 36 ;
    	a240 = (1);
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a303 = 35 ;
    	a188 = 32 ;
    	a258 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a154 = (0);
    	a74 = (12);
    	a160 = (8);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm85(int input) {
    if(((a23==4) && (cf==1))){
    	if(((a248!=1) && (cf==1))){
    		calculate_outputm86(input);
    	} 
    } 
    if(((cf==1) && (a23==7))){
    	if(((cf==1) && (a224==33))){
    		calculate_outputm87(input);
    	} 
    	if(((a224==34) && (cf==1))){
    		calculate_outputm88(input);
    	} 
    	if(((cf==1) && (a224==35))){
    		calculate_outputm89(input);
    	} 
    	if(((cf==1) && (a224==36))){
    		calculate_outputm90(input);
    	} 
    } 
    if(((cf==1) && (a23==9))){
    	if(((cf==1) && (a114!=1))){
    		calculate_outputm91(input);
    	} 
    } 
} void calculate_outputm93(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm94(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a122 = (9);
    	a149 = (4);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 35 ;
    	a160 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a56 = 34 ;
    	a35 = 35 ;
    	a160 = (9);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm95(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a258 = 34 ;
    	a96 = (0);
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a96 = (0);
    	a258 = 34 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm96(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a374 = (1);
    	a164 = 36 ;
    	a303 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 36 ;
    	a224 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a318 = (6);
    	a274 = (8);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((input == 5) && (cf==1))){
    	 cf = (0);
    	a122 = (10);
    	a149 = (4);
    	a235 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a197 = (1);
    	a313 = (6);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 18);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a188 = 36 ;
    	a61 = (10);
    	a160 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a154 = (1);
    	a74 = (12);
    	a160 = (8);
    	  printf("%d\n", 20);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a127 = (10);
    	a74 = (8);
    	a160 = (8);
    	  printf("%d\n", 22);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a164 = 34 ;
    	a312 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm97(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);

    	  printf("%d\n", 17);  
    } 
} void calculate_outputm98(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a164 = 33 ;
    	a172 = (4);
    	a303 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 16);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a52 = (5);
    	a367 = (8);
    	a160 = (13);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a320 = (11);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm92(int input) {
    if(((cf==1) && (a161==32))){
    	if(((a204==10) && (cf==1))){
    		calculate_outputm93(input);
    	} 
    	if(((cf==1) && (a204==15))){
    		calculate_outputm94(input);
    	} 
    } 
    if(((a161==34) && (cf==1))){
    	if(((a345!=1) && (cf==1))){
    		calculate_outputm95(input);
    	} 
    } 
    if(((a161==35) && (cf==1))){
    	if(((a86==33) && (cf==1))){
    		calculate_outputm96(input);
    	} 
    } 
    if(((a161==36) && (cf==1))){
    	if(((cf==1) && (a104==3))){
    		calculate_outputm97(input);
    	} 
    	if(((cf==1) && (a104==6))){
    		calculate_outputm98(input);
    	} 
    } 
} void calculate_outputm100(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 34 ;
    	a96 = (0);
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a212 = 35 ;
    	a28 = 32 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 18);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a28 = 32 ;
    	a212 = 35 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a258 = 34 ;
    	a96 = (0);
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm101(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a241 = 32 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a160 = (7);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm102(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a269 = (7);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm103(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 34 ;
    	a96 = (0);
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm99(int input) {
    if(((a367==1) && (cf==1))){
    	if(((cf==1) && (a121==12))){
    		calculate_outputm100(input);
    	} 
    	if(((a121==13) && (cf==1))){
    		calculate_outputm101(input);
    	} 
    } 
    if(((cf==1) && (a367==6))){
    	if(((a81!=1) && (cf==1))){
    		calculate_outputm102(input);
    	} 
    } 
    if(((a367==8) && (cf==1))){
    	if(((cf==1) && (a52==5))){
    		calculate_outputm103(input);
    	} 
    } 
} void calculate_outputm105(int input) {
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 33 ;
    	a160 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a318 = (2);
    	a274 = (8);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a93 = 33 ;
    	a149 = (8);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a91 = (8);
    	a139 = (1);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm106(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a303 = 34 ;
    	a380 = (0);
    	a121 = (7);
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm107(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a92 = (11);
    	a313 = (5);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm104(int input) {
    if(((cf==1) && (a118==1))){
    	if(((a67==8) && (cf==1))){
    		calculate_outputm105(input);
    	} 
    	if(((a67==9) && (cf==1))){
    		calculate_outputm106(input);
    	} 
    } 
    if(((a118!=1) && (cf==1))){
    	if(((cf==1) && (a202==8))){
    		calculate_outputm107(input);
    	} 
    } 
} void calculate_outputm109(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a303 = 34 ;
    	a125 = (6);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 20);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a320 = (10);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm110(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a224 = 33 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a189 = (0);
    	a303 = 33 ;
    	a194 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm111(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a199 = (7);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a199 = (7);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm112(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a161 = 36 ;
    	a104 = (6);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a127 = (16);
    	a74 = (8);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm113(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a121 = (12);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a279 = 32 ;
    	a8 = 32 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a330 = 32 ;
    	a279 = 35 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 22);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a303 = 34 ;
    	a125 = (6);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm114(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a204 = (10);
    	a161 = 32 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 20);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a320 = (10);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm108(int input) {
    if(((a212==32) && (cf==1))){
    	if(((cf==1) && (a204==9))){
    		calculate_outputm109(input);
    	} 
    	if(((cf==1) && (a204==10))){
    		calculate_outputm110(input);
    	} 
    	if(((cf==1) && (a204==12))){
    		calculate_outputm111(input);
    	} 
    } 
    if(((cf==1) && (a212==34))){
    	if(((cf==1) && (a185==36))){
    		calculate_outputm112(input);
    	} 
    } 
    if(((a212==35) && (cf==1))){
    	if(((cf==1) && (a28==32))){
    		calculate_outputm113(input);
    	} 
    	if(((a28==36) && (cf==1))){
    		calculate_outputm114(input);
    	} 
    } 
} void calculate_outputm116(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a271 = (5);
    	a74 = (9);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a269 = (2);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm117(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a194 = 35 ;
    	a189 = (0);
    	a303 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a193 = 36 ;
    	a383 = (7);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a234 = (0);
    	a367 = (3);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a38 = (8);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a81 = (1);
    	a313 = (10);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 18);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a157 = (10);
    	a243 = (0);
    	a61 = (4);
    	a54 = (10);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a303 = 34 ;
    	a171 = (6);
    	a121 = (10);
    	a54 = (11);
    	  printf("%d\n", 16);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a194 = 36 ;
    	a123 = (0);
    	a303 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 24);  
    } 
    if(((input == 5) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a92 = (13);
    	a149 = (3);
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a121 = (14);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm115(int input) {
    if(((a151==1) && (cf==1))){
    	if(((cf==1) && (a81!=1))){
    		calculate_outputm116(input);
    	} 
    } 
    if(((a151!=1) && (cf==1))){
    	if(((cf==1) && (a321==1))){
    		calculate_outputm117(input);
    	} 
    } 
} void calculate_outputm119(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);

    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a96 = (0);
    	a258 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm120(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 25);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a188 = 34 ;
    	a215 = 36 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm121(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a96 = (0);
    	a258 = 34 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a107 = (7);
    	a345 = (1);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a271 = (5);
    	a74 = (9);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm122(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a38 = (5);
    	a74 = (10);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a224 = 33 ;
    	a35 = 32 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a212 = 32 ;
    	a204 = (12);
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm123(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a303 = 33 ;
    	a131 = (12);
    	a194 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm124(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a204 = (12);
    	a212 = 32 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm125(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a52 = (5);
    	a367 = (8);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a241 = 32 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm126(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a96 = (0);
    	a303 = 35 ;
    	a258 = 34 ;
    	a54 = (11);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
} void calculate_outputm118(int input) {
    if(((a125==6) && (cf==1))){
    	if(((a303==34) && (cf==1))){
    		calculate_outputm119(input);
    	} 
    } 
    if(((a125==7) && (cf==1))){
    	if(((a38==4) && (cf==1))){
    		calculate_outputm120(input);
    	} 
    	if(((a38==8) && (cf==1))){
    		calculate_outputm121(input);
    	} 
    } 
    if(((a125==8) && (cf==1))){
    	if(((cf==1) && (a199==7))){
    		calculate_outputm122(input);
    	} 
    	if(((cf==1) && (a199==8))){
    		calculate_outputm123(input);
    	} 
    } 
    if(((a125==9) && (cf==1))){
    	if(((a5==33) && (cf==1))){
    		calculate_outputm124(input);
    	} 
    	if(((a5==36) && (cf==1))){
    		calculate_outputm125(input);
    	} 
    } 
    if(((cf==1) && (a125==10))){
    	if(((cf==1) && (a187==36))){
    		calculate_outputm126(input);
    	} 
    } 
} void calculate_outputm128(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a194 = 36 ;
    	a350 = (1);
    	a160 = (10);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a160 = (14);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm129(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a382 = 32 ;
    	a139 = (0);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a121 = (12);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a384 = 36 ;
    	a135 = (13);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm130(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);

    	  printf("%d\n", 19);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm131(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a157 = (8);
    	a188 = 35 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 23);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a180 = (0);
    	a274 = (10);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a279 = 36 ;
    	a353 = (1);
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a258 = 36 ;
    	a224 = 32 ;
    	a303 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm132(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a171 = (12);
    	a149 = (5);
    	a235 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a204 = (10);
    	a161 = 32 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm133(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a369 = (5);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm134(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a29 = (11);
    	a135 = (10);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 22);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a199 = (6);
    	a383 = (10);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a344 = (0);
    	a135 = (11);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm135(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a20 = 35 ;
    	a161 = 35 ;
    	a235 = 36 ;
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a278 = 32 ;
    	a383 = (6);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm127(int input) {
    if(((cf==1) && (a313==5))){
    	if(((cf==1) && (a92==11))){
    		calculate_outputm128(input);
    	} 
    	if(((a92==13) && (cf==1))){
    		calculate_outputm129(input);
    	} 
    } 
    if(((a313==6) && (cf==1))){
    	if(((a197==1) && (cf==1))){
    		calculate_outputm130(input);
    	} 
    } 
    if(((cf==1) && (a313==7))){
    	if(((a175==33) && (cf==1))){
    		calculate_outputm131(input);
    	} 
    } 
    if(((a313==10) && (cf==1))){
    	if(((cf==1) && (a81!=1))){
    		calculate_outputm132(input);
    	} 
    } 
    if(((cf==1) && (a313==11))){
    	if(((a258==32) && (cf==1))){
    		calculate_outputm133(input);
    	} 
    	if(((a258==35) && (cf==1))){
    		calculate_outputm134(input);
    	} 
    	if(((a258==36) && (cf==1))){
    		calculate_outputm135(input);
    	} 
    } 
} void calculate_outputm137(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a121 = (13);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a258 = 32 ;
    	a35 = 36 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a125 = (9);
    	a303 = 32 ;
    	a164 = 35 ;
    	a54 = (11);
    	  printf("%d\n", 19);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 33 ;
    	a188 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm136(int input) {
    if(((cf==1) && (a243==1))){
    	if(((cf==1) && (a150!=1))){
    		calculate_outputm137(input);
    	} 
    } 
} void calculate_outputm139(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
} void calculate_outputm140(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a189 = (0);
    	a194 = 35 ;
    	a303 = 33 ;
    	a54 = (11);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a122 = (9);
    	a235 = 34 ;
    	a149 = (4);
    	a54 = (5);
    	  printf("%d\n", 17);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a161 = 32 ;
    	a204 = (10);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm141(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a81 = (0);
    	a151 = (1);
    	a370 = (0);
    	a54 = (8);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a59 = (15);
    	a90 = (0);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 24);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a98 = (10);
    	a235 = 33 ;
    	a116 = (0);
    	a54 = (5);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm142(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm143(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a269 = (8);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a59 = (15);
    	a90 = (0);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm144(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm145(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a241 = 32 ;
    	a114 = (0);
    	a61 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a235 = 32 ;
    	a86 = 36 ;
    	a379 = (0);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a91 = (13);
    	a139 = (1);
    	a61 = (9);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a303 = 32 ;
    	a232 = (0);
    	a164 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm146(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a25 = (6);
    	a114 = (1);
    	a61 = (7);
    	  printf("%d\n", 23);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a28 = 32 ;
    	a212 = 35 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 18);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a80 = (8);
    	a74 = (11);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm147(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm148(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a150 = (0);
    	a243 = (1);
    	a61 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a150 = (0);
    	a243 = (1);
    	a61 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a150 = (0);
    	a243 = (1);
    	a61 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm138(int input) {
    if(((cf==1) && (a274==8))){
    	if(((a318==0) && (cf==1))){
    		calculate_outputm139(input);
    	} 
    	if(((a318==2) && (cf==1))){
    		calculate_outputm140(input);
    	} 
    } 
    if(((cf==1) && (a274==9))){
    	if(((a269==2) && (cf==1))){
    		calculate_outputm141(input);
    	} 
    	if(((cf==1) && (a269==4))){
    		calculate_outputm142(input);
    	} 
    	if(((cf==1) && (a269==7))){
    		calculate_outputm143(input);
    	} 
    	if(((cf==1) && (a269==8))){
    		calculate_outputm144(input);
    	} 
    } 
    if(((cf==1) && (a274==10))){
    	if(((cf==1) && (a180!=1))){
    		calculate_outputm145(input);
    	} 
    } 
    if(((a274==11) && (cf==1))){
    	if(((a185==35) && (cf==1))){
    		calculate_outputm146(input);
    	} 
    } 
    if(((a274==12) && (cf==1))){
    	if(((a238==32) && (cf==1))){
    		calculate_outputm147(input);
    	} 
    } 
    if(((cf==1) && (a274==13))){
    	if(((cf==1) && (a288!=1))){
    		calculate_outputm148(input);
    	} 
    } 
} void calculate_outputm150(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a35 = 36 ;
    	a258 = 34 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a133 = (0);
    	a359 = (1);
    	a61 = (8);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm151(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a121 = (13);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a121 = (13);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);

    	  printf("%d\n", 24);  
    } 
} void calculate_outputm152(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a194 = 32 ;
    	a303 = 33 ;
    	a131 = (15);
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm153(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a38 = (4);
    	a125 = (7);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a369 = (3);
    	a116 = (1);
    	a235 = 33 ;
    	a54 = (5);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm154(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a104 = (3);
    	a161 = 36 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm149(int input) {
    if(((cf==1) && (a345==1))){
    	if(((a107==7) && (cf==1))){
    		calculate_outputm150(input);
    	} 
    } 
    if(((a345!=1) && (cf==1))){
    	if(((a160==7) && (cf==1))){
    		calculate_outputm151(input);
    	} 
    	if(((a160==9) && (cf==1))){
    		calculate_outputm152(input);
    	} 
    	if(((a160==10) && (cf==1))){
    		calculate_outputm153(input);
    	} 
    	if(((cf==1) && (a160==14))){
    		calculate_outputm154(input);
    	} 
    } 
} void calculate_outputm156(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a194 = 36 ;
    	a350 = (1);
    	a160 = (10);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm157(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a52 = (5);
    	a367 = (8);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 25);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a161 = 34 ;
    	a345 = (0);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm158(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a121 = (13);
    	a367 = (1);
    	a160 = (13);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm159(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a209 = 35 ;
    	a279 = 34 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 24);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a81 = (0);
    	a188 = 32 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a199 = (7);
    	a125 = (8);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a34 = (1);
    	a313 = (10);
    	a61 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm155(int input) {
    if(((a114==1) && (cf==1))){
    	if(((cf==1) && (a25==4))){
    		calculate_outputm156(input);
    	} 
    	if(((cf==1) && (a25==6))){
    		calculate_outputm157(input);
    	} 
    } 
    if(((a114!=1) && (cf==1))){
    	if(((a241==32) && (cf==1))){
    		calculate_outputm158(input);
    	} 
    	if(((a241==36) && (cf==1))){
    		calculate_outputm159(input);
    	} 
    } 
} void calculate_outputm161(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a320 = (14);
    	a279 = 33 ;
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm160(int input) {
    if(((cf==1) && (a359==1))){
    	if(((cf==1) && (a133!=1))){
    		calculate_outputm161(input);
    	} 
    } 
} void calculate_outputm163(int input) {
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a98 = (10);
    	a116 = (0);
    	a235 = 33 ;
    	a54 = (5);
    	  printf("%d\n", 16);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a197 = (1);
    	a313 = (6);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a161 = 32 ;
    	a204 = (15);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm164(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a224 = 35 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a345 = (0);
    	a161 = 34 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a35 = 36 ;
    	a258 = 32 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a150 = (0);
    	a243 = (1);
    	a61 = (4);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm165(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a254 = (7);
    	a149 = (10);
    	a235 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a351 = 33 ;
    	a149 = (6);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a7 = (9);
    	a240 = (1);
    	a303 = 36 ;
    	a54 = (11);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm162(int input) {
    if(((cf==1) && (a139==1))){
    	if(((a91==8) && (cf==1))){
    		calculate_outputm163(input);
    	} 
    	if(((cf==1) && (a91==13))){
    		calculate_outputm164(input);
    	} 
    } 
    if(((a139!=1) && (cf==1))){
    	if(((cf==1) && (a382==32))){
    		calculate_outputm165(input);
    	} 
    } 
} void calculate_outputm167(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);

    	  printf("%d\n", 18);  
    } 
} void calculate_outputm168(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a238 = 32 ;
    	a274 = (12);
    	a61 = (5);
    	  printf("%d\n", 17);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a204 = (9);
    	a212 = 32 ;
    	a370 = (1);
    	a54 = (8);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm169(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a92 = (13);
    	a313 = (5);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a235 = 36 ;
    	a66 = (0);
    	a161 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 19);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a161 = 35 ;
    	a86 = 33 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a172 = (8);
    	a135 = (8);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm170(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a35 = 36 ;
    	a258 = 32 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 25);  
    } 
} void calculate_outputm171(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a258 = 35 ;
    	a313 = (11);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a279 = 33 ;
    	a320 = (11);
    	a6 = (0);
    	a54 = (6);
    	  printf("%d\n", 18);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a232 = (0);
    	a350 = (0);
    	a160 = (10);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a67 = (9);
    	a118 = (1);
    	a160 = (14);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm166(int input) {
    if(((cf==1) && (a383==6))){
    	if(((a278==32) && (cf==1))){
    		calculate_outputm167(input);
    	} 
    } 
    if(((a383==7) && (cf==1))){
    	if(((a193==35) && (cf==1))){
    		calculate_outputm168(input);
    	} 
    } 
    if(((a383==10) && (cf==1))){
    	if(((a199==6) && (cf==1))){
    		calculate_outputm169(input);
    	} 
    } 
    if(((a383==11) && (cf==1))){
    	if(((cf==1) && (a41==1))){
    		calculate_outputm170(input);
    	} 
    } 
    if(((a383==12) && (cf==1))){
    	if(((cf==1) && (a123==1))){
    		calculate_outputm171(input);
    	} 
    } 
} void calculate_outputm173(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a164 = 35 ;
    	a303 = 32 ;
    	a125 = (5);
    	a54 = (11);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm174(int input) {
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a254 = (7);
    	a149 = (10);
    	a235 = 34 ;
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm175(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a303 = 35 ;
    	a258 = 33 ;
    	a188 = 32 ;
    	a54 = (11);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm176(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a224 = 34 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a10 = (0);
    	a74 = (14);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm177(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a103 = 35 ;
    	a313 = (11);
    	  printf("%d\n", 23);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a215 = 36 ;
    	a188 = 34 ;
    	a160 = (7);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a369 = (5);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm178(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a241 = 36 ;
    	a114 = (0);
    	a61 = (7);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);

    	  printf("%d\n", 23);  
    } 
} void calculate_outputm172(int input) {
    if(((a313==4) && (cf==1))){
    	if(((cf==1) && (a276==34))){
    		calculate_outputm173(input);
    	} 
    } 
    if(((a313==5) && (cf==1))){
    	if(((cf==1) && (a289==32))){
    		calculate_outputm174(input);
    	} 
    } 
    if(((a313==7) && (cf==1))){
    	if(((a42==11) && (cf==1))){
    		calculate_outputm175(input);
    	} 
    } 
    if(((cf==1) && (a313==8))){
    	if(((cf==1) && (a141!=1))){
    		calculate_outputm176(input);
    	} 
    } 
    if(((cf==1) && (a313==10))){
    	if(((cf==1) && (a34==1))){
    		calculate_outputm177(input);
    	} 
    } 
    if(((cf==1) && (a313==11))){
    	if(((a103==35) && (cf==1))){
    		calculate_outputm178(input);
    	} 
    } 
} void calculate_outputm180(int input) {
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a241 = 32 ;
    	a114 = (0);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm181(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a160 = (7);
    	a345 = (0);
    	a61 = (6);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a258 = 36 ;
    	a303 = 35 ;
    	a224 = 35 ;
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm182(int input) {
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a193 = 35 ;
    	a383 = (7);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a80 = (11);
    	a74 = (11);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm183(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a258 = 33 ;
    	a303 = 35 ;
    	a188 = 32 ;
    	  printf("%d\n", 16);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a318 = (0);
    	a274 = (8);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm184(int input) {
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a204 = (15);
    	a161 = 32 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm179(int input) {
    if(((cf==1) && (a194==33))){
    	if(((a51==1) && (cf==1))){
    		calculate_outputm180(input);
    	} 
    } 
    if(((a194==32) && (cf==1))){
    	if(((a131==11) && (cf==1))){
    		calculate_outputm181(input);
    	} 
    	if(((a131==12) && (cf==1))){
    		calculate_outputm182(input);
    	} 
    	if(((cf==1) && (a131==15))){
    		calculate_outputm183(input);
    	} 
    } 
    if(((cf==1) && (a194==35))){
    	if(((a189!=1) && (cf==1))){
    		calculate_outputm184(input);
    	} 
    } 
} void calculate_outputm186(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a351 = 33 ;
    	a235 = 34 ;
    	a149 = (6);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm187(int input) {
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a303 = 36 ;
    	a7 = (9);
    	a240 = (1);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);

    	  printf("%d\n", 24);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a254 = (7);
    	a235 = 34 ;
    	a149 = (10);
    	a54 = (5);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm188(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a238 = 34 ;
    	a274 = (12);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
    if(((input == 5) && (cf==1))){
    	 cf = (0);
    	a183 = (1);
    	a235 = 32 ;
    	a379 = (1);
    	a54 = (5);
    	  printf("%d\n", 18);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a91 = (13);
    	a139 = (1);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a269 = (3);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a204 = (10);
    	a161 = 32 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 18);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a161 = 35 ;
    	a86 = 36 ;
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a38 = (6);
    	a125 = (7);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a98 = (9);
    	a235 = 33 ;
    	a116 = (0);
    	a54 = (5);
    	  printf("%d\n", 22);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 23);  
    } 
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a235 = 34 ;
    	a122 = (8);
    	a149 = (4);
    	a54 = (5);
    	  printf("%d\n", 22);  
    } 
} void calculate_outputm189(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a224 = 36 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm190(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a154 = (0);
    	a74 = (12);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 24);  
    } 
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a288 = (0);
    	a274 = (13);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm191(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a288 = (0);
    	a274 = (13);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a197 = (1);
    	a313 = (6);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm192(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a123 = (1);
    	a383 = (12);
    	a61 = (10);
    	a54 = (10);
    	  printf("%d\n", 23);  
    } 
} void calculate_outputm185(int input) {
    if(((a164==33) && (cf==1))){
    	if(((a172==4) && (cf==1))){
    		calculate_outputm186(input);
    	} 
    } 
    if(((a164==32) && (cf==1))){
    	if(((a232!=1) && (cf==1))){
    		calculate_outputm187(input);
    	} 
    } 
    if(((cf==1) && (a164==34))){
    	if(((a312==32) && (cf==1))){
    		calculate_outputm188(input);
    	} 
    	if(((cf==1) && (a312==36))){
    		calculate_outputm189(input);
    	} 
    } 
    if(((a164==35) && (cf==1))){
    	if(((cf==1) && (a125==5))){
    		calculate_outputm190(input);
    	} 
    	if(((a125==9) && (cf==1))){
    		calculate_outputm191(input);
    	} 
    	if(((a125==10) && (cf==1))){
    		calculate_outputm192(input);
    	} 
    } 
} void calculate_outputm194(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a276 = 33 ;
    	a121 = (8);
    	  printf("%d\n", 25);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a369 = (7);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 9))){
    	 cf = (0);
    	a271 = (8);
    	a74 = (9);
    	a160 = (8);
    	a54 = (7);
    	  printf("%d\n", 17);  
    } 
} void calculate_outputm195(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a382 = 32 ;
    	a139 = (0);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);

    	  printf("%d\n", 25);  
    } 
} void calculate_outputm196(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a25 = (4);
    	a114 = (1);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a25 = (4);
    	a114 = (1);
    	a61 = (7);
    	a54 = (10);
    	  printf("%d\n", 19);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);
    	a161 = 36 ;
    	a104 = (3);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 16);  
    } 
} void calculate_outputm197(int input) {
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a258 = 32 ;
    	a35 = 36 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a38 = (6);
    	a90 = (1);
    	a230 = (1);
    	a54 = (4);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a258 = 32 ;
    	a35 = 36 ;
    	a160 = (9);
    	a54 = (7);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm198(int input) {
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a369 = (5);
    	a83 = (1);
    	a230 = (0);
    	a54 = (4);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm199(int input) {
    if(((cf==1) && (input == 8))){
    	 cf = (0);
    	a258 = 35 ;
    	a313 = (11);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 17);  
    } 
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a29 = (11);
    	a135 = (10);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 18);  
    } 
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a29 = (11);
    	a135 = (10);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 16);  
    } 
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm200(int input) {
    if(((input == 6) && (cf==1))){
    	 cf = (0);
    	a161 = 35 ;
    	a235 = 36 ;
    	a20 = 35 ;
    	a54 = (5);
    	  printf("%d\n", 22);  
    } 
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a161 = 32 ;
    	a204 = (10);
    	a160 = (12);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a194 = 35 ;
    	a303 = 33 ;
    	a189 = (0);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm193(int input) {
    if(((a121==7) && (cf==1))){
    	if(((a380!=1) && (cf==1))){
    		calculate_outputm194(input);
    	} 
    } 
    if(((a121==8) && (cf==1))){
    	if(((cf==1) && (a276==33))){
    		calculate_outputm195(input);
    	} 
    } 
    if(((a121==10) && (cf==1))){
    	if(((a171==8) && (cf==1))){
    		calculate_outputm196(input);
    	} 
    	if(((a171==10) && (cf==1))){
    		calculate_outputm197(input);
    	} 
    } 
    if(((a121==11) && (cf==1))){
    	if(((cf==1) && (a66==1))){
    		calculate_outputm198(input);
    	} 
    } 
    if(((a121==12) && (cf==1))){
    	if(((a158==32) && (cf==1))){
    		calculate_outputm199(input);
    	} 
    } 
    if(((a121==13) && (cf==1))){
    	if(((cf==1) && (a391==1))){
    		calculate_outputm200(input);
    	} 
    } 
} void calculate_outputm202(int input) {
    if(((input == 3) && (cf==1))){
    	 cf = (0);
    	a269 = (8);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm203(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
} void calculate_outputm204(int input) {
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a270 = (1);
    	a135 = (9);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 25);  
    } 
} void calculate_outputm205(int input) {
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm206(int input) {
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a289 = 32 ;
    	a313 = (5);
    	a61 = (11);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
    if(((input == 10) && (cf==1))){
    	 cf = (0);
    	a318 = (0);
    	a274 = (8);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 22);  
    } 
    if(((input == 2) && (cf==1))){
    	 cf = (0);
    	a224 = 35 ;
    	a23 = (7);
    	a160 = (11);
    	a54 = (7);
    	  printf("%d\n", 19);  
    } 
} void calculate_outputm207(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a235 = 34 ;
    	a351 = 33 ;
    	a149 = (6);
    	a54 = (5);
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm208(int input) {
    if(((input == 4) && (cf==1))){
    	 cf = (0);
    	a189 = (0);
    	a194 = 35 ;
    	a303 = 33 ;
    	  printf("%d\n", 20);  
    } 
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a303 = 32 ;
    	a232 = (0);
    	a164 = 32 ;
    	  printf("%d\n", 20);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a172 = (4);
    	a303 = 32 ;
    	a164 = 33 ;
    	  printf("%d\n", 20);  
    } 
} void calculate_outputm209(int input) {
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a96 = (0);
    	a258 = 34 ;
    	  printf("%d\n", 25);  
    } 
    if(((cf==1) && (input == 7))){
    	 cf = (0);
    	a185 = 35 ;
    	a274 = (11);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
} void calculate_outputm210(int input) {
    if(((input == 1) && (cf==1))){
    	 cf = (0);
    	a303 = 34 ;
    	a171 = (10);
    	a121 = (10);
    	  printf("%d\n", 16);  
    } 
    if(((cf==1) && (input == 3))){
    	 cf = (0);
    	a7 = (15);
    	a240 = (1);
    	a303 = 36 ;
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm201(int input) {
    if(((cf==1) && (a258==33))){
    	if(((a188==33) && (cf==1))){
    		calculate_outputm202(input);
    	} 
    	if(((a188==32) && (cf==1))){
    		calculate_outputm203(input);
    	} 
    } 
    if(((a258==34) && (cf==1))){
    	if(((cf==1) && (a96==1))){
    		calculate_outputm204(input);
    	} 
    	if(((a96!=1) && (cf==1))){
    		calculate_outputm205(input);
    	} 
    } 
    if(((a258==35) && (cf==1))){
    	if(((a89==11) && (cf==1))){
    		calculate_outputm206(input);
    	} 
    } 
    if(((a258==36) && (cf==1))){
    	if(((cf==1) && (a224==33))){
    		calculate_outputm207(input);
    	} 
    	if(((a224==32) && (cf==1))){
    		calculate_outputm208(input);
    	} 
    	if(((cf==1) && (a224==35))){
    		calculate_outputm209(input);
    	} 
    	if(((a224==36) && (cf==1))){
    		calculate_outputm210(input);
    	} 
    } 
} void calculate_outputm212(int input) {
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a172 = (4);
    	a164 = 33 ;
    	  printf("%d\n", 21);  
    } 
    if(((cf==1) && (input == 6))){
    	 cf = (0);
    	a384 = 36 ;
    	a135 = (13);
    	a6 = (1);
    	a54 = (6);
    	  printf("%d\n", 18);  
    } 
    if(((input == 7) && (cf==1))){
    	 cf = (0);
    	a303 = 32 ;
    	a164 = 32 ;
    	a232 = (0);
    	  printf("%d\n", 24);  
    } 
    if(((cf==1) && (input == 1))){
    	 cf = (0);
    	a382 = 32 ;
    	a139 = (0);
    	a61 = (9);
    	a54 = (10);
    	  printf("%d\n", 21);  
    } 
} void calculate_outputm213(int input) {
    if(((cf==1) && (input == 4))){
    	 cf = (0);
    	a187 = 36 ;
    	a125 = (10);
    	a82 = (1);
    	a54 = (9);
    	  printf("%d\n", 24);  
    } 
} void calculate_outputm214(int input) {
    if(((cf==1) && (input == 10))){
    	 cf = (0);
    	a197 = (1);
    	a313 = (6);
    	a82 = (0);
    	a54 = (9);
    	  printf("%d\n", 18);  
    } 
    if(((input == 8) && (cf==1))){
    	 cf = (0);
    	a269 = (4);
    	a274 = (9);
    	a61 = (5);
    	a54 = (10);
    	  printf("%d\n", 17);  
    } 
    if(((cf==1) && (input == 2))){
    	 cf = (0);

    	  printf("%d\n", 22);  
    } 
    if(((input == 9) && (cf==1))){
    	 cf = (0);
    	a367 = (1);
    	a235 = 36 ;
    	a161 = 33 ;
    	a54 = (5);
    	  printf("%d\n", 18);  
    } 
} void calculate_outputm211(int input) {
    if(((a240==1) && (cf==1))){
    	if(((a7==9) && (cf==1))){
    		calculate_outputm212(input);
    	} 
    	if(((cf==1) && (a7==13))){
    		calculate_outputm213(input);
    	} 
    	if(((cf==1) && (a7==15))){
    		calculate_outputm214(input);
    	} 
    } 
}
 void calculate_output(int input) {
        cf = (1);

    if(((a54==4) && (cf==1))){
    	if(((cf==1) && (a230==1))){
    		calculate_outputm1(input);
    	} 
    	if(((cf==1) && (a230!=1))){
    		calculate_outputm5(input);
    	} 
    } 
    if(((cf==1) && (a54==5))){
    	if(((cf==1) && (a235==33))){
    		calculate_outputm9(input);
    	} 
    	if(((a235==32) && (cf==1))){
    		calculate_outputm13(input);
    	} 
    	if(((cf==1) && (a235==34))){
    		calculate_outputm15(input);
    	} 
    	if(((cf==1) && (a235==36))){
    		calculate_outputm25(input);
    	} 
    } 
    if(((cf==1) && (a54==6))){
    	if(((cf==1) && (a6==1))){
    		calculate_outputm33(input);
    	} 
    	if(((a6!=1) && (cf==1))){
    		calculate_outputm41(input);
    	} 
    } 
    if(((cf==1) && (a54==7))){
    	if(((cf==1) && (a160==7))){
    		calculate_outputm51(input);
    	} 
    	if(((a160==8) && (cf==1))){
    		calculate_outputm59(input);
    	} 
    	if(((cf==1) && (a160==9))){
    		calculate_outputm71(input);
    	} 
    	if(((cf==1) && (a160==10))){
    		calculate_outputm81(input);
    	} 
    	if(((a160==11) && (cf==1))){
    		calculate_outputm85(input);
    	} 
    	if(((cf==1) && (a160==12))){
    		calculate_outputm92(input);
    	} 
    	if(((a160==13) && (cf==1))){
    		calculate_outputm99(input);
    	} 
    	if(((a160==14) && (cf==1))){
    		calculate_outputm104(input);
    	} 
    } 
    if(((cf==1) && (a54==8))){
    	if(((a370==1) && (cf==1))){
    		calculate_outputm108(input);
    	} 
    	if(((a370!=1) && (cf==1))){
    		calculate_outputm115(input);
    	} 
    } 
    if(((a54==9) && (cf==1))){
    	if(((cf==1) && (a82==1))){
    		calculate_outputm118(input);
    	} 
    	if(((cf==1) && (a82!=1))){
    		calculate_outputm127(input);
    	} 
    } 
    if(((cf==1) && (a54==10))){
    	if(((cf==1) && (a61==4))){
    		calculate_outputm136(input);
    	} 
    	if(((a61==5) && (cf==1))){
    		calculate_outputm138(input);
    	} 
    	if(((cf==1) && (a61==6))){
    		calculate_outputm149(input);
    	} 
    	if(((a61==7) && (cf==1))){
    		calculate_outputm155(input);
    	} 
    	if(((a61==8) && (cf==1))){
    		calculate_outputm160(input);
    	} 
    	if(((cf==1) && (a61==9))){
    		calculate_outputm162(input);
    	} 
    	if(((a61==10) && (cf==1))){
    		calculate_outputm166(input);
    	} 
    	if(((cf==1) && (a61==11))){
    		calculate_outputm172(input);
    	} 
    } 
    if(((cf==1) && (a54==11))){
    	if(((a303==33) && (cf==1))){
    		calculate_outputm179(input);
    	} 
    	if(((a303==32) && (cf==1))){
    		calculate_outputm185(input);
    	} 
    	if(((a303==34) && (cf==1))){
    		calculate_outputm193(input);
    	} 
    	if(((a303==35) && (cf==1))){
    		calculate_outputm201(input);
    	} 
    	if(((a303==36) && (cf==1))){
    		calculate_outputm211(input);
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
          calculate_output(symb);
    }
    
 return 0;

}

