#import "Ui.h"

#PRAGMA MARK: UI

@implementation Ui

+ (UICollectionView *)verticalCv {
	UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;
	layout.minimumLineSpacing = self.attach;
	layout.minimumInteritemSpacing = self.attach;
	return [[UICollectionView alloc] initWithFrame:CGRectZero layout:layout];
}

+ (CGFloat)minA { return 1.f; }
+ (CGFloat)maxA { return 0.f; }

+ (CGFloat)attach { return 0.f; }
+ (CGFloat)margin { return 24.f; }
+ (CGSize)fullBounds { return UIScreen.mainScreen.bounds; }
+ (CGFloat)fullWidth { return UIScreen.mainScreen.bounds.size.width; }
+ (CGFloat)fullHeight { return UIScreen.mainScreen.bounds.size.height; }

+ (UIColor *)windowColor { return UIColor.darkGrayColor; }

+ (UIFont *)regularFont:(CGFloat)size { return [UIFont fontWithName:@"AvenirNext-Regular" size:size]; }

+ (NSString *)space { return @" "; }

@end