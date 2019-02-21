/*
 * Z3Simplification.h
 *
 *  Created on: 18 Feb 2019
 *      Author: xuanlinhha
 */

#ifndef LIB_CORE_Z3SIMPLIFICATION_H_
#define LIB_CORE_Z3SIMPLIFICATION_H_

#include "klee/Internal/Support/ErrorHandling.h"
#include <cstdlib>
#include <iostream>
#include <klee/Expr.h>
#include <string>

#include <z3++.h>

namespace klee {
class Z3Simplification {
public:
  Z3Simplification();
  virtual ~Z3Simplification();

  static ref<Expr> simplify(ref<Expr> expr);
  static void test();

private:
  static z3::expr txExpr2z3Expr(z3::context &c, ref<Expr> expr,
                                std::map<std::string, ref<Expr> > &emap);
  static ref<Expr> z3Expr2TxExpr(z3::expr,
                                 std::map<std::string, ref<Expr> > &emap);
  static z3::expr applyTactic(z3::context &c, std::string tactic, z3::expr e);

  static bool isaVar(ref<Expr> e);
  static std::string extractVarName(ref<Expr> e);
  static void visit(z3::expr const &e) {
    //    if (e.is_app()) {
    //      unsigned num = e.num_args();
    //      for (unsigned i = 0; i < num; i++) {
    //        visit(e.arg(i));
    //      }
    //      // do something
    //      // Example: print the visited expression
    //      z3::func_decl f = e.decl();
    //      std::cout << "application of " << f.name() << ": " << e << "\n";
    //    } else if (e.is_quantifier()) {
    //      visit(e.body());
    //      // do something
    //    } else {
    //      assert(e.is_var());
    //      // do something
    //    }
    std::cout << "Begin visit " << e << "\n";
    if (e.is_const()) {
      std::string name = e.decl().name().str();
      if (name == "Int") {
        std::cout << "Int value = " << e.get_numeral_int() << "\n";
      } else { // lookup in emap
        std::cout << name << " constant = " << e << "\n";
      }
    } else if (e.is_app()) {
      std::string name = e.decl().name().str();
      unsigned num = e.num_args();
      for (unsigned i = 0; i < num; i++) {
        visit(e.arg(i));
      }
      std::cout << "application of " << name << ": " << e << "\n";
    } else {
      //      assert(e.is_var());
      // do something
      //      std::cout << e << "\n";
    }
  }
};
} // namespace klee

#endif /* LIB_CORE_Z3SIMPLIFICATION_H_ */
