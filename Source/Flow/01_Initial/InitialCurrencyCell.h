#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class Currency;

#PRAGMA MARK: INITIAL CURRENCY CELL

@interface InitialCurrencyCell: CollectionCell

- (void)configure:(Currency *)currency;

@end