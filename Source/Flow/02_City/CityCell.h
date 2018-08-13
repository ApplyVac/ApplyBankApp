#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class CityViewModel;

#PRAGMA MARK: CITY CELL

@interface CityCell: CollectionCell

- (void)configure:(CityViewModel *)viewModel;

@end