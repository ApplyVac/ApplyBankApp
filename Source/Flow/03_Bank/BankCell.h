#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class Bank;

#PRAGMA MARK: BANK CELL

@interface BankCell: CollectionCell

- (void)configure:(Bank *)bank;

@end