/*
consumer() {
     loop { await(cmoney >= 2 && buffer > 0) {cmoney -= 2; pmoney += 2; buffer--}; }
}
// p c p p c c p p p p MAX buffer is 4
*/

#include <assert.h>
#include <stdbool.h>

#ifdef TX
  #include <klee/klee.h>
  #define make_symbolic(var) klee_make_symbolic( ((&var)), sizeof( ((var)) ), #var)
#else
  #define make_symbolic(var) // Leave the var uninitialized is non-deterministic value already
#endif

const static int COST_PRO = 1;
const static int COST_CON = 2;
const static int POSSIBLE_MAX_BUF = 16;

const void search(int money_pro, int money_con, int buf, const int depth) {
  bool choice; make_symbolic(choice);
  if(choice) {
    // producer
    if(money_pro < COST_PRO) {
      return;
    }
    money_pro -= COST_PRO;
    buf++;
    assert(buf <= POSSIBLE_MAX_BUF);
  } else {
    // consumer
    if(money_con < COST_CON || buf <= 0) {
      return;
    }
    buf--;
    money_con -= COST_CON;
    money_pro += COST_CON;
  }
  search(money_pro, money_con, buf, depth + 1);
}

int main(void) {
  search(1, 30, 0, 1);
  return 0;
}
