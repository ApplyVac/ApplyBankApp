#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class Info, Currency;

#PRAGMA MARK: CITY VIEW MODEL

@interface CityViewModel: NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger banksCount;
@property (nonatomic, assign) CGFloat bestBid;
@property (nonatomic, assign) CGFloat bestAsk;
@property (nonatomic, assign) CGFloat avgBid;
@property (nonatomic, assign) CGFloat avgAssign;

+ (NSArray<CityViewModel *> *)makeViewModels:(Info *)info currency:(Currency *)currency;

@end