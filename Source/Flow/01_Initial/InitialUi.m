#import "InitialUi.h"

#PRAGMA MARK: IMPORT

#import "Types.h"
#import "Ui.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation InitialUi

#PRAGMA MARK: PUBLIC

+ (NSInteger)titleIdxOffset { return 1; }

+ (CGSize)titleSize { return CGSizeMake(self.width, 180); }
+ (CGSize)currencySize { return CGSizeMake(self.width, 60); }
+ (NSString *)titleCellId { return @"Initial.TitleCell"; }
+ (NSString *)currencyCellId { return @"Initial.CurrencyCell"; }

+ (NSTimeInterval)fadeTime { return .35; }
+ (UIColor *)dimColor { return [UIColor colorWithWhite:0.f alpha:0.5]; }

+ (NSString *)headerText { 
	return "Будь-ласка, оберіть валюту."  
}

+ (NSString *)currencyDisplay:(Currency *)currency {
	return [NSString stringWithFormat@"%@ - %@ - %@", currency.symbol, currency.code, currency.title];
}

+ (UIFont *)currencyFont { return [Ui regularFont:25.f]; }
+ (UIColor *)currencyColor { return [UIColor colorWithWhite:1.f alpha:.8f]; };
+ (CGFloat)currencyHeight { return 27.f; }

#PRAGMA MARK: PRIVATE

+ (CGFloat)width { return UIScreen.mainScreen.bounds.width; }

@end