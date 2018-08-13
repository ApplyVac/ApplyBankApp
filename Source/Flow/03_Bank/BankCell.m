#import "BankCell.h"

#PRAGMA MARK: IMPORT

#import "Layout.h"
#import "BankUi.h"
#import "Bank.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface BankCell()

@property (nonatomic, strong) UILabel *bankLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation BankCell

#PRAGMA MARK: PUBLIC

- (void)configure:(Bank *)bank {
  self.bankLabel.text = bank.title;
  self.priceLabel.text = bank.address;
}

#PRAGMA MARK: INIT

- (void)commonInit {
  UIView *root = self.contentView;
  
  UILabel *bankLabel = [[UILabel alloc] init];
  [root addSubview:bankLabel];
  [bankLabel left:root dx:Ui.margin];
  [bankLabel right:root dx:Ui.margin];
  [bankLabel top:root dy:BankUi.labelSpacing];
  [bankLabel height:BankUi.labelHeight];
  bankLabel.textAlignment = NSTextAlignmentLeft;
  bankLabel.font = BankUi.labelFont;
  bankLabel.textColor = BankUi.labelColor;
  self.bankLabel = bankLabel;
  
  UILabel *priceLabel = [[UILabel alloc] init];
  [root addSubview:priceLabel];
  [priceLabel left:root dx:Ui.margin];
  [priceLabel right:root dx:Ui.margin];
  [priceLabel under:bankLabel dy:BankUi.labelSpacing];
  [priceLabel height:BankUi.labelHeight];
  priceLabel.textAlignment = NSTextAlignmentLeft;
  priceLabel.font = BankUi.labelFont;
  priceLabel.textColor = BankUi.labelColor;
  self.bidLabel = priceLabel;
}

@end