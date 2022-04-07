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
	int inputs[] = {2,5,3,1,4};

	 int a114 = 10;
	 int a36 = 11;
	 int a59 = 12;
	 int a107 = 10;
	 int a17 = 5;
	 int a84 = 3;
	 int a123 = 6;
	 int a73 = 7;
	 int a128 = 14;
	 int a152 = 6;
	 int a94 = 15;
	 int a74 = 9;
	 int a195 = 9;
	 int a61 = 7;
	 int a168 = 11;
	 int a117 = 6;
	 int a185 = 3;
	 int a163 = 3;
	 int a149 = 9;
	 int a23 = 4;
	 int a109 = 3;
	 int a89 = 6;
	 int a95 = 1;
	 int a58 = 13;
	 int a4 = 4;
	 int a180 = 13;
	 int a16 = 11;
	 int a150 = 14;
	 int a190 = 11;
	 int a41 = 1;
	 int a122 = 10;
	 int a164 = 8;
	 int a173 = 9;
	 int a105 = 2;
	 int cf = 1;
	 int a44 = 6;
	 int a33 = 15;
	 int a43 = 2;
	 int a200 = 12;
	 int a68 = 4;
	 int a144 = 8;
	 int a82 = 15;
	 int a102 = 11;
	 int a113 = 9;
	 int a45 = 14;
	 int a40 = 11;
	 int a91 = 12;
	 int a42 = 10;
	 int a21 = 9;
	 int a76 = 7;
	 int a39 = 11;
	 int a72 = 14;
	 int a64 = 5;
	 int a88 = 2;
	 int a151 = 1;
	 int a125 = 1;
	 int a86 = 1;
	 int a146 = 1;
	 int a197 = 3;
	 int a62 = 1;
	 int a56 = 1;
	 int a49 = 1;
	 int a182 = 1;
	 int a177 = 1;
	 int a83 = 2;
	 int a3 = 1;
	 int a50 = 1;
	 int a155 = 0;
	 int a160 = 1;
	 int a175 = 1;
	 int a171 = 1;
	 int a60 = 1;
	 int a158 = 1;
	 int a2 = 0;
	 int a157 = 1;
	 int a97 = 0;
	 int a170 = 1;
	 int a24 = 1;
	 int a29 = 2;
	 int a198 = 2;
	 int a162 = 3;
	 int a145 = 1;
	 int a51 = 1;
	 int a189 = 1;
	 int a108 = 1;
	 int a124 = 1;
	 int a141 = 1;


	void errorCheck() {
	    if((((a173==8) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_0: assert(!//error_0);
	    }
	    if((((a173==14) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_1: assert(!//error_1);
	    }
	    if((((a74==10) && (a72==8)) && (a33==8))){
	    cf = 0;
	    //error_2: assert(!//error_2);
	    }
	    if((((a150==13) && (a91==9)) && (a33==9))){
	    cf = 0;
	    //error_3: assert(!//error_3);
	    }
	    if((((a64==9) && (a128==15)) && (a33==11))){
	    cf = 0;
	    //error_4: assert(!//error_4);
	    }
	    if((((a73==12) && (a113==11)) && (a33==13))){
	    cf = 0;
	    //error_5: assert(!//error_5);
	    }
	    if((((a59==11) && (a113==6)) && (a33==13))){
	    cf = 0;
	    //error_6: assert(!//error_6);
	    }
	    if((((a144==11) && (a195==12)) && (a33==12))){
	    cf = 0;
	    //error_7: assert(!//error_7);
	    }
	    if((((a95==3) && (a128==9)) && (a33==11))){
	    cf = 0;
	    //error_8: assert(!//error_8);
	    }
	    if((((a190==10) && (a200==9)) && (a33==14))){
	    cf = 0;
	    //error_9: assert(!//error_9);
	    }
	    if((((a39==14) && (a91==10)) && (a33==9))){
	    cf = 0;
	    //error_10: assert(!//error_10);
	    }
	    if((((a105==6) && (a200==6)) && (a33==14))){
	    cf = 0;
	    //error_11: assert(!//error_11);
	    }
	    if((((a144==6) && (a195==12)) && (a33==12))){
	    cf = 0;
	    //error_12: assert(!//error_12);
	    }
	    if((((a107==5) && (a72==13)) && (a33==8))){
	    cf = 0;
	    //error_13: assert(!//error_13);
	    }
	    if((((a163==5) && (a200==13)) && (a33==14))){
	    cf = 0;
	    //error_14: assert(!//error_14);
	    }
	    if((((a123==4) && (a113==7)) && (a33==13))){
	    cf = 0;
	    //error_15: assert(!//error_15);
	    }
	    if((((a150==16) && (a91==9)) && (a33==9))){
	    cf = 0;
	    //error_16: assert(!//error_16);
	    }
	    if((((a72==14) && (a200==12)) && (a33==14))){
	    cf = 0;
	    //error_17: assert(!//error_17);
	    }
	    if((((a23==8) && (a72==9)) && (a33==8))){
	    cf = 0;
	    //error_18: assert(!//error_18);
	    }
	    if((((a42==8) && (a128==14)) && (a33==11))){
	    cf = 0;
	    //error_19: assert(!//error_19);
	    }
	    if((((a43==8) && (a200==7)) && (a33==14))){
	    cf = 0;
	    //error_20: assert(!//error_20);
	    }
	    if((((a68==9) && (a91==14)) && (a33==9))){
	    cf = 0;
	    //error_21: assert(!//error_21);
	    }
	    if((((a168==8) && (a200==11)) && (a33==14))){
	    cf = 0;
	    //error_22: assert(!//error_22);
	    }
	    if((((a17==4) && (a94==11)) && (a33==10))){
	    cf = 0;
	    //error_23: assert(!//error_23);
	    }
	    if((((a82==9) && (a94==13)) && (a33==10))){
	    cf = 0;
	    //error_24: assert(!//error_24);
	    }
	    if((((a164==10) && (a91==11)) && (a33==9))){
	    cf = 0;
	    //error_25: assert(!//error_25);
	    }
	    if((((a152==5) && (a195==9)) && (a33==12))){
	    cf = 0;
	    //error_26: assert(!//error_26);
	    }
	    if((((a4==3) && (a94==8)) && (a33==10))){
	    cf = 0;
	    //error_27: assert(!//error_27);
	    }
	    if((((a89==10) && (a91==12)) && (a33==9))){
	    cf = 0;
	    //error_28: assert(!//error_28);
	    }
	    if((((a68==10) && (a91==14)) && (a33==9))){
	    cf = 0;
	    //error_29: assert(!//error_29);
	    }
	    if((((a39==15) && (a91==10)) && (a33==9))){
	    cf = 0;
	    //error_30: assert(!//error_30);
	    }
	    if((((a173==10) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_31: assert(!//error_31);
	    }
	    if((((a72==11) && (a128==8)) && (a33==11))){
	    cf = 0;
	    //error_32: assert(!//error_32);
	    }
	    if((((a36==11) && (a128==12)) && (a33==11))){
	    cf = 0;
	    //error_33: assert(!//error_33);
	    }
	    if((((a95==2) && (a128==9)) && (a33==11))){
	    cf = 0;
	    //error_34: assert(!//error_34);
	    }
	    if((((a76==8) && (a91==8)) && (a33==9))){
	    cf = 0;
	    //error_35: assert(!//error_35);
	    }
	    if((((a144==4) && (a195==12)) && (a33==12))){
	    cf = 0;
	    //error_36: assert(!//error_36);
	    }
	    if((((a109==8) && (a72==10)) && (a33==8))){
	    cf = 0;
	    //error_37: assert(!//error_37);
	    }
	    if((((a163==7) && (a200==13)) && (a33==14))){
	    cf = 0;
	    //error_38: assert(!//error_38);
	    }
	    if((((a173==11) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_39: assert(!//error_39);
	    }
	    if((((a72==13) && (a128==8)) && (a33==11))){
	    cf = 0;
	    //error_40: assert(!//error_40);
	    }
	    if((((a68==6) && (a91==14)) && (a33==9))){
	    cf = 0;
	    //error_41: assert(!//error_41);
	    }
	    if((((a72==9) && (a128==8)) && (a33==11))){
	    cf = 0;
	    //error_42: assert(!//error_42);
	    }
	    if((((a149==9) && (a91==7)) && (a33==9))){
	    cf = 0;
	    //error_43: assert(!//error_43);
	    }
	    if((((a36==9) && (a128==12)) && (a33==11))){
	    cf = 0;
	    //error_44: assert(!//error_44);
	    }
	    if((((a122==6) && (a44==11)) && (a33==15))){
	    cf = 0;
	    //error_45: assert(!//error_45);
	    }
	    if((((a76==14) && (a72==12)) && (a33==8))){
	    cf = 0;
	    //error_46: assert(!//error_46);
	    }
	    if((((a185==6) && (a94==14)) && (a33==10))){
	    cf = 0;
	    //error_47: assert(!//error_47);
	    }
	    if((((a72==14) && (a128==8)) && (a33==11))){
	    cf = 0;
	    //error_48: assert(!//error_48);
	    }
	    if((((a72==11) && (a94==15)) && (a33==10))){
	    cf = 0;
	    //error_49: assert(!//error_49);
	    }
	    if((((a84==9) && (a72==11)) && (a33==8))){
	    cf = 0;
	    //error_50: assert(!//error_50);
	    }
	    if((((a102==12) && (a113==9)) && (a33==13))){
	    cf = 0;
	    //error_51: assert(!//error_51);
	    }
	    if((((a117==10) && (a44==8)) && (a33==15))){
	    cf = 0;
	    //error_52: assert(!//error_52);
	    }
	    if((((a76==12) && (a72==12)) && (a33==8))){
	    cf = 0;
	    //error_53: assert(!//error_53);
	    }
	    if((((a42==6) && (a128==14)) && (a33==11))){
	    cf = 0;
	    //error_54: assert(!//error_54);
	    }
	    if((((a122==7) && (a200==8)) && (a33==14))){
	    cf = 0;
	    //error_55: assert(!//error_55);
	    }
	    if((((a21==8) && (a94==12)) && (a33==10))){
	    cf = 0;
	    //error_56: assert(!//error_56);
	    }
	    if((((a73==14) && (a113==11)) && (a33==13))){
	    cf = 0;
	    //error_57: assert(!//error_57);
	    }
	    if((((a40==12) && (a195==11)) && (a33==12))){
	    cf = 0;
	    //error_58: assert(!//error_58);
	    }
	    if((((a109==2) && (a72==10)) && (a33==8))){
	    cf = 0;
	    //error_59: assert(!//error_59);
	    }
	    if((((a123==10) && (a113==7)) && (a33==13))){
	    cf = 0;
	    //error_60: assert(!//error_60);
	    }
	    if((((a173==7) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_61: assert(!//error_61);
	    }
	    if((((a59==13) && (a113==6)) && (a33==13))){
	    cf = 0;
	    //error_62: assert(!//error_62);
	    }
	    if((((a164==5) && (a91==11)) && (a33==9))){
	    cf = 0;
	    //error_63: assert(!//error_63);
	    }
	    if((((a164==8) && (a91==11)) && (a33==9))){
	    cf = 0;
	    //error_64: assert(!//error_64);
	    }
	    if((((a173==12) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_65: assert(!//error_65);
	    }
	    if((((a82==8) && (a91==13)) && (a33==9))){
	    cf = 0;
	    //error_66: assert(!//error_66);
	    }
	    if((((a42==12) && (a128==14)) && (a33==11))){
	    cf = 0;
	    //error_67: assert(!//error_67);
	    }
	    if((((a68==11) && (a91==14)) && (a33==9))){
	    cf = 0;
	    //error_68: assert(!//error_68);
	    }
	    if((((a109==6) && (a72==10)) && (a33==8))){
	    cf = 0;
	    //error_69: assert(!//error_69);
	    }
	    if((((a4==5) && (a94==8)) && (a33==10))){
	    cf = 0;
	    //error_70: assert(!//error_70);
	    }
	    if((((a89==8) && (a91==12)) && (a33==9))){
	    cf = 0;
	    //error_71: assert(!//error_71);
	    }
	    if((((a114==10) && (a128==13)) && (a33==11))){
	    cf = 0;
	    //error_72: assert(!//error_72);
	    }
	    if((((a190==16) && (a200==9)) && (a33==14))){
	    cf = 0;
	    //error_73: assert(!//error_73);
	    }
	    if((((a72==9) && (a94==15)) && (a33==10))){
	    cf = 0;
	    //error_74: assert(!//error_74);
	    }
	    if((((a76==10) && (a91==8)) && (a33==9))){
	    cf = 0;
	    //error_75: assert(!//error_75);
	    }
	    if((((a76==14) && (a200==10)) && (a33==14))){
	    cf = 0;
	    //error_76: assert(!//error_76);
	    }
	    if((((a82==12) && (a91==13)) && (a33==9))){
	    cf = 0;
	    //error_77: assert(!//error_77);
	    }
	    if((((a163==8) && (a200==13)) && (a33==14))){
	    cf = 0;
	    //error_78: assert(!//error_78);
	    }
	    if((((a36==15) && (a128==12)) && (a33==11))){
	    cf = 0;
	    //error_79: assert(!//error_79);
	    }
	    if((((a58==11) && (a94==9)) && (a33==10))){
	    cf = 0;
	    //error_80: assert(!//error_80);
	    }
	    if((((a72==12) && (a128==8)) && (a33==11))){
	    cf = 0;
	    //error_81: assert(!//error_81);
	    }
	    if((((a61==9) && (a195==14)) && (a33==12))){
	    cf = 0;
	    //error_82: assert(!//error_82);
	    }
	    if((((a16==8) && (a94==10)) && (a33==10))){
	    cf = 0;
	    //error_83: assert(!//error_83);
	    }
	    if((((a40==13) && (a195==11)) && (a33==12))){
	    cf = 0;
	    //error_84: assert(!//error_84);
	    }
	    if((((a39==16) && (a44==9)) && (a33==15))){
	    cf = 0;
	    //error_85: assert(!//error_85);
	    }
	    if((((a64==4) && (a128==15)) && (a33==11))){
	    cf = 0;
	    //error_86: assert(!//error_86);
	    }
	    if((((a200==7) && (a195==10)) && (a33==12))){
	    cf = 0;
	    //error_87: assert(!//error_87);
	    }
	    if((((a185==6) && (a128==11)) && (a33==11))){
	    cf = 0;
	    //error_88: assert(!//error_88);
	    }
	    if((((a122==10) && (a200==8)) && (a33==14))){
	    cf = 0;
	    //error_89: assert(!//error_89);
	    }
	    if((((a109==3) && (a72==10)) && (a33==8))){
	    cf = 0;
	    //error_90: assert(!//error_90);
	    }
	    if((((a74==13) && (a72==8)) && (a33==8))){
	    cf = 0;
	    //error_91: assert(!//error_91);
	    }
	    if((((a105==9) && (a44==6)) && (a33==15))){
	    cf = 0;
	    //error_92: assert(!//error_92);
	    }
	    if((((a72==11) && (a200==12)) && (a33==14))){
	    cf = 0;
	    //error_93: assert(!//error_93);
	    }
	    if((((a180==13) && (a113==8)) && (a33==13))){
	    cf = 0;
	    //error_94: assert(!//error_94);
	    }
	    if((((a149==12) && (a91==7)) && (a33==9))){
	    cf = 0;
	    //error_95: assert(!//error_95);
	    }
	    if((((a173==9) && (a44==12)) && (a33==15))){
	    cf = 0;
	    //error_96: assert(!//error_96);
	    }
	    if((((a105==5) && (a200==6)) && (a33==14))){
	    cf = 0;
	    //error_97: assert(!//error_97);
	    }
	    if((((a58==13) && (a94==9)) && (a33==10))){
	    cf = 0;
	    //error_98: assert(!//error_98);
	    }
	    if((((a74==9) && (a72==8)) && (a33==8))){
	    cf = 0;
	    //error_99: assert(!//error_99);
	    }
	}
 void calculate_outputm2(int input) {
    if((((cf==1) && (input == 1)) && a60 == 8684)) {
    	cf = 0;
    	a180 = (a72 - -4);
    	a33 = ((a72 * a72) - 68);
    	a113 = (a180 + -5); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
    	cf = 0;
    	a73 = (a23 - -4);
    	a33 = (a73 + 3);
    	a113 = ((a23 - a23) - -11); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((cf==1) && (input == 5)) && a158 == 9212)) {
    	cf = 0;
    	a200 = (a33 - -3);
    	a168 = ((a23 - a200) + 13);
    	a33 = ((a72 * a200) - 85); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if((((cf==1) && (input == 3)) && a2 >= 42)) {
    	cf = 0;
    	a91 = (a33 - -6);
    	a68 = (a91 - 3);
    	a33 = ((a72 - a23) - -6); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm1(int input) {
    if(((cf==1) && (a23==6))) {
    	calculate_outputm2(input);
    } 
}
 void calculate_outputm4(int input) {
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
    	cf = 0;
    	a195 = ((a72 - a107) - -7);
    	a144 = (a33 + -1);
    	a33 = (a107 - -4); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm5(int input) {
    if(((cf==1) && (input == 1))) {
	if((a155 + 20) > a155){
	a155  +=  1 ;}
	 else{	
	a155  +=  0;}
    	cf = 0;
    	a45 = ((a107 + a107) + -5);
    	a113 = (a72 - 1);
    	a33 = ((a45 / a113) + 12); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((input == 3) && (cf==1)) && a125 == 9328)) {
    	cf = 0;
    	a72 = (a33 + 2);
    	a109 = (a33 - 6); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((input == 5) && (cf==1)) && a86 == 2270)) {
    	cf = 0;
    	a33 = (a72 - -2);
    	a44 = (a72 + -1);
    	a173 = (a33 - 3); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
	if((a160 + 20) > a160){
	a160  +=  4 ;}
	 else{	
	a160  +=  0;}
    	cf = 0;
    	a195 = (a72 + -6);
    	a33 = (a195 + 5);
    	a41 = ((a195 + a195) - 6); 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
    if((((cf==1) && (input == 2)) && a146 <= -46)) {
    	cf = 0;
    	a91 = (a72 - -1);
    	a33 = ((a91 * a107) + -117);
    	a68 = ((a33 + a91) + -17); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm3(int input) {
    if(((cf==1) && (a107==8))) {
    	calculate_outputm4(input);
    } 
    if(((cf==1) && (a107==9))) {
    	calculate_outputm5(input);
    } 
}
 void calculate_outputm7(int input) {
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	a113 = (a82 + 2);
    	a73 = (a113 - 1);
    	a33 = (a73 - -3); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((input == 3) && (cf==1)) && a157 >= 32)) {
    	cf = 0;
    	a94 = (a91 + -4);
    	a33 = (a82 - -1);
    	a58 = ((a82 - a91) + 17); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a33 = a91;
    	a113 = (a33 - 2);
    	a73 = (a33 + -3); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((input == 1) && (cf==1)) && a97 >= 40)) {
    	cf = 0;
    	a33 = (a82 - -6);
    	a173 = (a82 - 1);
    	a44 = ((a33 + a33) - 18); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 5) && (cf==1)) && a170 == 9914)) {
    	cf = 0;
    	a94 = (a33 + 4);
    	a33 = (a82 - -1); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm6(int input) {
    if(((cf==1) && (a82==9))) {
    	calculate_outputm7(input);
    } 
}
 void calculate_outputm9(int input) {
    if(((input == 5) && (cf==1))) {
    	cf = 0;
    	 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm10(int input) {
    if((((input == 1) && (cf==1)) && a145 <= -20)) {
    	cf = 0;
    	a33 = ((a94 + a94) - 11);
    	a91 = ((a16 - a33) - -11);
    	a82 = ((a16 / a91) + 12); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 3))) {
    	cf = 0;
    	 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((cf==1) && (input == 5)) && a162 >= 28)) {
    	cf = 0;
    	a33 = ((a94 * a16) - 98);
    	a195 = ((a94 + a94) - 9);
    	a40 = ((a195 / a16) + 12); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
    	cf = 0;
    	a195 = ((a94 * a94) - 88);
    	a33 = (a94 + 2);
    	a144 = ((a94 + a195) - 15); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm8(int input) {
    if(((cf==1) && (a16==9))) {
    	calculate_outputm9(input);
    } 
    if(((cf==1) && (a16==11))) {
    	calculate_outputm10(input);
    } 
}
 void calculate_outputm12(int input) {
    if((((input == 1) && (cf==1)) && a29 >= 48)) {
    	cf = 0;
    	a72 = ((a21 * a94) + -97);
    	a94 = (a72 - -4); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((cf==1) && (input == 4)) && a198 >= 48)) {
    	cf = 0;
    	a33 = ((a94 - a21) + 12);
    	a44 = (a33 - 3);
    	a173 = (a44 + -2); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((input == 3) && (cf==1))) {
    	cf = 0;
    	a33 = (a94 + 1);
    	a113 = (a21 - -2);
    	a73 = (a33 + -3); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((cf==1) && (input == 2)) && a24 == 5180)) {
    	cf = 0;
    	a128 = (a94 - 4);
    	a72 = ((a21 - a21) - -14);
    	a33 = (a21 + 2); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm11(int input) {
    if(((a21==9) && (cf==1))) {
    	calculate_outputm12(input);
    } 
}
 void calculate_outputm14(int input) {
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	a33 = ((a72 / a72) - -13);
    	a200 = (a94 - 5);
    	a76 = ((a72 + a33) - 18); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((cf==1) && (input == 3))) {
    	cf = 0;
    	a33 = (a72 - -1);
    	a44 = ((a72 / a72) - -11);
    	a173 = (a72 + -5); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm13(int input) {
    if(((cf==1) && (a72==14))) {
    	calculate_outputm14(input);
    } 
}
 void calculate_outputm16(int input) {
    if(((cf==1) && (input == 5))) {
	if((a88 + 20) > a88){
	a88  +=  1 ;}
	 else{	
	a88  +=  0;}
	if((a151 + 20) > a151){
	a151  +=  2 ;}
	 else{	
	a151  +=  0;}
    	cf = 0;
    	a200 = ((a33 * a33) - 134);
    	a33 = ((a200 + a41) - 4);
    	a76 = (a200 + -1); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if((((input == 2) && (cf==1)) && a177 <= -36)) {
    	cf = 0;
    	a113 = (a41 + -2);
    	a33 = (a195 - -6);
    	a59 = (a33 + -2); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((input == 3) && (cf==1)) && a182 == 9474)) {
    	cf = 0;
    	a33 = (a195 - -2);
    	a91 = (a195 - -4);
    	a164 = (a33 + -4); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	a33 = (a195 - -6);
    	a113 = (a195 - -5);
    	a45 = (a113 + 4); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
	if((a56 + 20) > a56){
	a56  +=  1 ;}
	 else{	
	a56  +=  0;}
    	cf = 0;
    	a94 = (a195 - -3);
    	a33 = a94;
    	a16 = (a94 + 1); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
}
 void calculate_outputm15(int input) {
    if(((cf==1) && (a41==8))) {
    	calculate_outputm16(input);
    } 
}
 void calculate_outputm18(int input) {
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a195 = a33;
    	a144 = (a195 + -5); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 1) && (cf==1))) {
    	cf = 0;
    	a33 = ((a200 + a195) + -11);
    	a94 = (a195 + 2);
    	a21 = ((a94 * a195) - 111); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm19(int input) {
    if(((input == 3) && (cf==1))) {
    	cf = 0;
    	a33 = (a200 - 4);
    	a72 = ((a200 - a200) + 13);
    	a107 = (a72 + -5); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 2))) {
    	cf = 0;
    	a195 = a200;
    	a144 = ((a195 / a200) + 6); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm17(int input) {
    if(((a200==11) && (cf==1))) {
    	calculate_outputm18(input);
    } 
    if(((cf==1) && (a200==12))) {
    	calculate_outputm19(input);
    } 
}
 void calculate_outputm21(int input) {
    if(((cf==1) && (input == 5))) {
    	cf = 0;
    	a33 = (a195 - -2);
    	a102 = a40;
    	a113 = ((a40 * a102) + -72); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	a200 = (a33 + -2);
    	a76 = ((a195 * a200) + -99);
    	a33 = (a40 - -5); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((input == 3) && (cf==1))) {
    	cf = 0;
    	a72 = ((a40 + a33) + -7);
    	a94 = (a72 - -1);
    	a33 = (a72 - 4); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
}
 void calculate_outputm20(int input) {
    if(((a40==9) && (cf==1))) {
    	calculate_outputm21(input);
    } 
}
 void calculate_outputm23(int input) {
    if((((cf==1) && (input == 3)) && a175 == 8300)) {
    	cf = 0;
    	a91 = (a195 - 5);
    	a33 = ((a91 * a144) + -40);
    	a149 = (a144 + 2); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 2) && (cf==1)) && a171 == 1996)) {
    	cf = 0;
    	a44 = (a144 + -1);
    	a105 = (a33 - 3);
    	a33 = (a195 - -3); 
    	 printf("%d\n", 21); fflush(stdout); 
    } 
    if((((cf==1) && (input == 5)) && a155 >= 46)) {
    	cf = 0;
    	a33 = (a144 + 8);
    	a173 = (a195 + -1);
    	a44 = a195; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
	if((a49 - 20) < a49){
	a49  -=  2 ;}
	 else{	
	a49  -=  0;}
	if((a83 + 20) > a83){
	a83  +=  2 ;}
	 else{	
	a83  +=  0;}
	if((a162 + 20) > a162){
	a162  +=  1 ;}
	 else{	
	a162  +=  0;}
	if((a51 - 20) < a51){
	a51  -=  4 ;}
	 else{	
	a51  -=  0;}
	if((a124 + 20) > a124){
	a124  +=  2 ;}
	 else{	
	a124  +=  0;}
    	cf = 0;
    	a200 = (a195 + -2);
    	a76 = (a144 - -4);
    	a33 = (a144 + 7); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if((((input == 1) && (cf==1)) && a160 == 1108)) {
    	cf = 0;
    	a17 = (a195 - 8);
    	a94 = (a195 - 1);
    	a33 = (a17 + 6); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
}
 void calculate_outputm22(int input) {
    if(((cf==1) && (a144==7))) {
    	calculate_outputm23(input);
    } 
}
 void calculate_outputm25(int input) {
    if(((cf==1) && (input == 2))) {
    	cf = 0;
    	a94 = (a33 - 3);
    	a16 = ((a94 - a33) + 12);
    	a33 = ((a16 - a113) + 8); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	a33 = (a123 + 6);
    	a190 = (a123 - -4);
    	a200 = (a190 + -3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm24(int input) {
    if(((a123==8) && (cf==1))) {
    	calculate_outputm25(input);
    } 
}
 void calculate_outputm27(int input) {
    if(((input == 5) && (cf==1))) {
    	cf = 0;
    	a113 = (a102 - -2);
    	a73 = (a102 - -1); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((input == 3) && (cf==1))) {
    	cf = 0;
    	a113 = (a102 + -2);
    	a123 = ((a102 + a113) + -8); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a113 = (a33 + -2);
    	a73 = (a33 - 1); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm26(int input) {
    if(((a102==9) && (cf==1))) {
    	calculate_outputm27(input);
    } 
}
 void calculate_outputm29(int input) {
    if(((input == 5) && (cf==1))) {
	if((a2 + 20) > a2){
	a2  +=  1 ;}
	 else{	
	a2  +=  0;}
    	cf = 0;
    	a21 = (a113 + -2);
    	a33 = ((a21 + a73) - 9);
    	a94 = (a21 + 3); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 4))) {
	if((a170 + 20) > a170){
	a170  +=  4 ;}
	 else{	
	a170  +=  0;}
	if((a198 + 20) > a198){
	a198  +=  2 ;}
	 else{	
	a198  +=  0;}
    	cf = 0;
    	a72 = (a33 + -4);
    	a23 = (a113 - 5);
    	a33 = (a72 - 1); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 1) && (cf==1))) {
	if((a60 + 20) > a60){
	a60  +=  2 ;}
	 else{	
	a60  +=  0;}
	if((a158 + 20) > a158){
	a158  +=  4 ;}
	 else{	
	a158  +=  0;}
	if((a157 + 20) > a157){
	a157  +=  1 ;}
	 else{	
	a157  +=  0;}
	if((a97 + 20) > a97){
	a97  +=  1 ;}
	 else{	
	a97  +=  0;}
	if((a24 + 20) > a24){
	a24  +=  2 ;}
	 else{	
	a24  +=  0;}
	if((a29 + 20) > a29){
	a29  +=  2 ;}
	 else{	
	a29  +=  0;}
    	cf = 0;
    	a91 = a33;
    	a33 = (a113 + -2);
    	a82 = a33; 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm28(int input) {
    if(((a73==10) && (cf==1))) {
    	calculate_outputm29(input);
    } 
}
 void calculate_outputm31(int input) {
    if((((cf==1) && (input == 3)) && a83 >= 36)) {
    	cf = 0;
    	a91 = ((a45 - a33) - -7);
    	a149 = ((a33 - a33) - -12);
    	a33 = (a149 + -3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a72 = (a113 + 1);
    	a33 = (a45 + -5);
    	a107 = (a33 - -1); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 5) && (cf==1))) {
	if((a86 + 20) > a86){
	a86  +=  4 ;}
	 else{	
	a86  +=  0;}
	if((a197 + 20) > a197){
	a197  +=  2 ;}
	 else{	
	a197  +=  0;}
	if((a177 - 20) < a177){
	a177  -=  2 ;}
	 else{	
	a177  -=  0;}
	if((a3 + 20) > a3){
	a3  +=  2 ;}
	 else{	
	a3  +=  0;}
	if((a145 - 20) < a145){
	a145  -=  4 ;}
	 else{	
	a145  -=  0;}
    	cf = 0;
    	a200 = (a113 - 2);
    	a76 = (a33 - 2);
    	a33 = (a76 + 3); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if((((cf==1) && (input == 2)) && a3 == 4092)) {
    	cf = 0;
    	a33 = (a45 - 5);
    	a72 = (a113 + -4);
    	a74 = (a72 + 2); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if((((cf==1) && (input == 1)) && a50 == 6014)) {
    	cf = 0;
    	a72 = ((a45 * a113) - 145);
    	a33 = ((a72 - a45) - -10);
    	a84 = ((a33 / a113) - -9); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm32(int input) {
    if((((cf==1) && (input == 2)) && a189 >= 35)) {
    	cf = 0;
    	a33 = (a45 + -7);
    	a91 = ((a113 + a33) - 7);
    	a68 = (a113 + -3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a72 = (a45 - 3);
    	a107 = ((a33 / a72) + 8);
    	a33 = (a107 + -1); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 1) && (cf==1)) && a108 <= -22)) {
    	cf = 0;
    	a72 = (a33 - 5);
    	a74 = (a33 - 4);
    	a33 = a72; 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((cf==1) && (input == 3)) && a51 <= -30)) {
    	cf = 0;
    	a113 = (a33 - 6);
    	a123 = ((a113 + a45) - 19); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 5))) {
	if((a62 + 20) > a62){
	a62  +=  2 ;}
	 else{	
	a62  +=  0;}
	if((a108 - 20) < a108){
	a108  -=  4 ;}
	 else{	
	a108  -=  0;}
    	cf = 0;
    	a33 = ((a45 * a113) + -178);
    	a200 = (a45 + -6);
    	a76 = ((a113 * a200) - 109); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm30(int input) {
    if(((a45==13) && (cf==1))) {
    	calculate_outputm31(input);
    } 
    if(((cf==1) && (a45==16))) {
    	calculate_outputm32(input);
    } 
}
 void calculate_outputm34(int input) {
    if(((input == 5) && (cf==1))) {
    	cf = 0;
    	a123 = ((a190 * a190) - 136);
    	a113 = (a190 + -5);
    	a33 = (a113 + 6); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	a33 = (a200 + 4);
    	a113 = ((a33 - a190) - -6);
    	a123 = (a200 + -1); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
}
 void calculate_outputm33(int input) {
    if(((a190==12) && (cf==1))) {
    	calculate_outputm34(input);
    } 
}
 void calculate_outputm36(int input) {
    if((((cf==1) && (input == 5)) && a124 == 3976)) {
    	cf = 0;
    	a91 = (a33 - 1);
    	a33 = ((a200 + a76) + -10);
    	a82 = (a91 - 5); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 4) && (cf==1)) && a141 >= 32)) {
    	cf = 0;
    	a128 = (a76 - -5);
    	a42 = ((a200 - a128) + 10);
    	a33 = (a128 + -3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
    	cf = 0;
    	a33 = (a200 - 2);
    	a72 = (a76 + 4);
    	a107 = ((a33 * a76) + -63); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((cf==1) && (input == 3))) {
	if((a171 + 20) > a171){
	a171  +=  4 ;}
	 else{	
	a171  +=  0;}
    	cf = 0;
    	a33 = (a76 - -3);
    	a144 = ((a200 / a33) + 7);
    	a195 = ((a200 / a200) - -11); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((cf==1) && (input == 2))) {
    	cf = 0;
    	a33 = ((a76 * a200) + -78);
    	a195 = (a76 - 2);
    	a41 = (a195 + 1); 
    	 printf("%d\n", 22); fflush(stdout); 
    } 
}
 void calculate_outputm37(int input) {
    if(((cf==1) && (input == 5))) {
    	cf = 0;
    	a195 = ((a200 + a33) - 14);
    	a200 = (a33 - 3);
    	a33 = ((a76 + a200) - 9); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
    if(((cf==1) && (input == 2))) {
    	cf = 0;
    	a33 = (a76 + 2);
    	a195 = (a33 + -2);
    	a200 = (a195 + 2); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
}
 void calculate_outputm38(int input) {
    if((((input == 5) && (cf==1)) && a151 == 5178)) {
    	cf = 0;
    	a200 = (a33 - 5);
    	a190 = ((a33 + a76) + -9); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if(((input == 4) && (cf==1))) {
    	cf = 0;
    	a33 = (a200 + -2);
    	a107 = (a76 - 6);
    	a72 = (a33 - -5); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((cf==1) && (input == 2))) {
	if((a146 - 20) < a146){
	a146  -=  2 ;}
	 else{	
	a146  -=  0;}
	if((a50 + 20) > a50){
	a50  +=  2 ;}
	 else{	
	a50  +=  0;}
	if((a175 + 20) > a175){
	a175  +=  6 ;}
	 else{	
	a175  +=  0;}
	if((a189 + 20) > a189){
	a189  +=  1 ;}
	 else{	
	a189  +=  0;}
	if((a141 + 20) > a141){
	a141  +=  1 ;}
	 else{	
	a141  +=  0;}
    	cf = 0;
    	a72 = ((a200 + a33) - 11);
    	a107 = ((a76 * a33) - 145);
    	a33 = ((a200 + a200) + -12); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 3) && (cf==1)) && a88 >= 22)) {
    	cf = 0;
    	a61 = (a76 + -2);
    	a195 = a33;
    	a33 = (a61 - -3); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
    if(((cf==1) && (input == 1))) {
	if((a182 + 20) > a182){
	a182  +=  6 ;}
	 else{	
	a182  +=  0;}
    	cf = 0;
    	a33 = ((a76 - a200) + 14);
    	a44 = (a33 - 6);
    	a39 = (a44 - -3); 
    	 printf("%d\n", 25); fflush(stdout); 
    } 
}
 void calculate_outputm35(int input) {
    if(((cf==1) && (a76==9))) {
    	calculate_outputm36(input);
    } 
    if(((a76==10) && (cf==1))) {
    	calculate_outputm37(input);
    } 
    if(((a76==11) && (cf==1))) {
    	calculate_outputm38(input);
    } 
}
 void calculate_outputm40(int input) {
    if(((input == 2) && (cf==1))) {
    	cf = 0;
    	a195 = ((a105 * a33) - 19);
    	a33 = (a195 - -1);
    	a40 = (a105 - -7); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
}
 void calculate_outputm39(int input) {
    if(((cf==1) && (a105==2))) {
    	calculate_outputm40(input);
    } 
}
 void calculate_outputm42(int input) {
    if(((cf==1) && (input == 3))) {
	if((a125 + 20) > a125){
	a125  +=  2 ;}
	 else{	
	a125  +=  0;}
    	cf = 0;
    	a144 = (a33 + -8);
    	a195 = (a144 + 5);
    	a33 = (a44 + 3); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((cf==1) && (input == 1)) && a197 >= 41)) {
    	cf = 0;
    	a76 = ((a33 / a33) - -9);
    	a91 = (a44 + -1);
    	a33 = ((a76 * a91) + -71); 
    	 printf("%d\n", 23); fflush(stdout); 
    } 
    if((((input == 4) && (cf==1)) && a49 <= -21)) {
    	cf = 0;
    	a128 = a33;
    	a64 = (a33 - 6);
    	a33 = (a39 + -1); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((input == 5) && (cf==1)) && a62 == 1634)) {
    	cf = 0;
    	a39 = ((a44 / a33) - -16); 
    	 printf("%d\n", 26); fflush(stdout); 
    } 
    if((((cf==1) && (input == 2)) && a56 >= 40)) {
    	cf = 0;
    	a105 = (a39 - 7);
    	a200 = (a105 + 1);
    	a33 = (a44 + 5); 
    	 printf("%d\n", 19); fflush(stdout); 
    } 
}
 void calculate_outputm41(int input) {
    if(((cf==1) && (a39==12))) {
    	calculate_outputm42(input);
    } 
}

 void calculate_output(int input) {
        cf = 1;

    if(((cf==1) && (a33==8))) {
    	if(((a72==9) && (cf==1))) {
    		calculate_outputm1(input);
    	} 
    	if(((cf==1) && (a72==13))) {
    		calculate_outputm3(input);
    	} 
    } 
    if(((a33==9) && (cf==1))) {
    	if(((cf==1) && (a91==13))) {
    		calculate_outputm6(input);
    	} 
    } 
    if(((cf==1) && (a33==10))) {
    	if(((a94==10) && (cf==1))) {
    		calculate_outputm8(input);
    	} 
    	if(((cf==1) && (a94==12))) {
    		calculate_outputm11(input);
    	} 
    	if(((cf==1) && (a94==15))) {
    		calculate_outputm13(input);
    	} 
    } 
    if(((cf==1) && (a33==12))) {
    	if(((cf==1) && (a195==7))) {
    		calculate_outputm15(input);
    	} 
    	if(((cf==1) && (a195==10))) {
    		calculate_outputm17(input);
    	} 
    	if(((a195==11) && (cf==1))) {
    		calculate_outputm20(input);
    	} 
    	if(((cf==1) && (a195==12))) {
    		calculate_outputm22(input);
    	} 
    } 
    if(((a33==13) && (cf==1))) {
    	if(((cf==1) && (a113==7))) {
    		calculate_outputm24(input);
    	} 
    	if(((a113==9) && (cf==1))) {
    		calculate_outputm26(input);
    	} 
    	if(((cf==1) && (a113==11))) {
    		calculate_outputm28(input);
    	} 
    	if(((a113==12) && (cf==1))) {
    		calculate_outputm30(input);
    	} 
    } 
    if(((cf==1) && (a33==14))) {
    	if(((a200==9) && (cf==1))) {
    		calculate_outputm33(input);
    	} 
    	if(((a200==10) && (cf==1))) {
    		calculate_outputm35(input);
    	} 
    } 
    if(((a33==15) && (cf==1))) {
    	if(((cf==1) && (a44==6))) {
    		calculate_outputm39(input);
    	} 
    	if(((cf==1) && (a44==9))) {
    		calculate_outputm41(input);
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
        calculate_output(symb);
    }
    
 return 0;

}


