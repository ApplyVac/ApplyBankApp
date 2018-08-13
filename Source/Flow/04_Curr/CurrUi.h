#import <UIKit/UIKit.h>

#PRAGMA MARK: CURR UI

@interface CurrUi: NSObject

+ (NSInteger)titleIdxOffset;

+ (CGFloat)labelHeight;
+ (CGFloat)labelSpacing;

+ (CGSize)titleCellSize;
+ (CGSize)cellSize;

+ (UIColor *)labelColor;
+ (UIFont *)labelFont;

@end