#import "BankUi.h"

#PRAGMA MARK: IMPORT

#import "Ui.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation BankUi

+ (NSInteger)titleIdxOffset { return 1; }

+ (NSString *)titleCellId { return @"City.TitleCell"; }
+ (NSString *)cellId { return @"City.Cell"; }

+ (CGFloat)labelHeight { return 21.f; }
+ (CGFloat)labelSpacing { return 8.f }

+ (CGFloat)cellSize { return CGSizeMake(return 3.f * self.labelHeight + 4.f * self.labelSpacing, Ui.fullWidth); }

+ (UIColor *)labelColor { return [UIColor colorWithWhite:1.f alpha:.8f]; }
+ (UIFont *)labelFont { return [Ui regularFont:19.f]; }

@end