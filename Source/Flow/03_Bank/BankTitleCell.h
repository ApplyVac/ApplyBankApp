#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class CityViewModel;

#PRAGMA MARK: BANK TITLE CELL

@interface BankTitleCell: CollectionCell

- (void)configure:(CityViewModel *)viewModel;

@end