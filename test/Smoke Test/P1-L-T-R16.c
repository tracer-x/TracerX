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

    extern void __VERIFIER_error(int);

	// inputs
	int inputs[] = {2,5,3,1,4};

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

	 int a149 = 16;
	 int a43  = 34;
	 int a93 = 11;
	 int a102  = 34;
	 int a117 = 10;
	 int cf = 1;
	 int a34  = 34;
	 int a145  = 34;


	void errorCheck() {

	}
 void calculate_outputm1(int input) {
    if(((a117 == 9 && ((( cf==1  && (input == 5)) && a34 == 32) && a34 == 32)) && ((a34 == 32 && a117 == 9) && a34 == 32))) {
    	cf = 0;
    	a34 = 33 ;
    	a43 = 36 ;
    	a102 = 32 ;
    	a117 = 8; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
    if((((a117 == 9 && (a117 == 9 && (a117 == 9 && a34 == 32))) && a34 == 32) && (( cf==1  && (input == 1)) && a117 == 9))) {
    	cf = 0;
    	a34 = 33 ;
    	a117 = 8;
    	a43 = 35 ;
    	a149 = 13; 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm2(int input) {
    if(((a117 == 9 && (a34 == 32 && a117 == 9)) && ((a117 == 9 && (( cf==1  && (input == 2)) && a117 == 9)) && a34 == 32))) {
    	cf = 0;
    	 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
    if((((a117 == 9 && (a34 == 32 && a34 == 32)) && a117 == 9) && ((a34 == 32 && ( cf==1  && (input == 1))) && a34 == 32))) {
    	cf = 0;
    	a43 = 35 ;
    	a117 = 8;
    	a34 = 33 ;
    	a149 = 12; 
    	 printf("%d\n", 25);//fflush(stdout);  
    } 
}
 void calculate_outputm3(int input) {
    if((((a34 == 32 && a117 == 9) && a34 == 32) && (((a34 == 32 && ( cf==1  && (input == 2))) && a117 == 9) && a34 == 32))) {
    	cf = 0;
    	a43 = 36 ;
    	a34 = 33 ;
    	a102 = 34 ;
    	a117 = 8; 
    	 printf("%d\n", 24);//fflush(stdout);  
    } 
    if(((a34 == 32 && ((a117 == 9 && a34 == 32) && a117 == 9)) && ((a117 == 9 && ( cf==1  && (input == 5))) && a117 == 9))) {
    	cf = 0;
    	 
    	 printf("%d\n", 26);//fflush(stdout);  
    } 
}
 void calculate_outputm4(int input) {
    if(((((a34 == 34 && a34 == 34) && a117 == 10) && a34 == 34) && (a34 == 34 && (((input == 1) &&  cf==1 ) && a117 == 10)))) {
    	cf = 0;
    	a34 = 33 ;
    	a117 = 8;
    	a43 = 35 ;
    	a149 = 14; 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm5(int input) {
    if((((a34 == 34 && ((input == 4) &&  cf==1 )) && a117 == 10) && (a117 == 10 && ((a117 == 10 && a117 == 10) && a117 == 10)))) {
    	cf = 0;
    	a34 = 33 ;
    	a43 = 36 ;
    	a102 = 34 ;
    	a117 = 8; 
    	 printf("%d\n", 26);//fflush(stdout);  
    } 
    if(((a117 == 10 && (a34 == 34 && a117 == 10)) && (a34 == 34 && ((((input == 1) &&  cf==1 ) && a117 == 10) && a117 == 10)))) {
    	cf = 0;
    	a34 = 33 ;
    	a102 = 32 ;
    	a43 = 36 ;
    	a117 = 8; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
    if(((((a117 == 10 && a34 == 34) && a34 == 34) && a117 == 10) && (a34 == 34 && (a34 == 34 && ( cf==1  && (input == 5)))))) {
    	cf = 0;
    	a34 = 33 ;
    	a43 = 35 ;
    	a117 = 8;
    	a149 = 12; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
}
 void calculate_outputm6(int input) {
    if((((a34 == 34 && a34 == 34) && a34 == 34) && (a117 == 10 && (a117 == 10 && (( cf==1  && (input == 2)) && a34 == 34))))) {
    	cf = 0;
    	a93 = 15; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
    if((((a117 == 10 && ((a34 == 34 && a34 == 34) && a117 == 10)) && a34 == 34) && (a34 == 34 && ( cf==1  && (input == 5))))) {
    	cf = 0;
    	a43 = 32 ;
    	a145 = 33 ;
    	a34 = 32 ;
    	a117 = 9; 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm7(int input) {
    if(((a117 == 10 && (a117 == 10 && ( cf==1  && (input == 3)))) && (((a34 == 34 && a34 == 34) && a117 == 10) && a34 == 34))) {
    	cf = 0;
    	a43 = 32 ;
    	a34 = 32 ;
    	a145 = 33 ;
    	a117 = 9; 
    	 printf("%d\n", 22);//fflush(stdout);  
    } 
    if(((a34 == 34 && (((a34 == 34 && ( cf==1  && (input == 1))) && a117 == 10) && a117 == 10)) && (a117 == 10 && a34 == 34))) {
    	cf = 0;
    	a93 = 15; 
    	 printf("%d\n", 22);//fflush(stdout);  
    } 
}
 void calculate_outputm8(int input) {
    if(((a117 == 10 && (a117 == 10 && (a34 == 34 && ((((input == 5) &&  cf==1 ) && a117 == 10) && a34 == 34)))) && a34 == 34)) {
    	cf = 0;
    	a102 = 32 ;
    	a34 = 33 ;
    	a43 = 36 ;
    	a117 = 8; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
    if(((a117 == 10 && (a34 == 34 && ( cf==1  && (input == 2)))) && ((a34 == 34 && (a117 == 10 && a34 == 34)) && a117 == 10))) {
    	cf = 0;
    	a93 = 12; 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm9(int input) {
    if((((a34 == 33 && ((a34 == 33 && a117 == 8) && a117 == 8)) && a34 == 33) && (( cf==1  && (input == 3)) && a34 == 33))) {
    	cf = 0;
    	a117 = 10;
    	a43 = 34 ;
    	a34 = 34 ;
    	a93 = 9; 
    	 printf("%d\n", 25);//fflush(stdout);  
    } 
}
 void calculate_outputm10(int input) {
    if((((a34 == 33 && a34 == 33) && a34 == 33) && (((a117 == 8 && ( cf==1  && (input == 3))) && a34 == 33) && a34 == 33))) {
    	cf = 0;
    	a43 = 36 ;
    	a102 = 34 ; 
    	 printf("%d\n", 22);//fflush(stdout);  
    } 
    if(((a34 == 33 && ((a117 == 8 && a117 == 8) && a117 == 8)) && ((a117 == 8 && ( cf==1  && (input == 4))) && a117 == 8))) {
    	cf = 0;
    	 
    	 printf("%d\n", 25);//fflush(stdout);  
    } 
    if(((((a117 == 8 && ((input == 5) &&  cf==1 )) && a34 == 33) && a34 == 33) && ((a117 == 8 && a117 == 8) && a34 == 33))) {
    	cf = 0;
    	 
    	 printf("%d\n", 25);//fflush(stdout);  
    } 
}
 void calculate_outputm11(int input) {
    if(((a34 == 33 && a117 == 8) && (a117 == 8 && (((((input == 5) &&  cf==1 ) && a117 == 8) && a34 == 33) && a117 == 8)))) {
    	cf = 0;
    	a34 = 32 ;
    	a145 = 35 ;
    	a43 = 32 ;
    	a117 = 9; 
    	 printf("%d\n", 21);//fflush(stdout);  
    } 
    if((((((input == 2) &&  cf==1 ) && a34 == 33) && a34 == 33) && (a34 == 33 && (a34 == 33 && (a117 == 8 && a34 == 33))))) {
    	cf = 0;
    	a149 = 13; 
    	 printf("%d\n", 24);//fflush(stdout);  
    } 
    if((((a34 == 33 && a34 == 33) && a117 == 8) && ((a117 == 8 && (a117 == 8 && ((input == 1) &&  cf==1 ))) && a34 == 33))) {
    	cf = 0;
    	a149 = 10; 
    	 printf("%d\n", 20);//fflush(stdout);  
    } 
}
 void calculate_outputm12(int input) {
    if((((a34 == 33 && ((a117 == 8 && a117 == 8) && a117 == 8)) && a117 == 8) && (( cf==1  && (input == 5)) && a34 == 33))) {
    	cf = 0;
    	a149 = 12; 
    	 printf("%d\n", 26);//fflush(stdout);  
    } 
    if(((a117 == 8 && (a117 == 8 && (a34 == 33 && a34 == 33))) && ((a117 == 8 && ((input == 1) &&  cf==1 )) && a117 == 8))) {
    	cf = 0;
    	 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm13(int input) {
    if((((a34 == 33 && ((a34 == 33 && ( cf==1  && (input == 2))) && a117 == 8)) && a117 == 8) && (a34 == 33 && a117 == 8))) {
    	cf = 0;
    	a117 = 10;
    	a43 = 34 ;
    	a34 = 34 ;
    	a93 = 14; 
    	 printf("%d\n", 21);//fflush(stdout);  
    } 
}
 void calculate_outputm14(int input) {
    if(((a117 == 8 && (a34 == 33 && (a117 == 8 && a34 == 33))) && (a117 == 8 && (( cf==1  && (input == 2)) && a34 == 33)))) {
    	cf = 0;
    	a43 = 34 ;
    	a117 = 10;
    	a34 = 34 ;
    	a93 = 12; 
    	 printf("%d\n", 23);//fflush(stdout);  
    } 
}
 void calculate_outputm15(int input) {
    if(((a117 == 8 && (((a117 == 8 && a34 == 33) && a34 == 33) && a117 == 8)) && (a117 == 8 && ( cf==1  && (input == 4))))) {
    	cf = 0;
    	a43 = 35 ;
    	a149 = 11; 
    	 printf("%d\n", 24);//fflush(stdout);  
    } 
    if(((a34 == 33 && (a34 == 33 && ( cf==1  && (input == 2)))) && ((a34 == 33 && (a117 == 8 && a34 == 33)) && a117 == 8))) {
    	cf = 0;
    	a34 = 32 ;
    	a43 = 32 ;
    	a145 = 36 ;
    	a117 = 9; 
    	 printf("%d\n", 24);//fflush(stdout);  
    } 
}

 void calculate_output(int input) {
        cf = 1;

    if((((a117 == 9 && a117 == 9) && a117 == 9) && (a34 == 32 && ((( cf==1  && a43 == 32) && a117 == 9) && a117 == 9)))) {
    	if(((a34 == 32 && (a34 == 32 && ((( cf==1  && a145 == 33) && a117 == 9) && a117 == 9))) && (a34 == 32 && a117 == 9))) {
    		calculate_outputm1(input);
    	} 
    	if(((a34 == 32 && a34 == 32) && ((((a117 == 9 && ( cf==1  && a145 == 35)) && a117 == 9) && a117 == 9) && a34 == 32))) {
    		calculate_outputm2(input);
    	} 
    	if(((a34 == 32 && ( cf==1  && a145 == 36)) && ((a117 == 9 && ((a117 == 9 && a34 == 32) && a34 == 32)) && a117 == 9))) {
    		calculate_outputm3(input);
    	} 
    } 
    if(((a34 == 34 && ((a117 == 10 && a34 == 34) && a117 == 10)) && (((a43 == 34 &&  cf==1 ) && a117 == 10) && a117 == 10))) {
    	if(((a117 == 10 && (a117 == 10 && (a34 == 34 && a34 == 34))) && (a117 == 10 && ((a93 == 9 &&  cf==1 ) && a34 == 34)))) {
    		calculate_outputm4(input);
    	} 
    	if((((a93 == 11 &&  cf==1 ) && a117 == 10) && (((a34 == 34 && (a117 == 10 && a34 == 34)) && a117 == 10) && a117 == 10))) {
    		calculate_outputm5(input);
    	} 
    	if(((a34 == 34 && a34 == 34) && (a117 == 10 && (a117 == 10 && (a117 == 10 && (a117 == 10 && (a93 == 12 &&  cf==1 ))))))) {
    		calculate_outputm6(input);
    	} 
    	if(((((a117 == 10 && ((a34 == 34 && a117 == 10) && a34 == 34)) && a117 == 10) && a117 == 10) && (a93 == 14 &&  cf==1 ))) {
    		calculate_outputm7(input);
    	} 
    	if((((a117 == 10 && a34 == 34) && a117 == 10) && (a34 == 34 && ((a117 == 10 && ( cf==1  && a93 == 15)) && a117 == 10)))) {
    		calculate_outputm8(input);
    	} 
    } 
    if(((a34 == 33 && (((a43 == 35 &&  cf==1 ) && a117 == 8) && a117 == 8)) && ((a117 == 8 && a34 == 33) && a34 == 33))) {
    	if((((a34 == 33 && a34 == 33) && a34 == 33) && (a117 == 8 && ((( cf==1  && a149 == 10) && a117 == 8) && a34 == 33)))) {
    		calculate_outputm9(input);
    	} 
    	if(((a117 == 8 && (a117 == 8 && (a117 == 8 && a34 == 33))) && (((a149 == 11 &&  cf==1 ) && a117 == 8) && a34 == 33))) {
    		calculate_outputm10(input);
    	} 
    	if(((a34 == 33 && a117 == 8) && (a34 == 33 && (a117 == 8 && (a117 == 8 && (a117 == 8 && (a149 == 12 &&  cf==1 ))))))) {
    		calculate_outputm11(input);
    	} 
    	if(((a117 == 8 && (( cf==1  && a149 == 13) && a117 == 8)) && (a34 == 33 && ((a34 == 33 && a117 == 8) && a117 == 8)))) {
    		calculate_outputm12(input);
    	} 
    	if((((a34 == 33 && ( cf==1  && a149 == 14)) && a34 == 33) && ((a117 == 8 && (a117 == 8 && a117 == 8)) && a34 == 33))) {
    		calculate_outputm13(input);
    	} 
    } 
    if(((a117 == 8 && a117 == 8) && (((a34 == 33 && (a34 == 33 && (a43 == 36 &&  cf==1 ))) && a34 == 33) && a34 == 33))) {
    	if((((a117 == 8 && (( cf==1  && a102 == 32) && a34 == 33)) && a34 == 33) && ((a34 == 33 && a34 == 33) && a117 == 8))) {
    		calculate_outputm14(input);
    	} 
    	if((((a34 == 33 && (a102 == 34 &&  cf==1 )) && a117 == 8) && (a34 == 33 && ((a117 == 8 && a117 == 8) && a117 == 8)))) {
    		calculate_outputm15(input);
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
           if((symb != 2) && (symb != 5) && (symb != 3) && (symb != 1) && (symb != 4))
          return -2;
        calculate_output(symb);
    }
    
 return 0;

}

