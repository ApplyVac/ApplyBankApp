#import <UIKit/UIKit.h>

#PRAGMA MARK: UI

@interface Ui: NSObject

+ (UICollectionView *)verticalCv;

+ (CGFloat)minA;
+ (CGFloat)maxA;

+ (CGFloat)attach;
+ (CGSize)fullBounds;
+ (CGFloat)fullWidth;
+ (CGFloat)fullHeight;
+ (CGFloat)margin;

+ (UIColor *)windowColor;

+ (UIFont *)regularFont:(CGFloat)size;

+ (NSString *)space;

@end