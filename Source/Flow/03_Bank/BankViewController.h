#import <UIKit/UIKit.h>

#PRAGMA MARK: TYPES

@class CityViewModel, Bank;

#PRAGMA MARK: BANK VIEW CONTROLLER

@interface BankViewController: UIViewController

- (instancetype)initWithCityViewModel:(CityViewModel *)viewModel banks:(NSArray<Bank *> *)banks;

@end