#import <Foundation/Foundation.h>

#PRAGMA MARK: TYPES

@class City, Bank;

#PRAGMA MARK: INFO

@interface Info: NSObject

@property (nonatomic, strong, readonly) NSString *dateString;
@property (nonatomic, strong, readonly) NSArray<City *> *cities;
@property (nonatomic, strong, readonly) NSArray<Bank *> *banks;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSArray<Bank *> *)banksForCityId:(NSString *)cityId;

@end