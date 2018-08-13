#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class Currency;

#PRAGMA MARK: INITIAL UI

@interface InitialUi: NSObject

+ (NSInteger)titleIdxOffset;

+ (CGSize)titleSize;
+ (CGSize)currencySize;
+ (NSString *)titleCellId;
+ (NSString *)currencyCellId;

+ (NSTimeInterval)fadeTime;
+ (UIColor *)dimColor;

+ (NSString *)headerText;
+ (NSString *)currencyDisplay:(Currency *)currency;
+ (UIFont *)currencyFont;
+ (UIColor *)currencyColor;
+ (CGFloat)currencyHeight;

@end