#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class CityViewController;
typedef void (^CityChangeCurrencyCompletion)(CityViewController);

#PRAGMA MARK: CITY VIEW CONTROLLER

@interface CityViewController: UIViewController

@property (nonatomic, copy) CityChangeCurrencyCompletion completion;

@end