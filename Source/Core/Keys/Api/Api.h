#import <Foundation/Foundation.h>

#PRAGMA MARK: API

@interface Api: NSObject

+ (NSString *)infoUrlUa;
+ (NSString *)infoUrlRu;

+ (NSString *)keyDate;
+ (NSString *)keyOrganizations;
+ (NSString *)keyCities;

+ (NSString *)keyId;
+ (NSString *)keyTitle;
+ (NSString *)keyCityId;
+ (NSString *)keyAddress;
+ (NSString *)keyPhone;
+ (NSString *)keyCurrencies;

+ (NSString *)keyAsk;
+ (NSString *)keyBid;

@end