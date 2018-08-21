
#include "TxStoreUtils.h"
using namespace klee;

void TxStoreUtils::printTopInterpolantStore(
    TxStore::TopInterpolantStore tiStore) {
  for (TxStore::TopInterpolantStore::const_iterator is1 = tiStore.begin(),
                                                    ie1 = tiStore.end(),
                                                    it1 = is1;
       it1 != ie1; ++it1) {
    for (TxStore::LowerInterpolantStore::const_iterator
             is2 = it1->second.begin(),
             ie2 = it1->second.end(), it2 = is2;
         it2 != ie2; ++it2) {

    }
  }
}
