#import "CurrTitleCell.h"

#PRAGMA MARK: IMPORT

#import "CurrUi.h"
#import "Layout.h"
#import "Bank.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface CurrTitleCell()

@property (nonatomic, strong) UILabel *bankLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation CurrTitleCell

#PRAGMA MARK: PUBLIC

- (void)configure:(Bank *)bank {
	self.bankLabel.text = bank.title;
	self.addressLabel.text = bank.address;
}

#PRAGMA MARK: INIT

- (void)commonInit {
	UIView *root = self.contentView;
	
	UILabel *bankLabel = [[UILabel alloc] init];
	[root addSubview:bankLabel];
	[bankLabel left:root dx:Ui.margin];
	[bankLabel right:root dx:Ui.margin];
	[bankLabel top:root dy:CurrUi.labelSpacing];
	[bankLabel height:CurrUi.labelHeight];
	bankLabel.textAlignment = NSTextAlignmentLeft;
	bankLabel.font = CurrUi.labelFont;
	bankLabel.textColor = CurrUi.labelColor;
	self.bankLabel = bankLabel;
	
	UILabel *addressLabel = [[UILabel alloc] init];
	[root addSubview:addressLabel];
	[addressLabel left:root dx:Ui.margin];
	[addressLabel right:root dx:Ui.margin];
	[addressLabel under:bankLabel dy:CurrUi.labelSpacing];
	[addressLabel height:CurrUi.labelHeight];
	addressLabel.textAlignment = NSTextAlignmentLeft;
	addressLabel.font = CurrUi.labelFont;
	addressLabel.textColor = CurrUi.labelColor;
	self.addressLabel = addressLabel;
}

@end