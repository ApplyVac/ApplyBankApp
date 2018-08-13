#import "BankTitleCell.h"

#PRAGMA MARK: IMPORT

#import "CityViewModel.h"
#import "Layout.h"
#import "BankUi.h"
#import "Label.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface BankTitleCell()

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *bidLabel;
@property (nonatomic, strong) UILabel *askLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation BankTitleCell

#PRAGMA MARK: PUBLIC

- (void)configure:(CityViewModel *)viewModel {
  self.cityLabel.text = [NSString stringWithFormat:@"%@: %@", viewModel.title, @(viewModel.banksCount)];
  self.bidLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityAvgBid, @(viewModel.avgBid)];
  self.askLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityAvgAsk, @(viewModel.avgAsk)];
}

#PRAGMA MARK: INIT

- (void)commonInit {
  UIView *root = self.contentView;
  
  UILabel *cityLabel = [[UILabel alloc] init];
  [root addSubview:cityLabel];
  [cityLabel left:root dx:Ui.margin];
  [cityLabel right:root dx:Ui.margin];
  [cityLabel top:root dy:BankUi.labelSpacing];
  [cityLabel height:BankUi.labelHeight];
  cityLabel.textAlignment = NSTextAlignmentLeft;
  cityLabel.font = BankUi.labelFont;
  cityLabel.textColor = BankUi.labelColor;
  self.cityLabel = cityLabel;
  
  UILabel *bestBidLabel = [[UILabel alloc] init];
  [root addSubview:bestBidLabel];
  [bestBidLabel left:root dx:Ui.margin];
  [bestBidLabel right:root dx:Ui.margin];
  [bestBidLabel under:cityLabel dy:BankUi.labelSpacing];
  [bestBidLabel height:BankUi.labelHeight];
  bestBidLabel.textAlignment = NSTextAlignmentLeft;
  bestBidLabel.font = BankUi.labelFont;
  bestBidLabel.textColor = BankUi.labelColor;
  self.bidLabel = bestBidLabel;
  
  UILabel *bestAskLabel = [[UILabel alloc] init];
  [root addSubview:bestAskLabel];
  [bestAskLabel left:root dx:Ui.margin];
  [bestAskLabel right:root dx:Ui.margin];
  [bestAskLabel under:bestBidLabel dy:BankUi.labelSpacing];
  [bestAskLabel height:BankUi.labelHeight];
  bestAskLabel.textAlignment = NSTextAlignmentLeft;
  bestAskLabel.font = BankUi.labelFont;
  bestAskLabel.textColor = BankUi.labelColor;
  self.askLabel = bestAskLabel;
}

@end