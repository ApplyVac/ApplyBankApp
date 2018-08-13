#import <Foundation/Foundation.h>

#PRAGMA MARK: TYPES

@class Curr;

#PRAGMA MARK: BANK

@interface Bank: NSObject

@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *cityId;
@property (nonatomic, strong, readonly) NSString *address;
@property (nonatomic, strong, readonly) NSString *phone;
@property (nonatomic, strong, readonly) NSArray<Curr *> *currs;

- (instancetype)initWithJson:(NSDictionary *)json;
+ (NSArray<Bank *> *)makeBanks:(NSArray<NSDictionary *> *)jsons;
- (Curr *)currForCode:(NSString *)code;

@end