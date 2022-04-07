//This program is psyco_abp_1_false-no-overflow.c
#include<stdio.h>
#ifdef LLBMC
#include <llbmc.h>
#else
#include <klee/klee.h>
#endif


#define BOUND 50
// method ids
int m_Protocol = 1;
int m_msg_2 = 2;
int m_recv_ack_2 = 3;
int m_msg_1_1 = 4;
int m_msg_1_2 = 5;
int m_recv_ack_1_1 = 6;
int m_recv_ack_1_2 = 7;
 
int kappa;
int main() {
kappa = 0;
int dummy = 1;
  int q=0,FLAG=0,i=0;

  int method_id;

  // variables
    int this_expect = 0;
    int this_buffer_empty = 0;
   

        // parameters
        int P1;
        int P2;
        int P3;
        int P4;
        int P5;
        int P6;
        int P7;
        int P8;
        int P9;
        
        klee_make_symbolic(&P1, sizeof(int), "P1");
        klee_make_symbolic(&P2, sizeof(int), "P2");
        klee_make_symbolic(&P3, sizeof(int), "P3");
        klee_make_symbolic(&P4, sizeof(int), "P4");
        klee_make_symbolic(&P5, sizeof(int), "P5");
        
        klee_make_symbolic(&P6, sizeof(int), "P6");
        klee_make_symbolic(&P7, sizeof(int), "P7");
        klee_make_symbolic(&P8, sizeof(int), "P8");
        klee_make_symbolic(&P9, sizeof(int), "P9");

   int symb[32];


  for (int FLAG=0;FLAG<BOUND;FLAG++) {
       
       klee_make_symbolic(symb, sizeof(int ) * 32, "symb");
        

        


    // states
        if (q == 0){      
               
                if(symb[1]){
                  // assume guard
                  if ( dummy == 1 ){ 
                    // record method id
                    method_id = 1;
                    // non-conformance condition 
                    if ( dummy != 1 ) {
                      goto ERROR;
                    }
                    // state update
                    q = 1;
                    // post condition
                    this_expect=0; this_buffer_empty=1; 
                  }
                  continue;
                }

          continue;
        }
        if (q == 1){    
  
                if(symb[2]){
                  // assume guard
                  if ( !((P1 % 2) != (0 % 2)) ){ 
                    // record method id
                    method_id = 2;
                    // non-conformance condition 
                    if ( (((((P1 % 2) != (this_expect % 2)) && (this_buffer_empty == 1)) && !((P1 % 2) != (0 % 2))) || ((this_buffer_empty != 1) && !((P1 % 2) != (0 % 2)))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 3;
                    // post condition
                    this_expect=(this_expect + 1); this_buffer_empty=(1 - this_buffer_empty); 
                  }
                  continue;
                }

                if(symb[3]){
                  // assume guard
                  if ( !(P1 != (((0 + 1) - 1) % 2)) ){ 
                    // record method id
                    method_id = 3;
                    // non-conformance condition 
                    if ( (((P3 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && !(P3 != (((0 + 1) - 1) % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

                if(symb[4]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && (((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 4;
                    // non-conformance condition 
                    if ( (((((P4 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P4 % 2) != (0 % 2))) && (((P4 % 2) != (0 % 2)) && (((P4 % 2) != ((0 + 1) % 2)) && ((P4 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

                if(symb[5]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && !(((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 5;
                    // non-conformance condition 
                    if ( (((((P6 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

                if(symb[6]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && ((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 6;
                    // non-conformance condition 
                    if ( ((((P8 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P8 != (((0 + 1) - 1) % 2))) && ((P8 != (((0 + 1) - 1) % 2)) && ((P8 != ((((0 + 1) + 1) - 1) % 2)) && (P8 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[7]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && !((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 7;
                    // non-conformance condition 
                    if ( ((((P9 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

          continue;
        }
        if (q == 2){      

                if(symb[8]){
                  // assume guard
                  if ( !((P1 % 2) != (0 % 2)) ){ 
                    // record method id
                    method_id = 2;
                    // non-conformance condition 
                    if ( ((((P1 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && !((P1 % 2) != (0 % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

                if(symb[9]){
                  // assume guard
                  if ( !(P1 != (((0 + 1) - 1) % 2)) ){ 
                    // record method id
                    method_id = 3;
                    // non-conformance condition 
                    if ( (((P3 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && !(P3 != (((0 + 1) - 1) % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
               
                if(symb[10]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && (((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 4;
                    // non-conformance condition 
                    if ( (((((P4 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P4 % 2) != (0 % 2))) && (((P4 % 2) != (0 % 2)) && (((P4 % 2) != ((0 + 1) % 2)) && ((P4 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
               
                if(symb[11]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && !(((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 5;
                    // non-conformance condition 
                    if ( (((((P6 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
               
                if(symb[12]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && ((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 6;
                    // non-conformance condition 
                    if ( ((((P8 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P8 != (((0 + 1) - 1) % 2))) && ((P8 != (((0 + 1) - 1) % 2)) && ((P8 != ((((0 + 1) + 1) - 1) % 2)) && (P8 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

                if(symb[13]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && !((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 7;
                    // non-conformance condition 
                    if ( ((((P9 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

          continue;
        }
        if (q == 3){      
        
                if(symb[14]){
                  // assume guard
                  if ( !((P1 % 2) != (0 % 2)) ){ 
                    // record method id
                    method_id = 2;
                    // non-conformance condition 
                    if ( ((((P1 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && !((P1 % 2) != (0 % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[15]){
                  // assume guard
                  if ( !(P1 != (((0 + 1) - 1) % 2)) ){ 
                    // record method id
                    method_id = 3;
                    // non-conformance condition 
                    if ( (((this_buffer_empty == 1) && !(P3 != (((0 + 1) - 1) % 2))) || (((P3 != ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && !(P3 != (((0 + 1) - 1) % 2)))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 4;
                    // post condition
                    this_expect=this_expect; this_buffer_empty=(1 - this_buffer_empty); 
                  }
                  continue;
                }

                if(symb[16]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && (((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 4;
                    // non-conformance condition 
                    if ( (((((P4 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P4 % 2) != (0 % 2))) && (((P4 % 2) != (0 % 2)) && (((P4 % 2) != ((0 + 1) % 2)) && ((P4 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[17]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && !(((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 5;
                    // non-conformance condition 
                    if ( (((((P6 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
               
                if(symb[18]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && ((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 6;
                    // non-conformance condition 
                    if ( ((((P8 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P8 != (((0 + 1) - 1) % 2))) && ((P8 != (((0 + 1) - 1) % 2)) && ((P8 != ((((0 + 1) + 1) - 1) % 2)) && (P8 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[19]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && !((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 7;
                    // non-conformance condition 
                    if ( ((((P9 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

          continue;
        }
        if (q == 4){      
        
                if(symb[20]){
                  // assume guard
                  if ( !((P1 % 2) != (0 % 2)) ){ 
                    // record method id
                    method_id = 2;
                    // non-conformance condition 
                    if ( ((((P1 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && !((P1 % 2) != (0 % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[21]){
                  // assume guard
                  if ( !(P1 != (((0 + 1) - 1) % 2)) ){ 
                    // record method id
                    method_id = 3;
                    // non-conformance condition 
                    if ( (((P3 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && !(P3 != (((0 + 1) - 1) % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
               
                if(symb[22]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && (((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 4;
                    // non-conformance condition 
                    if ( (((((P4 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P4 % 2) != (0 % 2))) && (((P4 % 2) != (0 % 2)) && (((P4 % 2) != ((0 + 1) % 2)) && ((P4 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[23]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && !(((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 5;
                    // non-conformance condition 
                    if ( ((((((P6 % 2) != (this_expect % 2)) && (this_buffer_empty == 1)) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2))))) || (((this_buffer_empty != 1) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2)))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 5;
                    // post condition
                    this_expect=(this_expect + 1); this_buffer_empty=(1 - this_buffer_empty); 
                  }
                  continue;
                }
                
                if(symb[24]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && ((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 6;
                    // non-conformance condition 
                    if ( ((((P8 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P8 != (((0 + 1) - 1) % 2))) && ((P8 != (((0 + 1) - 1) % 2)) && ((P8 != ((((0 + 1) + 1) - 1) % 2)) && (P8 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[25]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && !((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 7;
                    // non-conformance condition 
                    if ( ((((P9 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }

          continue;
        }
        if (q == 5){      
        
                if(symb[26]){
                  // assume guard
                  if ( !((P1 % 2) != (0 % 2)) ){ 
                    // record method id
                    method_id = 2;
                    // non-conformance condition 
                    if ( ((((P1 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && !((P1 % 2) != (0 % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[27]){
                  // assume guard
                  if ( !(P1 != (((0 + 1) - 1) % 2)) ){ 
                    // record method id
                    method_id = 3;
                    // non-conformance condition 
                    if ( (((P3 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && !(P3 != (((0 + 1) - 1) % 2))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[28]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && (((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 4;
                    // non-conformance condition 
                    if ( (((((P4 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P4 % 2) != (0 % 2))) && (((P4 % 2) != (0 % 2)) && (((P4 % 2) != ((0 + 1) % 2)) && ((P4 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[29]){
                  // assume guard
                  if ( (((P1 % 2) != (0 % 2)) && !(((P1 % 2) != ((0 + 1) % 2)) && ((P1 % 2) != (0 % 2)))) ){ 
                    // record method id
                    method_id = 5;
                    // non-conformance condition 
                    if ( (((((P6 % 2) == (this_expect % 2)) && (this_buffer_empty == 1)) && ((P6 % 2) != (0 % 2))) && (((P6 % 2) != (0 % 2)) && !(((P6 % 2) != ((0 + 1) % 2)) && ((P6 % 2) != (0 % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[30]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && ((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 6;
                    // non-conformance condition 
                    if ( ((((P8 == ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P8 != (((0 + 1) - 1) % 2))) && ((P8 != (((0 + 1) - 1) % 2)) && ((P8 != ((((0 + 1) + 1) - 1) % 2)) && (P8 != (((0 + 1) - 1) % 2))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 2;
                    // post condition
                    break;
                  }
                  continue;
                }
                
                if(symb[31]){
                  // assume guard
                  if ( ((P1 != (((0 + 1) - 1) % 2)) && !((P1 != ((((0 + 1) + 1) - 1) % 2)) && (P1 != (((0 + 1) - 1) % 2)))) ){ 
                    // record method id
                    method_id = 7;
                    // non-conformance condition 
                    if ( ((((this_buffer_empty == 1) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2))))) || ((((P9 != ((this_expect - 1) % 2)) && (this_buffer_empty != 1)) && (P9 != (((0 + 1) - 1) % 2))) && ((P9 != (((0 + 1) - 1) % 2)) && !((P9 != ((((0 + 1) + 1) - 1) % 2)) && (P9 != (((0 + 1) - 1) % 2)))))) ) {
                      goto ERROR;
                    }
                    // state update
                    q = 1;
                    // post condition
                    this_expect=this_expect; this_buffer_empty=(1 - this_buffer_empty); 
                  }
                  continue;
                }

          continue;
        }
   

  } // end while

 ERROR:
  //printf("error \n ");


 
 


 

 
return 0;
}
