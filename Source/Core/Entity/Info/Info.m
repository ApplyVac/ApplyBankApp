#import "Info.h"

#PRAGMA MARK: IMPORT

#import "City.h"
#import "Bank.h"
#import "Api.h"

#PRAGMA MARK: INTERFACE

@interface Info()

@property (nonatomic, strong, readwrite) NSString *dateString;
@property (nonatomic, strong, readwrite) NSArray<City *> *cities;
@property (nonatomic, strong, readwrite) NSArray<Bank *> *banks;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation Info

#PRAGMA MARK: INIT

- (instancetype)initWithJson:(NSDictionary *)json {
  self = [super init];
  self.dateString = json[Api.keyDate];
  self.cities = [City makeCities:json[Api.keyCities]];
  self.banks = [Bank makeBanks:json[Api.keyOrganizations]];
  return self;
}

#PRAGMA MARK: ACCESSOR

- (NSArray<Bank *> *)banksForCityId:(NSString *)cityId {
  NSArray<Bank *> *output = @[].mutableCopy;
  for (Bank *bank in self.banks) {
    if ([bank.cityId isEqualToString:cityId]) { [output addObject:bank]; }
  }
  return output;
}

@end