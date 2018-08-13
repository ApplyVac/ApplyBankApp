#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class InitialViewController, Currency;
typedef void(^InitialCallback)(InitialViewController, Currency);

#PRAGMA MARK: INITIAL VIEW CONTROLLER

@interface InitialViewController: UIViewController

@property (nonatomic, copy) InitialCallback callback;

- (instancetype)initWithCurrencies:(NSArray<Currency *> *)currencies;

- (void)fadeIn:(void (^)(void))completion;
- (void)fadeOut:(void (^)(void))completion;

@end
