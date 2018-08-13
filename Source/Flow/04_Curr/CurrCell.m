#import "CurrCell.h"

#PRAGMA MARK: IMPORT

#import "CurrUi.h"
#import "Layout.h"
#import "Curr.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface CurrTitleCell()

@property (nonatomic, strong) UILabel *currLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation CurrTitleCell

#PRAGMA MARK: PUBLIC

- (void)configure:(Curr *)curr {
	self.currLabel.text = [NSString stringWithFormat:@"%@: %@ / %@", curr.code, @(curr.ask), @(curr.bid)];
}

#PRAGMA MARK: INIT

- (void)commonInit {
	UIView *root = self.contentView;
	UILabel *currLabel = [[UILabel alloc] init];
	[root addSubview:currLabel];
	[currLabel left:root dx:Ui.margin];
	[currLabel right:root dx:Ui.margin];
	[currLabel top:root dy:CurrUi.labelSpacing];
	[currLabel height:CurrUi.labelHeight];
	currLabel.textAlignment = NSTextAlignmentLeft;
	currLabel.font = CurrUi.labelFont;
	currLabel.textColor = CurrUi.labelColor;
	self.currLabel = currLabel;
}

@end