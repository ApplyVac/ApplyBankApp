#import "CollectionCell.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation CollectionCell

#PRAGMA MARK: INIT

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame]; 
	[self commonInit];
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder]; 
	[self commonInit];
	return self;
}

- (void)commonInit {
	// оverride in subclasses, no need in super calls by design
}

@end