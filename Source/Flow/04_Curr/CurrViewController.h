#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class Bank;

#PRAGMA MARK: CURR VIEW CONTROLLER

@interface CurrViewController: UIViewController

- (instancetype)initWithBank:(Bank *)bank;

@end