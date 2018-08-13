#import "InitialCurrencyCell.h"

#PRAGMA MARK: IMPORT

#import "InitialUi.h"
#import "Layout.h"
#import "Types.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface InitialCurrencyCell()

@property (nonatomic, strong) UILabel *currencyLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation InitialCurrencyCell

#PRAGMA MARK: PUBLIC

- (void)configure:(Currency *)currency {
  self.currencyLabel.text = [InitialUi currencyDisplay:currency];
}

#PRAGMA MARK: INIT

- (void)commonInit {
  UILabel *label = [[UILabel alloc] init];
  UIView *root = self.contentView;
  [root addSubview:label];
  [label left:root dx:Ui.margin];
  [label right:root dx:Ui.margin];
  [label cy:root, dy:Ui.attached];
  [label height:InitialUi.currencyHeight];
  label.textAlignment = NSTextAlignmentLeft;
  label.font = InitialUi.currencyFont;
  label.textColor = InitialUi.currencyColor;
  self.currencyLabel = label;
}

@end