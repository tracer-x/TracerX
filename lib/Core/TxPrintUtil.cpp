//===-- TxPrintUtil ---------------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// Functions to help display object contents.
///
//===----------------------------------------------------------------------===//

#include "klee/util/TxPrintUtil.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#else
#include <llvm/BasicBlock.h>
#include <llvm/Function.h>
#include <llvm/Instruction.h>
#endif

using namespace klee;

namespace klee {

bool outputFunctionName(llvm::Value *value, llvm::raw_ostream &stream) {
  llvm::Instruction *inst = llvm::dyn_cast<llvm::Instruction>(value);
  if (inst) {
    llvm::BasicBlock *bb = inst->getParent();
    if (bb) {
      llvm::Function *f = bb->getParent();
      stream << f->getName();
      return true;
    }
  }
  return false;
}

std::string makeTabs(const unsigned paddingAmount) {
  std::string tabsString;
  for (unsigned i = 0; i < paddingAmount; ++i) {
    tabsString += appendTab(tabsString);
  }
  return tabsString;
}

std::string appendTab(const std::string &prefix) { return prefix + "        "; }

/**/

std::string TxPrettyExpressionBuilder::bvConst32(uint32_t value) {
  std::ostringstream stream;
  stream << value;
  return stream.str();
}
std::string TxPrettyExpressionBuilder::bvConst64(uint64_t value) {
  std::ostringstream stream;
  stream << value;
  return stream.str();
}
std::string TxPrettyExpressionBuilder::bvZExtConst(uint64_t value) {
  return bvConst64(value);
}
std::string TxPrettyExpressionBuilder::bvSExtConst(uint64_t value) {
  return bvConst64(value);
}
std::string TxPrettyExpressionBuilder::bvBoolExtract(std::string expr,
                                                     int bit) {
  std::ostringstream stream;
  stream << expr << "[" << bit << "]";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::bvExtract(std::string expr, unsigned top,
                                                 unsigned bottom) {
  std::ostringstream stream;
  stream << expr << "[" << top << "," << bottom << "]";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::eqExpr(std::string a, std::string b) {
  if (a == "false")
    return "!" + b;
  return "(" + a + " = " + b + ")";
}

// logical left and right shift (not arithmetic)
std::string TxPrettyExpressionBuilder::bvLeftShift(std::string expr,
                                                   unsigned shift) {
  std::ostringstream stream;
  stream << "(" << expr << " \\<\\< " << shift << ")";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::bvRightShift(std::string expr,
                                                    unsigned shift) {
  std::ostringstream stream;
  stream << "(" << expr << " \\>\\> " << shift << ")";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::bvVarLeftShift(std::string expr,
                                                      std::string shift) {
  return "(" + expr + " \\<\\< " + shift + ")";
}
std::string TxPrettyExpressionBuilder::bvVarRightShift(std::string expr,
                                                       std::string shift) {
  return "(" + expr + " \\>\\> " + shift + ")";
}
std::string TxPrettyExpressionBuilder::bvVarArithRightShift(std::string expr,
                                                            std::string shift) {
  return bvVarRightShift(expr, shift);
}

// Some STP-style bitvector arithmetic
std::string TxPrettyExpressionBuilder::bvMinusExpr(std::string minuend,
                                                   std::string subtrahend) {
  return "(" + minuend + " - " + subtrahend + ")";
}
std::string TxPrettyExpressionBuilder::bvPlusExpr(std::string augend,
                                                  std::string addend) {
  return "(" + augend + " + " + addend + ")";
}
std::string TxPrettyExpressionBuilder::bvMultExpr(std::string multiplacand,
                                                  std::string multiplier) {
  return "(" + multiplacand + " * " + multiplier + ")";
}
std::string TxPrettyExpressionBuilder::bvDivExpr(std::string dividend,
                                                 std::string divisor) {
  return "(" + dividend + " / " + divisor + ")";
}
std::string TxPrettyExpressionBuilder::sbvDivExpr(std::string dividend,
                                                  std::string divisor) {
  return "(" + dividend + " / " + divisor + ")";
}
std::string TxPrettyExpressionBuilder::bvModExpr(std::string dividend,
                                                 std::string divisor) {
  return "(" + dividend + " % " + divisor + ")";
}
std::string TxPrettyExpressionBuilder::sbvModExpr(std::string dividend,
                                                  std::string divisor) {
  return "(" + dividend + " % " + divisor + ")";
}
std::string TxPrettyExpressionBuilder::notExpr(std::string expr) {
  return "!(" + expr + ")";
}
std::string TxPrettyExpressionBuilder::bvAndExpr(std::string lhs,
                                                 std::string rhs) {
  return "(" + lhs + " & " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::bvOrExpr(std::string lhs,
                                                std::string rhs) {
  return "(" + lhs + " \\| " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::iffExpr(std::string lhs,
                                               std::string rhs) {
  return "(" + lhs + " \\<=\\> " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::bvXorExpr(std::string lhs,
                                                 std::string rhs) {
  return "(" + lhs + " xor " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::bvSignExtend(std::string src) {
  return src;
}

// Some STP-style array domain interface
std::string TxPrettyExpressionBuilder::writeExpr(std::string array,
                                                 std::string index,
                                                 std::string value) {
  return "update(" + array + "," + index + "," + value + ")";
}
std::string TxPrettyExpressionBuilder::readExpr(std::string array,
                                                std::string index) {
  return array + "[" + index + "]";
}

// ITE-expression constructor
std::string TxPrettyExpressionBuilder::iteExpr(std::string condition,
                                               std::string whenTrue,
                                               std::string whenFalse) {
  return "ite(" + condition + "," + whenTrue + "," + whenFalse + ")";
}

// Bitvector comparison
std::string TxPrettyExpressionBuilder::bvLtExpr(std::string lhs,
                                                std::string rhs) {
  return "(" + lhs + " \\< " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::bvLeExpr(std::string lhs,
                                                std::string rhs) {
  return "(" + lhs + " \\<= " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::sbvLtExpr(std::string lhs,
                                                 std::string rhs) {
  return "(" + lhs + " \\< " + rhs + ")";
}
std::string TxPrettyExpressionBuilder::sbvLeExpr(std::string lhs,
                                                 std::string rhs) {
  return "(" + lhs + " \\<= " + rhs + ")";
}

std::string TxPrettyExpressionBuilder::constructAShrByConstant(
    std::string expr, unsigned shift, std::string isSigned) {
  return bvRightShift(expr, shift);
}
std::string TxPrettyExpressionBuilder::constructMulByConstant(std::string expr,
                                                              uint64_t x) {
  std::ostringstream stream;
  stream << "(" << expr << " * " << x << ")";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::constructUDivByConstant(std::string expr,
                                                               uint64_t d) {
  std::ostringstream stream;
  stream << "(" << expr << " / " << d << ")";
  return stream.str();
}
std::string TxPrettyExpressionBuilder::constructSDivByConstant(std::string expr,
                                                               uint64_t d) {
  std::ostringstream stream;
  stream << "(" << expr << " / " << d << ")";
  return stream.str();
}

std::string TxPrettyExpressionBuilder::getInitialArray(const Array *root) {
  std::string arrayExpr =
      buildArray(root->name.c_str(), root->getDomain(), root->getRange());

  if (root->isConstantArray()) {
    for (unsigned i = 0, e = root->size; i != e; ++i) {
      std::string prev = arrayExpr;
      arrayExpr = writeExpr(
          prev, constructActual(ConstantExpr::create(i, root->getDomain())),
          constructActual(root->constantValues[i]));
    }
  }
  return arrayExpr;
}
std::string TxPrettyExpressionBuilder::getArrayForUpdate(const Array *root,
                                                         const UpdateNode *un) {
  if (!un) {
    return (getInitialArray(root));
  }
  return writeExpr(getArrayForUpdate(root, un->next),
                   constructActual(un->index), constructActual(un->value));
}

std::string TxPrettyExpressionBuilder::constructActual(ref<Expr> e) {
  switch (e->getKind()) {
  case Expr::Constant: {
    ConstantExpr *CE = cast<ConstantExpr>(e);
    int width = CE->getWidth();

    // Coerce to bool if necessary.
    if (width == 1)
      return CE->isTrue() ? getTrue() : getFalse();

    // Fast path.
    if (width <= 32)
      return bvConst32(CE->getZExtValue(32));
    if (width <= 64)
      return bvConst64(CE->getZExtValue());

    ref<ConstantExpr> Tmp = CE;
    return bvConst64(Tmp->Extract(0, 64)->getZExtValue());
  }

  // Special
  case Expr::NotOptimized: {
    NotOptimizedExpr *noe = cast<NotOptimizedExpr>(e);
    return constructActual(noe->src);
  }

  case Expr::Read: {
    ReadExpr *re = cast<ReadExpr>(e);
    assert(re && re->updates.root);
    return readExpr(getArrayForUpdate(re->updates.root, re->updates.head),
                    constructActual(re->index));
  }

  case Expr::Select: {
    SelectExpr *se = cast<SelectExpr>(e);
    std::string cond = constructActual(se->cond);
    std::string tExpr = constructActual(se->trueExpr);
    std::string fExpr = constructActual(se->falseExpr);
    return iteExpr(cond, tExpr, fExpr);
  }

  case Expr::Concat: {
    ConcatExpr *ce = cast<ConcatExpr>(e);
    unsigned numKids = ce->getNumKids();
    std::string res = constructActual(ce->getKid(numKids - 1));
    for (int i = numKids - 2; i >= 0; i--) {
      res = constructActual(ce->getKid(i)) + "." + res;
    }
    return res;
  }

  case Expr::Extract: {
    ExtractExpr *ee = cast<ExtractExpr>(e);
    std::string src = constructActual(ee->expr);
    int width = ee->getWidth();
    if (width == 1) {
      return bvBoolExtract(src, ee->offset);
    } else {
      return bvExtract(src, ee->offset + width - 1, ee->offset);
    }
  }

  // Casting
  case Expr::ZExt: {
    CastExpr *ce = cast<CastExpr>(e);
    std::string src = constructActual(ce->src);
    int width = ce->getWidth();
    if (width == 1) {
      return iteExpr(src, bvOne(), bvZero());
    } else {
      return src;
    }
  }

  case Expr::SExt: {
    CastExpr *ce = cast<CastExpr>(e);
    std::string src = constructActual(ce->src);
    return bvSignExtend(src);
  }

  // Arithmetic
  case Expr::Add: {
    AddExpr *ae = cast<AddExpr>(e);
    std::string left = constructActual(ae->left);
    std::string right = constructActual(ae->right);
    return bvPlusExpr(left, right);
  }

  case Expr::Sub: {
    SubExpr *se = cast<SubExpr>(e);
    std::string left = constructActual(se->left);
    std::string right = constructActual(se->right);
    return bvMinusExpr(left, right);
  }

  case Expr::Mul: {
    MulExpr *me = cast<MulExpr>(e);
    std::string right = constructActual(me->right);
    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(me->left))
      if (CE->getWidth() <= 64)
        return constructMulByConstant(right, CE->getZExtValue());

    std::string left = constructActual(me->left);
    return bvMultExpr(left, right);
  }

  case Expr::UDiv: {
    UDivExpr *de = cast<UDivExpr>(e);
    std::string left = constructActual(de->left);

    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(de->right)) {
      if (CE->getWidth() <= 64) {
        uint64_t divisor = CE->getZExtValue();

        if (bits64::isPowerOfTwo(divisor)) {
          return bvRightShift(left, bits64::indexOfSingleBit(divisor));
        }
      }
    }

    std::string right = constructActual(de->right);
    return bvDivExpr(left, right);
  }

  case Expr::SDiv: {
    SDivExpr *de = cast<SDivExpr>(e);
    std::string left = constructActual(de->left);
    std::string right = constructActual(de->right);
    return sbvDivExpr(left, right);
  }

  case Expr::URem: {
    URemExpr *de = cast<URemExpr>(e);
    std::string left = constructActual(de->left);

    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(de->right)) {
      if (CE->getWidth() <= 64) {
        uint64_t divisor = CE->getZExtValue();

        if (bits64::isPowerOfTwo(divisor)) {
          unsigned bits = bits64::indexOfSingleBit(divisor);

          // special case for modding by 1 or else we bvExtract -1:0
          if (bits == 0) {
            return bvZero();
          } else {
            return bvExtract(left, bits - 1, 0);
          }
        }
      }
    }

    std::string right = constructActual(de->right);
    return bvModExpr(left, right);
  }

  case Expr::SRem: {
    SRemExpr *de = cast<SRemExpr>(e);
    std::string left = constructActual(de->left);
    std::string right = constructActual(de->right);
    return sbvModExpr(left, right);
  }

  // Bitwise
  case Expr::Not: {
    NotExpr *ne = cast<NotExpr>(e);
    std::string expr = constructActual(ne->expr);
    return notExpr(expr);
  }

  case Expr::And: {
    AndExpr *ae = cast<AndExpr>(e);
    std::string left = constructActual(ae->left);
    std::string right = constructActual(ae->right);
    return bvAndExpr(left, right);
  }

  case Expr::Or: {
    OrExpr *oe = cast<OrExpr>(e);
    std::string left = constructActual(oe->left);
    std::string right = constructActual(oe->right);
    return bvOrExpr(left, right);
  }

  case Expr::Xor: {
    XorExpr *xe = cast<XorExpr>(e);
    std::string left = constructActual(xe->left);
    std::string right = constructActual(xe->right);
    return bvXorExpr(left, right);
  }

  case Expr::Shl: {
    ShlExpr *se = cast<ShlExpr>(e);
    std::string left = constructActual(se->left);
    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(se->right)) {
      return bvLeftShift(left, (unsigned)CE->getLimitedValue());
    } else {
      std::string amount = constructActual(se->right);
      return bvVarLeftShift(left, amount);
    }
  }

  case Expr::LShr: {
    LShrExpr *lse = cast<LShrExpr>(e);
    std::string left = constructActual(lse->left);
    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(lse->right)) {
      return bvRightShift(left, (unsigned)CE->getLimitedValue());
    } else {
      std::string amount = constructActual(lse->right);
      return bvVarRightShift(left, amount);
    }
  }

  case Expr::AShr: {
    AShrExpr *ase = cast<AShrExpr>(e);
    std::string left = constructActual(ase->left);
    std::string amount = constructActual(ase->right);
    return bvVarArithRightShift(left, amount);
  }

  // Comparison
  case Expr::Eq: {
    EqExpr *ee = cast<EqExpr>(e);
    std::string left = constructActual(ee->left);
    std::string right = constructActual(ee->right);
    return eqExpr(left, right);
  }

  case Expr::Ult: {
    UltExpr *ue = cast<UltExpr>(e);
    std::string left = constructActual(ue->left);
    std::string right = constructActual(ue->right);
    return bvLtExpr(left, right);
  }

  case Expr::Ule: {
    UleExpr *ue = cast<UleExpr>(e);
    std::string left = constructActual(ue->left);
    std::string right = constructActual(ue->right);
    return bvLeExpr(left, right);
  }

  case Expr::Slt: {
    SltExpr *se = cast<SltExpr>(e);
    std::string left = constructActual(se->left);
    std::string right = constructActual(se->right);
    return sbvLtExpr(left, right);
  }

  case Expr::Sle: {
    SleExpr *se = cast<SleExpr>(e);
    std::string left = constructActual(se->left);
    std::string right = constructActual(se->right);
    return sbvLeExpr(left, right);
  }

  case Expr::Exists: {
    ExistsExpr *xe = cast<ExistsExpr>(e);
    std::string existentials;

    for (std::set<const Array *>::const_iterator is = xe->variables.begin(),
                                                 ie = xe->variables.end(),
                                                 it = is;
         it != ie; ++it) {
      if (it != is)
        existentials += ",";
      existentials += (*it)->name;
    }

    return "(exists (" + existentials + ") " + constructActual(xe->body) + ")";
  }

  default:
    assert(0 && "unhandled Expr type");
    return getTrue();
  }
}
std::string TxPrettyExpressionBuilder::construct(ref<Expr> e) {
  TxPrettyExpressionBuilder *instance = new TxPrettyExpressionBuilder();
  std::string ret = instance->constructActual(e);
  delete instance;
  return ret;
}

std::string
TxPrettyExpressionBuilder::constructQuery(ConstraintManager &constraints,
                                          ref<Expr> query) {
  std::string msg;
  std::string tabs = makeTabs(1);
  llvm::raw_string_ostream stream(msg);
  stream << "antecedent:\n";
  for (ConstraintManager::const_iterator it = constraints.begin(),
                                         ie = constraints.end();
       it != ie; ++it) {
    stream << tabs << construct(*it) << "\n";
  }
  stream << "consequent:\n";
  stream << tabs << construct(query) << "\n";
  stream.flush();
  return msg;
}

std::string TxPrettyExpressionBuilder::buildArray(const char *name,
                                                  unsigned indexWidth,
                                                  unsigned valueWidth) {
  return name;
}

std::string TxPrettyExpressionBuilder::getTrue() { return "true"; }
std::string TxPrettyExpressionBuilder::getFalse() { return "false"; }
std::string TxPrettyExpressionBuilder::getInitialRead(const Array *root,
                                                      unsigned index) {
  return readExpr(getInitialArray(root), bvConst32(index));
}

TxPrettyExpressionBuilder::TxPrettyExpressionBuilder() {}

TxPrettyExpressionBuilder::~TxPrettyExpressionBuilder() {}
}
