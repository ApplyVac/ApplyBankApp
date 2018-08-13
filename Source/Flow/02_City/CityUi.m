#import "CityUi.h"

#PRAGMA MARK: IMPORT

#import "Ui.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation CityUi

+ (NSString *)cellId { return @"City.Cell"; }

+ (CGFloat)labelHeight { return 21.f; }
+ (CGFloat)labelSpacing { return 8.f }
+ (CGFloat)cellSize { return 5.f * self.labelHeight + 6.f * self.labelSpacing; }
+ (UIColor *)labelColor { return [UIColor colorWithWhite:1.f alpha:.8f]; }
+ (UIFont *)labelFont { return [Ui regularFont:19.f]; }

@end