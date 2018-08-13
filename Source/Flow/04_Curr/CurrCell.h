#import "CollectionCell.h"

#PRAGMA MARK: TYPES

@class Curr;

#PRAGMA MARK: CURR TITLE CELL

@interface CurrCell: CollectionCell

- (void)configure:(Curr *)curr;

@end