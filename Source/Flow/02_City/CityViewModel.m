#import "CityViewModel.h"

#PRAGMA MARK: IMPORT

#import "Types.h"
#import "Info.h"
#import "Bank.h"
#import "Curr.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation CityViewModel

#PRAGMA MARK: STATIC

+ (NSArray<CityViewModel *> *)makeViewModels:(Info *)info currency:(Currency *)currency {
  NSArray<CityViewModel *> *output = @[].mutableCopy;
  
  for (City *city in info.cities) {
    CityViewModel *vm = [[CityViewModel alloc] init];
    vm.identifier = city.identifier;
    vm.title = city.title;
    
    // to do: verify best values calculating algorythm
    
    NSArray<Bank *> *cityBanks = [info banksForCityId:city.identifier];
    if (cityBanks.isEmpty) { [output addObject:vm]; continue; }
    
    Bank *firstBank = cityBanks.firstObject;
    CGFloat bestBid = firstBank.bid;
    CGFloat bestAsk = firstBank.ask;
    CGFloat bidBuf = 0.f;
    CGFloat askBuf = 0.f;
    NSInteger bufSize = 0;
    
    for (Bank *bank in cityBanks) {
      Curr *curr = [bank currForCode:currency.code];
      if (!curr) { continue; }
      if (bank.bid < bestBid) { bestBid = bank.bid; }
      if (bank.ask > bestAsk) { bestAsk = bank.ask; }
      bidBuf += bank.bid;
      askBuf += bank.ask;
      bufSize += 1;
    }
    
    if (!bufSize) { [output addObject:vm]; continue; }
    
    vm.banksCount = cityBanks.count;
    vm.bestBid = bestBid;
    vm.bestAsk = bestAsk;
    vm.avgBid = bidBuf / (CGFloat)bufSize;
    vm.avgAsk = askBuf / (CGFloat)bufSize;
    
    [output addObject:vm];
  }
  
  return output;
}

@end