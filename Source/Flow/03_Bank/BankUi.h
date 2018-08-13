#import <UIKit/UIKit.h>

#PRAGMA MARK: BANK UI

@interface BankUi: NSObject

+ (NSInteger)titleIdxOffset;

+ (NSString *)titleCellId;
+ (NSString *)cellId;

+ (CGFloat)labelHeight;
+ (CGFloat)labelSpacing;

+ (CGSize)cellSize;
+ (CGSize)titleCellSize;

+ (UIColor *)labelColor;
+ (UIFont *)labelFont;

@end