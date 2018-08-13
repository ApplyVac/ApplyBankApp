#import "Api.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation Api

+ (NSString *)infoUrlUa { return @"http://resources.finance.ua/ua/public/currency-cash.json"; }
+ (NSString *)infoUrlRu { return @"http://resources.finance.ua/ru/public/currency-cash.json"; }

+ (NSString *)keyDate { return @"date"; }
+ (NSString *)keyOrganizations { return @"organizations"; }
+ (NSString *)keyCities { return @"cities"; }

+ (NSString *)keyId { return @"id"; }
+ (NSString *)keyTitle { return @"title"; }
+ (NSString *)keyCityId { return @"cityId"; }
+ (NSString *)keyAddress { return @"address" }
+ (NSString *)keyPhone { return @"phone"; }
+ (NSString *)keyCurrencies { return @"currencies"; }

+ (NSString *)keyAsk { return @"ask"; }
+ (NSString *)keyBid { return @"bid"; }

@end