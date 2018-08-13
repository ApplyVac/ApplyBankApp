#import "AppRouter.h"

#PRAGMA MARK: IMPORT

#import "InitialViewController.h"
#import "CityViewController.h"
#import "Preferences.h
#import "Types.h"

#PRAGMA MARK: TYPES

typedef InitialViewController InitVc;
typedef CityViewController CityVc;

#PRAGMA MARK: INTERFACE

@interface AppRouter()

@property (nonatomic, weak) UIWindow *window;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation AppRouter

#PRAGMA MARK: INIT

- (instancetype)initWithWindow:(UIWindow *)window {
	self = [super init];
	self.window = window;
	return self;
}

#PRAGMA MARK: PUBLIC

- (void)start {
	UIWindow *win = self.window;
	win.backgroundColor = Ui.windowColor;
	win.rootViewController = [Preferences makeDeserialized] ? self.makeRootVc : self.makeInitialVc;
	[win makeKeyAndVisible];
}

#PRAGMA MARK: INITIAL FLOW

- (void)showInitial {
	self.window.rootViewController = self.makeInitialVc;
}

- (InitVc *)makeInitialVc {
	InitVc *vc = [[InitVc alloc] initWithCurrencies:Currency.currencies];
	__weak typeof(self) wself = self;
	vc.callback = ^(InitVc *completeVc, Currency *currency){ [wself completeInitial:currency]; };
	return vc;
}

- (void)completeInitial:(Currency *)currency {
	Preferences *prefs = [Preferences makeDefault];
	prefs.currency = currency;
	[prefs serialize];
	self.window.rootViewController = self.makeRootVc;
}

#PRAGMA MARK: MAIN FLOW

- (UINavigationController *)makeRootVc {
	CityVc *vc = [[CityVc alloc] init];
	__weak typeof(self) wself = self;
	vc.currencyCompletion = ^(CityVc *cityVc){ [wself showInitial]; }
	return [[UINavigationController alloc] initWithRootViewController:vc];
}

@end