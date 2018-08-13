#import "Layout.h"

#PRAGMA MARK: IMPORT

#import "Ui.h"

#PRAGMA MARK: UIVIEW LAYOUT

@implementation UIView(Layout)

#PRAGMA MARK: EDGES

- (UiPin *)top:(UIView *)view dy:(CGFloat)dy {
	UiPin *pin = [self.topAnchor constraintEqualToAnchor:view.topAnchor constant:dy];
	pin.active = YES;
	return pin;
}

- (UiPin *)bottom:(UIView *)view dy:(CGFloat)dy {
	UiPin *pin = [self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor constant:dy];
	pin.active = YES;
	return pin;
}

- (UiPin *)left:(UIView *)view dx:(CGFloat)dx {
	UiPin *pin = [self.leadingAnchor constraintEqualToAnchor:view.leadingAnchor constant:dx];
	pin.active = YES;
	return pin;
}

- (UiPin *)right:(UIView *)view dx:(CGFloat)dx {
	UiPin *pin = [self.trailingAnchor constraintEqualToAnchor:view.trailingAnchor constant:dx];
	pin.active = YES;
	return pin;
}

- (UiPin *)above:(UIView *)view dy:(CGFloat)dy {
	UiPin *pin = [self.bottomAnchor constraintEqualToAnchor:view.topAnchor constant:dy];
	pin.active = YES;
	return pin;
}

- (UiPin *)under:(UIView *)view dy:(CGFloat)dy {
	UiPin *pin = [self.topAnchor constraintEqualToAnchor:view.bottomAnchor constant:dy];
	pin.active = YES;
	return pin;
}

- (UiPin *)after:(UIView *)view dx:(CGFloat)dx {
	UiPin *pin = [self.leadingAnchor constraintEqualToAnchor:view.trailingAnchor constant:dx];
	pin.active = YES;
	return pin;
}

- (UiPin *)before:(UIView *)view dx:(CGFloat)dx {
	UiPin *pin = [self.trailingAnchor constraintEqualToAnchor:view.leadingAnchor constant:dx];
	pin.active = YES;
	return pin;
}

#PRAGMA MARK: CENTER

- (UiPin *)cx:(UIView *)view dx:(CGFloat)dx {
	UiPin *pin = [self.centerXAnchor constraintEqualToAnchor:view.centerXAnchor constant:dx];
	pin.active = YES;
	return pin;
}

- (UiPin *)cy:(UIView *)view dy:(CGFloat)dx {
	UiPin *pin = [self.centerYAnchor constraintEqualToAnchor:view.centerYAnchor constant:dx];
	pin.active = YES;
	return pin;
}

- (void)cxy:(UIView *)view {
	[self cx:view dx:Ui.attach];
	[self cy:view dx:Ui.attach];
}

#PRAGMA MARK: SIZE

- (UiPin *)width:(CGFloat)value {
	UiPin *pin = [self.widthAnchor constraintEqualToConstant:value];
	pin.active = YES;
	return pin;
}

- (UiPin *)height:(CGFloat)value {
	UiPin *pin = [self.heightAnchor constraintEqualToConstant:value];
	pin.active = YES;
	return pin;
}

@end