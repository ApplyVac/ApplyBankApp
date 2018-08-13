#import "CurrUi.h"

#PRAGMA MARK: IMPORT

#import "Ui.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation CurrUi

+ (NSInteger)titleIdxOffset { return 1; }

+ (CGFloat)labelHeight { return 21.f; }
+ (CGFloat)labelSpacing { return 8.f; }

+ (CGSize)titleCellSize { return CGSizeMake(Ui.fullWidth, 3.f * self.labelSpacing + 2.f * self.labelHeight); }
+ (CGSize)cellSize { return CGSizeMake(Ui.fullWidth, 2.f * self.labelSpacing + self.labelHeight); }

+ (UIColor *)labelColor { return [UIColor colorWithWhite:1.f alpha:.8f]; }
+ (UIFont *)labelFont { return [Ui regularFont:19.f]; }

@en