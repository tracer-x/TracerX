/*
 * ITree.cpp
 *
 *  Created on: Oct 15, 2015
 *      Author: felicia
 */

#include "ITree.h"
#include "TimingSolver.h"

#include <klee/Expr.h>
#include <klee/Solver.h>
#include <klee/util/ExprPPrinter.h>
#include <vector>

using namespace klee;

PathConditionMarker::PathConditionMarker(PathCondition *pathCondition) :
  mayBeInInterpolant(false), pathCondition(pathCondition) {}

PathConditionMarker::~PathConditionMarker() {}

void PathConditionMarker::mayIncludeInInterpolant() {
  mayBeInInterpolant = true;
}

void PathConditionMarker::includeInInterpolant() {
  if (mayBeInInterpolant) {
      pathCondition->includeInInterpolant();
  }
}

PathCondition::PathCondition(ref<Expr>& constraint) :
    constraint(constraint), inInterpolant(false), tail(0) {}

PathCondition::PathCondition(ref<Expr>& constraint, PathCondition *prev) :
    constraint(constraint), inInterpolant(false), tail(prev) {}

PathCondition::~PathCondition() {}

ref<Expr> PathCondition::car() const {
  return constraint;
}

PathCondition *PathCondition::cdr() const {
  return tail;
}

void PathCondition::includeInInterpolant() {
  inInterpolant = true;
}

bool PathCondition::carInInterpolant() {
  return inInterpolant;
}

std::vector< ref<Expr> > PathCondition::packInterpolant() const {
  std::vector< ref<Expr> > res;
  for (const PathCondition *it = this; it != 0; it = it->tail) {
      if (it->inInterpolant)
	res.push_back(it->constraint);
  }
  return res;
}

void PathCondition::dump() {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void PathCondition::print(llvm::raw_ostream& stream) {
  stream << "[";
  for (PathCondition *it = this; it != 0; it = it->tail) {
      it->constraint->print(stream);
      stream << ": " << (it->inInterpolant ? "interpolant constraint" : "non-interpolant constraint");
      if (it->tail != 0) stream << ",";
  }
  stream << "]";
}

SubsumptionTableEntry::SubsumptionTableEntry(ITreeNode *node) :
  nodeId(node->getNodeId()),
  interpolant(node->getInterpolant()) {}

SubsumptionTableEntry::~SubsumptionTableEntry() {}

bool SubsumptionTableEntry::subsumed(TimingSolver *solver,
                                     ExecutionState& state,
                                     double timeout) {
  if (state.itreeNode == 0)
    return false;

  if (state.itreeNode->getNodeId() == nodeId) {
      /// We create path condition needed constraints marking structure
      std::map< ref<Expr>, PathConditionMarker *> markerMap =
	  state.itreeNode->makeMarkerMap();

      for (std::vector< ref<Expr> >::iterator it0 = interpolant.begin();
	  it0 != interpolant.end(); it0++) {
	  ref<Expr> query = *it0;
	  Solver::Validity result;

	  /// llvm::errs() << "Querying for subsumption check:\n";
	  /// ExprPPrinter::printQuery(llvm::errs(), state.constraints, query);

	  solver->setTimeout(timeout);
	  bool success = solver->evaluate(state, query, result);
	  solver->setTimeout(0);
	  if (success && result == Solver::True) {
	    std::vector< ref<Expr> > unsat_core = solver->getUnsatCore();

	    for (std::vector< ref<Expr> >::iterator it1 = unsat_core.begin();
		it1 != unsat_core.end(); it1++) {
		markerMap[*it1]->mayIncludeInInterpolant();
	    }

	  } else {
	    return false;
	  }
      }

      /// State subsumed, we mark needed constraints on the
      /// path condition.
      for (std::map< ref<Expr>, PathConditionMarker *>::iterator it = markerMap.begin();
	  it != markerMap.end(); it++) {
	  it->second->includeInInterpolant();
      }
      markerMap.clear();
      return true;
  }
  return false;
}

void SubsumptionTableEntry::dump() const {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void SubsumptionTableEntry::print(llvm::raw_ostream &stream) const {
  stream << "------------ Subsumption Table Entry ------------\n";
  stream << "Program point = " << nodeId << "\n";
  stream << "interpolant = [";
  for (std::vector< ref<Expr> >::const_iterator it = interpolant.begin();
      it != interpolant.end(); it++) {
      it->get()->print(stream);
      if (it + 1 != interpolant.end()) {
	  stream << ",";
      }
  }
  stream << "]\n";
}

TransferRelationEntry::TransferRelationEntry(ref<Expr> _leftExpr, ref<Expr> _rightExpr, ExpressionType _exprType,
													ref<Expr> _relationFrom, ref<Expr> _relationTo, bool _isAdded):
	leftExpr(_leftExpr),
	rightExpr(_rightExpr),
	exprType(_exprType),
	relationFrom(_relationFrom),
	relationTo(_relationTo),
	isAdded(_isAdded){}

void TransferRelationEntry::setIsAdded(bool _isAdded){
	this->isAdded = _isAdded;
}

bool TransferRelationEntry::getIsAdded() const{
	return this->isAdded;
}

ref<Expr> TransferRelationEntry::getLeftExpr() const{
	return this->leftExpr;
}

ref<Expr> TransferRelationEntry::getRightExpr() const{
	return this->rightExpr;
}

ExpressionType TransferRelationEntry::getExpressionType() const{
	return this->exprType;
}

ref<Expr> TransferRelationEntry::getRelationTo() const{
	return this->relationTo;
}

Interpolant::Interpolant():
	status(NoInterpolant){}


Interpolant::Interpolant(ref<Expr> _interpolant, ref<Expr> _fromLoc, ref<Expr> _destLoc, InterpolantStatus _status):
	interpolant(_interpolant),
	fromLoc(_fromLoc),
	destLoc(_destLoc),
	status(_status){}

void Interpolant::setInterpolant(ref<Expr> _interpolant){
	this->interpolant = _interpolant;
}

ref<Expr> Interpolant::getInterpolant() const{
	return this->interpolant;
}

ref<Expr> Interpolant::getFromLoc() const{
	return this->fromLoc;
}

ref<Expr> Interpolant::getDestLoc() const{
	return this->destLoc;
}

InterpolantStatus Interpolant::getInterpolantStatus () const{
	return this->status;
}

void Interpolant::setInterpolantStatus (InterpolantStatus _interpolantStatus){
	this->status = _interpolantStatus;
}

RelationInterPath::RelationInterPath(unsigned int _nodeId, unsigned int _nodeDest, ref<Expr> _valueExpr, ref<Expr> _relationFrom,
		ref<Expr> _relationDest, ExpressionType _expressionType):
		valueExpr(_valueExpr),
		relationFrom(_relationFrom),
		relationDest(_relationDest),
		expressionType(_expressionType){

		relationNodeList.push_back(std::make_pair(_nodeId, _nodeDest));
}

ref<Expr> RelationInterPath::getValueExpr() const{
	return this->valueExpr;
}

ref<Expr> RelationInterPath::getRelationFrom() const{
	return this->relationFrom;
}

ref<Expr> RelationInterPath::getRelationDest() const{
	return this->relationDest;
}

ExpressionType RelationInterPath::getExpressionType() const{
	return this->expressionType;
}

void RelationInterPath::addRelationNodeList(std::pair<unsigned int, unsigned int> _pairNodeID){
	this->relationNodeList.push_back(_pairNodeID);
}


PostCondition::PostCondition(ref<Expr> _base, ref<Expr> _value):
	base(_base),
	value(_value){}

ref<Expr> PostCondition::getBase() const{
	return this->base;
}

ref<Expr> PostCondition::getValue() const{
	return this->value;
}

void PostCondition::setValue(ref<Expr> _value){
	this->value = _value;
}


ITree::ITree(ExecutionState* _root) :
    currentINode(0),
    root(new ITreeNode(0, _root)) {}

ITree::~ITree() {}

bool ITree::checkCurrentStateSubsumption(TimingSolver *solver,
                                         ExecutionState& state,
                                         double timeout) {
  assert(state.itreeNode == currentINode);

  for (std::vector<SubsumptionTableEntry>::iterator it = subsumptionTable.begin();
      it != subsumptionTable.end(); it++) {
      if (it->subsumed(solver, state, timeout)) {

	  /// We mark as subsumed such that the node will not be
	  /// stored into table (the table already contains a more
	  /// general entry).
	  currentINode->isSubsumed = true;

	  return true;
      }
  }
  return false;
}

std::vector<SubsumptionTableEntry> ITree::getStore() {
  return subsumptionTable;
}

void ITree::store(SubsumptionTableEntry subItem) {
  subsumptionTable.push_back(subItem);
}

void ITree::setCurrentINode(ITreeNode *node) {
  currentINode = node;
}

void ITree::remove(ITreeNode *node) {
  assert(!node->left && !node->right);
  do {
    ITreeNode *p = node->parent;

    /// As the node is about to be deleted, it must have been completely
    /// traversed, hence the correct time to table the interpolant.
    if (!node->isSubsumed && node->introducesMarkedConstraint()) {
      SubsumptionTableEntry entry(node);
      store(entry);
    }

    delete node;
    if (p) {
      if (node == p->left) {
        p->left = 0;
      } else {
        assert(node == p->right);
        p->right = 0;
      }
    }
    node = p;
  } while (node && !node->left && !node->right);
}

void ITree::markPathCondition(std::vector< ref<Expr> > unsat_core) {
  /// Simply return in case the unsatisfiability core is empty
  if (unsat_core.size() == 0)
      return;

  /// Process the unsat core in case it was computed (non-empty)
  PathCondition *pc = currentINode->pathCondition;

  if (pc != 0) {
      for (std::vector< ref<Expr> >::reverse_iterator it = unsat_core.rbegin();
	  it != unsat_core.rend(); it++) {
	  while (pc != 0) {
	      if (pc->car().compare(it->get()) == 0) {
		  pc->includeInInterpolant();
		  pc = pc->cdr();
		  break;
	      }
	      pc = pc->cdr();
	  }
	  if (pc == 0) break;
      }
  }
}

bool ITree::checkUpdateRelationTable(unsigned int _nodeId, unsigned int _nodeDest, ref<Expr> _valueExpr, ref<Expr> _relationFrom, ref<Expr> _relationDest, ExpressionType _expressionType){

	//update existing record in the table
	for(std::vector<RelationInterPath>::iterator it = relationTable.begin(); it != relationTable.end(); it++){

		if(it->getValueExpr() == _valueExpr && it->getRelationFrom() == _relationFrom
				&& it->getRelationDest() == _relationDest && it->getExpressionType() == _expressionType){

				it->addRelationNodeList(std::make_pair(_nodeId, _nodeDest));
				return false;
		}
	}

	//add new record in the table
	relationTable.push_back(RelationInterPath(_nodeId, _nodeDest, _valueExpr, _relationFrom, _relationDest, _expressionType));

}

void ITree::recordBlock(Instruction *inst) {
  blockTable.add(inst);
}

void ITree::dumpBlock() {
  blockTable.dump();
}

void ITree::printNode(llvm::raw_ostream& stream, ITreeNode *n, std::string edges) {
  if (n->left != 0) {
      stream << edges << "+-- L:" << n->left->nodeId;
      if (this->currentINode == n->left) {
	  stream << " (active)";
      }
      stream << "\n";
      if (n->right != 0) {
	  printNode(stream, n->left, edges + "|   ");
      } else {
	  printNode(stream, n->left, edges + "    ");
      }
  }
  if (n->right != 0) {
      stream << edges << "+-- R:" << n->right->nodeId;
      if (this->currentINode == n->right) {
	  stream << " (active)";
      }
      stream << "\n";
      printNode(stream, n->right, edges + "    ");
  }
}

void ITree::print(llvm::raw_ostream& stream) {
  llvm::errs() << "------------------------- ITree Structure ---------------------------\n";
  stream << this->root->nodeId;
  if (this->root == this->currentINode) {
      stream << " (active)";
  }
  stream << "\n";
  this->printNode(stream, this->root, "");
}

void ITree::dump() {
  this->print(llvm::errs());
}

ITreeNode::ITreeNode(ITreeNode *_parent,
                     ExecutionState *_data)
: parent(_parent),
  left(0),
  right(0),
  nodeId(0),
  isSubsumed(false),
  data(_data),
  interpolant(){

  pathCondition = (_parent != 0) ? _parent->pathCondition : 0;

  if (!(_data->constraints.empty())) {
      ref<Expr> lastConstraint = _data->constraints.back();
      if (pathCondition == 0) {
	  pathCondition = new PathCondition(lastConstraint);
      } else if (pathCondition->car().compare(lastConstraint) != 0) {
	  pathCondition = new PathCondition(lastConstraint, pathCondition);
      }
  }
}

ITreeNode::~ITreeNode() {
  delete pathCondition;
}

unsigned int ITreeNode::getNodeId() {
  return nodeId;
}

void ITreeNode::setInterpolant(Interpolant * _interpolant){
  this->interpolant = _interpolant;
}

std::vector< ref<Expr> > ITreeNode::getInterpolant() const {
  return this->pathCondition->packInterpolant();
}

Interpolant * ITreeNode::getNewInterpolant(){
	return this->interpolant;
}

ITreeNode * ITreeNode::getParent(){
	return this->parent;
}

ITreeNode * ITreeNode::getLeft(){
	return this->left;
}

ITreeNode * ITreeNode::getRight(){
	return this->right;
}

bool ITreeNode::IsUpdatePostConditions(ref<Expr> _base, ref<Expr> _value){

	for(std::vector< PostCondition >::iterator it = postConditions.begin(); it != postConditions.end(); ++it){
		if(it->getBase() == _base){
			it->setValue(_value);
			return true;
		}
	}

	PostCondition newEntry(_base, _value);
	postConditions.push_back(newEntry);

	return false;
}


void ITreeNode::addRelation(ref<Expr> _leftExpr, ref<Expr> _rightExpr, ExpressionType exprType, ref<Expr> _relationFrom,
													ref<Expr> _relationTo, bool _isAdded){
	this->packRelation.push_back(TransferRelationEntry(_leftExpr, _rightExpr, exprType, _relationFrom, _relationTo, true));
}

void ITreeNode::addPackRelation(std::vector< TransferRelationEntry > packRelation){

    for (std::vector< TransferRelationEntry >::iterator it = packRelation.begin() ;
    		it != packRelation.end(); ++it){
    	it->setIsAdded(false);
    	this->packRelation.push_back(*it);
    }
}

std::vector<TransferRelationEntry> ITreeNode::getPackRelation() const{
	return packRelation;
}

void ITreeNode::setNodeLocation(unsigned int programPoint) {
  if (this->nodeId == 0)  {
    this->nodeId = programPoint;
  }
}

void ITreeNode::split(ExecutionState *leftData, ExecutionState *rightData) {
  assert (left == 0 && right == 0);
  leftData->itreeNode = left = new ITreeNode(this, leftData);
  rightData->itreeNode = right = new ITreeNode(this, rightData);

  left->addPackRelation(left->parent->getPackRelation());
  right->addPackRelation(right->parent->getPackRelation());

//  llvm::errs() <<"when split, print the postcondition \n";
//  for(std::vector< PostCondition >::iterator it = postConditions.begin(); it != postConditions.end(); ++it){
//	llvm::errs() << "base \n";
//    it->getBase()->dump();
//    llvm::errs() << "value \n";
//    it->getValue()->dump();
//    for(unsigned int i = 0; i < it->getValue()->getNumKids(); i++){
//        llvm::errs() << "kids: \n";
//		it->getValue()->getKid(i)->dump();
//    }
//    if(it->getValue()->getKind() == Expr::Add){
//    	llvm::errs() << "add expr \n";
//
//    }
//
//
//  }

}

std::map< ref<Expr>, PathConditionMarker *> ITreeNode::makeMarkerMap() {
  std::map< ref<Expr>, PathConditionMarker *> result;
  for (PathCondition *it = pathCondition; it != 0; it = it->cdr()) {
      result.insert( std::pair< ref<Expr>, PathConditionMarker *>
	(it->car(), new PathConditionMarker(it)) );
  }
  return result;
}

bool ITreeNode::introducesMarkedConstraint() {
  if (parent != 0 &&
      pathCondition != parent->pathCondition &&
      pathCondition->carInInterpolant()) {
      return true;
  }
  return false;
}


void ITreeNode::dump() const {
  llvm::errs() << "\n------------------------- ITree Node --------------------------------\n";
  this->print(llvm::errs());
}

void ITreeNode::print(llvm::raw_ostream &stream) const {
  this->print(stream, 0);
}

void ITreeNode::print(llvm::raw_ostream &stream, const unsigned int tab_num) const {
  std::string tabs = make_tabs(tab_num);
  std::string tabs_next = tabs + "\t";

  stream << tabs << "ITreeNode\n";
  stream << tabs_next << "node Id = " << nodeId << "\n";
  stream << tabs_next << "pathCondition = ";
  if (pathCondition == 0) {
      stream << "NULL";
  } else {
      pathCondition->print(stream);
  }
  stream << "\n";
  stream << tabs_next << "Left:\n";
  if (!left) {
      stream << tabs_next << "NULL\n";
  } else {
      left->print(stream, tab_num + 1);
      stream << "\n";
  }
  stream << tabs_next << "Right:\n";
  if (!right) {
      stream << tabs_next << "NULL\n";
  } else {
      right->print(stream, tab_num + 1);
      stream << "\n";
  }
}


