/*
 * Z3Simplification.cpp
 *
 *  Created on: 18 Feb 2019
 *      Author: xuanlinhha
 */

#include "Z3Simplification.h"

using namespace klee;

void Z3Simplification::test() {
  std::cout << "Start test!\n";
  z3::context c;
  z3::goal g(c);
  z3::expr x = c.bool_const("x");
  z3::expr y = c.bool_const("y");
  z3::expr z = c.int_const("z");
  z3::expr e = not(not(x) && not(y));
  std::cout << "e = " << e << "\n";
  visit(e);
  std::cout << "End test!\n";
}

ref<Expr> Z3Simplification::simplify(ref<Expr> expr) {
  z3::context c;
  std::map<std::string, ref<Expr> > emap;
  z3::expr z3expr = txExpr2z3Expr(c, expr, emap);
  z3expr = applyTactic(c, "simplify", z3expr);
  z3expr = applyTactic(c, "ctx-solver-simplify", z3expr);
  ref<Expr> ret = z3Expr2TxExpr(z3expr, emap);
  return ret;
}

ref<Expr>
Z3Simplification::z3Expr2TxExpr(z3::expr e,
                                std::map<std::string, ref<Expr> > &emap) {
  if (e.is_const()) {
    std::string name = e.decl().name().str();
    if (name == "Int") {
      if (e.get_numeral_int() < 0) {

        int absVal = abs(e.get_numeral_int());
        ref<ConstantExpr> val = ConstantExpr::create(absVal, Expr::Int32);
        return SubExpr::create(ConstantExpr::create(0, Expr::Int32), val);

      } else {
        ref<ConstantExpr> val =
            ConstantExpr::create(e.get_numeral_int(), Expr::Int32);
        return val;
      }
    } else if (name == "true") {
      ref<ConstantExpr> val = ConstantExpr::create(1, Expr::Bool);
      return val;
    } else if (name == "false") {
      ref<ConstantExpr> val = ConstantExpr::create(0, Expr::Bool);
      return val;
    } else { // lookup in emap
      std::map<std::string, ref<Expr> >::iterator i = emap.find(name);
      if (i != emap.end()) {
        return i->second;
      } else {
        klee_error("Z3Simplification::z3Expr2TxExpr: var is not in emap!");
      }
    }
  } else if (e.is_app()) {
    std::string symbol = e.decl().name().str();
    if (symbol == "+") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return AddExpr::create(l, r);
    } else if (symbol == "-") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return SubExpr::create(l, r);
    } else if (symbol == "*") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return MulExpr::create(l, r);
    } else if (symbol == "div") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      return SDivExpr::create(l, r);
    } else if (symbol == "=") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return EqExpr::create(l, r);
    } else if (symbol == "<=") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return SleExpr::create(l, r);
    } else if (symbol == "<") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return SltExpr::create(l, r);
    } else if (symbol == ">=") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return SgeExpr::create(l, r);
    } else if (symbol == ">") {
      ref<Expr> l = z3Expr2TxExpr(e.arg(0), emap);
      ref<Expr> r = z3Expr2TxExpr(e.arg(1), emap);
      unsigned max =
          l->getWidth() > r->getWidth() ? l->getWidth() : r->getWidth();
      l = (l->getWidth() == max) ? l : ZExtExpr::create(l, max);
      r = (r->getWidth() == max) ? r : ZExtExpr::create(r, max);
      return SgtExpr::create(l, r);
    } else if (symbol == "not") {
      ref<Expr> left = z3Expr2TxExpr(e.arg(0), emap);
      return NotExpr::create(left);
    } else if (symbol == "and") {
      ref<Expr> f = z3Expr2TxExpr(e.arg(0), emap);
      for (unsigned i = 1; i < e.num_args(); i++) {
        ref<Expr> n = z3Expr2TxExpr(e.arg(i), emap);
        f = AndExpr::create(f, n);
      }
      return f;
    } else if (symbol == "or") {
      ref<Expr> f = z3Expr2TxExpr(e.arg(0), emap);
      for (unsigned i = 1; i < e.num_args(); i++) {
        ref<Expr> n = z3Expr2TxExpr(e.arg(i), emap);
        f = OrExpr::create(f, n);
      }
      return f;
    } else {
      std::cout << e << "\n";
      std::cout << symbol << "\n";
      klee_error("Z3Simplification::z3Expr2TxExpr does not support for this "
                 "type of expr!");
    }
  } else {
    std::cout << e << "\n";
    klee_error("Z3Simplification::z3Expr2TxExpr does not support for this type "
               "of expr!");
  }

  ref<Expr> ret;
  return ret;
}

z3::expr
Z3Simplification::txExpr2z3Expr(z3::context &c, ref<Expr> expr,
                                std::map<std::string, ref<Expr> > &emap) {
  if (isaVar(expr)) {
    std::string name = extractVarName(expr);
    unsigned int size = expr->getWidth();
    emap.insert(std::pair<std::string, ref<Expr> >(name, expr));
    switch (size) {
    case Expr::Bool:
      return c.bool_const(name.c_str());
    case Expr::Int8:
    case Expr::Int16:
    case Expr::Int32:
    case Expr::Int64: {
      return c.int_const(name.c_str());
    }
    default: {
      expr->dump();
      klee_error(
          "Z3Simplification::txExpr2z3Expr does not support for this type!");
    }
    }
  }

  switch (expr->getKind()) {
  case Expr::Constant: {
    unsigned int val = dyn_cast<ConstantExpr>(expr)->getZExtValue();
    unsigned int size = expr->getWidth();
    switch (size) {
    case Expr::Bool:
    case Expr::Int8: {
      if (val == 0) {
        return c.bool_val(false);
      } else {
        return c.bool_val(true);
      }
    }
    case Expr::Int16:
    case Expr::Int32:
    case Expr::Int64: {
      return c.int_val(val);
    }
    default: {
      expr->dump();
      klee_error("Control should not reach here: "
                 "Z3Simplification::txExpr2z3Expr:Expr::Constant!");
    }
    }
    break;
  }
  case Expr::ZExt:
  case Expr::SExt: {
    return txExpr2z3Expr(c, expr->getKid(0), emap);
  }
  case Expr::Not: {
    return not(txExpr2z3Expr(c, expr->getKid(0), emap));
  }
  case Expr::Eq: {
    z3::expr l = txExpr2z3Expr(c, expr->getKid(0), emap);
    z3::expr r = txExpr2z3Expr(c, expr->getKid(1), emap);
    //    expr->getKid(0)->dump();
    //    std::cout << "Size = " << expr->getKid(0)->getWidth() << "\n";
    //    std::cout << l << "\n";
    //    expr->getKid(1)->dump();
    //    std::cout << "Size = " << expr->getKid(1)->getWidth() << "\n";
    //    std::cout << r << "\n";
    return l == r;
  }
  case Expr::Ne: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) !=
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Ult:
  case Expr::Slt: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) <
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Ule:
  case Expr::Sle: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) <=
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Ugt:
  case Expr::Sgt: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) >
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Uge:
  case Expr::Sge: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) >=
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }

  case Expr::Add: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) +
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Sub: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) -
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Mul: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) *
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::UDiv:
  case Expr::SDiv: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) /
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::URem:
  case Expr::SRem: {
    return rem(txExpr2z3Expr(c, expr->getKid(0), emap),
               txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::And: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) &&
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Or: {
    return (txExpr2z3Expr(c, expr->getKid(0), emap) ||
            txExpr2z3Expr(c, expr->getKid(1), emap));
  }
  case Expr::Xor: {
    z3::expr l = txExpr2z3Expr(c, expr->getKid(0), emap);
    z3::expr r = txExpr2z3Expr(c, expr->getKid(1), emap);
    z3::expr ret = not(not(l) && not(r));
    return ret;
  }

  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr:
  case Expr::NotOptimized:
  case Expr::Extract: {
    return txExpr2z3Expr(c, expr->getKid(0), emap);
  }
  default: {
    // Sanity check
    expr->dump();
    llvm::outs() << expr->getKind() << "\n";
    klee_error("Control should not reach here: "
               "Z3Simplification::txExpr2z3Expr:default case!");
  }
  }
  klee_error("Control should not reach here: "
             "Z3Simplification::txExpr2z3Expr: not in switch!");
  return c.int_val(0);
}

z3::expr Z3Simplification::applyTactic(z3::context &c, std::string tactic,
                                       z3::expr e) {
  z3::goal g(c);
  g.add(e);
  z3::tactic t(c, tactic.c_str());
  z3::apply_result r = t(g);
  assert(r.size() > 0 && "apply result is empty!");
  z3::expr ret = r[0].as_expr();
  for (unsigned i = 1; i < r.size(); i++) {
    ret = ret || r[i].as_expr();
  }
  return ret;
}

bool Z3Simplification::isaVar(ref<Expr> e) {
  switch (e->getKind()) {
  case Expr::WPVar:
  case Expr::Read:
    return true;

  case Expr::Concat: {
    if (isa<ReadExpr>(e->getKid(0))) {
      return true;
    } else {
      return false;
    }
  }
  //  case Expr::ZExt:
  //  case Expr::SExt: {
  //    return isaVar(e->getKid(0));
  //  }
  default:
    return false;
  }
}

std::string Z3Simplification::extractVarName(ref<Expr> e) {
  assert(isaVar(e) && "Z3Simplification::extractVarName: Not a var!");
  switch (e->getKind()) {
  case Expr::WPVar:
    return dyn_cast<WPVarExpr>(e)->getName();
  case Expr::Read:
    return dyn_cast<ReadExpr>(e)->getName();
  case Expr::Concat:
    return dyn_cast<ReadExpr>(e->getKid(0))->getName();
  //  case Expr::ZExt:
  //  case Expr::SExt: {
  //    return extractVarName(e->getKid(0));
  //  }
  default:
    return "";
  }
}
