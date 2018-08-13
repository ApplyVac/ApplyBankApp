#import "Bank.h"

#PRAGMA MARK: IMPORT

#import "Curr.h"
#import "Api.h"

#PRAGMA MARK: INTERFACE

@interface Bank()

@property (nonatomic, strong, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *cityId;
@property (nonatomic, strong, readwrite) NSString *address;
@property (nonatomic, strong, readwrite) NSString *phone;
@property (nonatomic, strong, readwrite) NSArray<Curr *> *currs;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation Bank

#PRAGMA MARK: INIT

- (instancetype)initWithJson:(NSDictionary *)json {
  self = [super init];
  self.identifier = json[Api.keyId];
  self.title = json[Api.keyTitle];
  self.cityId = json[Api.keyCityId];
  self.address = json[Api.keyAddress];
  self.phone = json[Api.keyPhone];
  self.currs = [Curr makeCurrs:json[Api.keyCurrencies]];
  return self;
}

#PRAGMA MARK: STATIC

+ (NSArray<Bank *> *)makeBanks:(NSArray<NSDictionary *> *)jsons {
  NSMutableArray<Bank *> *output = @[].mutableCopy;
  for (NSDictionary *json in jsons) {
    [output addObject:[[Bank alloc] initWithJson:json]];
  }
  return output;
}

#PRAGMA MARK: ACCESSOR

- (Curr *)currForCode:(NSString *)code {
  for (Curr *curr in self.currs) {
    if ([curr.code.lowercaseString isEqualToString:code.lowercaseString]) { 
      return curr; 
    }
  }
  return nil;
}

@end