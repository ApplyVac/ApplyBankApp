#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class Bank;

#PRAGMA MARK: CURR TITLE CELL

@interface CurrTitleCell: CollectionCell

- (void)configure:(Bank *)bank;

@end