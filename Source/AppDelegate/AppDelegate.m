#import "AppDelegate.h"

#PRAGMA MARK: IMPORT

#import "AppRouter.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface AppDelegate()

@property (nonatomic, strong) AppRouter *router;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation AppDelegate

#PRAGMA MARK: APP DELEGATE PROTOCOL

- (BOOL)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)args {
	self.window = [[UIWindow alloc] initWithFrame:Ui.fullBounds];
	self.router = [[AppRouter alloc] initWithWindow:self.window];
	[self.router start];
	return YES;
}

@end