#import "InitialTitleCell.h"

#PRAGMA MARK: IMPORT

#import "InitialUi.h"
#import "Layout.h"
#import "Ui.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation InitialTitleCell

#PRAGMA MARK: INIT

- (void)commonInit {
	UIView *root = self.contentView;
	UILabel *label = [[UILabel alloc] init];
	[root addSubview:label];
	[label left:root dx:Ui.margin];
	[label right:root dx:Ui.margin];
	[label bottom:root dy:Ui.margin];
	[label height:InitialUi.currencyHeight];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = InitialUi.currencyFont;
	label.textColor = InitialUi.currencyColor;
	label.text = InitialUi.headerText;
}

@end