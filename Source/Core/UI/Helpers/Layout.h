#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

typedef NSLayoutConstraint UiPin;

#PRAGMA MARK: UIVIEW LAYOUT

@interface UIView(Layout)

#PRAGMA MARK: EDGES

- (UiPin *)top:(UIView *)view dy:(CGFloat)dy;
- (UiPin *)bottom:(UIView *)view dy:(CGFloat)dy;
- (UiPin *)left:(UIView *)view dx:(CGFloat)dx;
- (UiPin *)right:(UIView *)view dx:(CGFloat)dx;

- (UiPin *)above:(UIView *)view dy:(CGFloat)dy;
- (UiPin *)under:(UIView *)view dy:(CGFloat)dy;
- (UiPin *)after:(UIView *)view dx:(CGFloat)dx;
- (UiPin *)before:(UIView *)view dx:(CGFloat)dx;

#PRAGMA MARK: CENTER

- (UiPin *)cx:(UIView *)view dx:(CGFloat)dx;
- (UiPin *)cy:(UIView *)view dy:(CGFloat)dy;
- (void)cxy:(UIView *)view;

#PRAGMA MARK: SIZE

- (UiPin *)width:(CGFloat)value;
- (UiPin *)height:(CGFloat)value;

@end