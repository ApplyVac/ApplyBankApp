#import "CityCell.h"

#PRAGMA MARK: IMPORT

#import "CityViewModel.h"
#import "Layout.h"
#import "CityUi.h"
#import "Label.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface CityCell()

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *bestBidLabel;
@property (nonatomic, strong) UILabel *bestAskLabel;
@property (nonatomic, strong) UILabel *avgBidLabel;
@property (nonatomic, strong) UILabel *avgAskLabel;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation CityCell

#PRAGMA MARK: PUBLIC

- (void)configure:(CityViewModel *)viewModel {
  self.cityLabel.text = [NSString stringWithFormat: @"%@: %@", viewModel.title, @(viewModel.banksCount)];
  self.bestBidLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityBestBid, @(viewModel.bestBid)];
  self.bestAskLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityBestAsk, @(viewModel.bestAsk)];
  self.avgBidLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityAvgBid, @(viewModel.avgBid)];
  self.avgAskLabel.text = [NSString stringWithFormat: @"%@: %@", Label.cityAvgAsk, @(viewModel.avgAsk)];
}

#PRAGMA MARK: INIT

- (void)commonInit {
  UIView *root = self.contentView;
  
  UILabel *cityLabel = [[UILabel alloc] init];
  [root addSubview:cityLabel];
  [cityLabel left:root dx:Ui.margin];
  [cityLabel right:root dx:Ui.margin];
  [cityLabel top:root dy:CityUi.labelSpacing];
  [cityLabel height:CityUi.labelHeight];
  cityLabel.textAlignment = NSTextAlignmentLeft;
  cityLabel.font = CityUi.labelFont;
  cityLabel.textColor = CityUi.labelColor;
  self.cityLabel = cityLabel;
  
  UILabel *bestBidLabel = [[UILabel alloc] init];
  [root addSubview:bestBidLabel];
  [bestBidLabel left:root dx:Ui.margin];
  [bestBidLabel right:root dx:Ui.margin];
  [bestBidLabel under:cityLabel dy:CityUi.labelSpacing];
  [bestBidLabel height:CityUi.labelHeight];
  bestBidLabel.textAlignment = NSTextAlignmentLeft;
  bestBidLabel.font = CityUi.labelFont;
  bestBidLabel.textColor = CityUi.labelColor;
  self.bestBidLabel = bestBidLabel;
  
  UILabel *bestAskLabel = [[UILabel alloc] init];
  [root addSubview:bestAskLabel];
  [bestAskLabel left:root dx:Ui.margin];
  [bestAskLabel right:root dx:Ui.margin];
  [bestAskLabel under:bestBidLabel dy:CityUi.labelSpacing];
  [bestAskLabel height:CityUi.labelHeight];
  bestAskLabel.textAlignment = NSTextAlignmentLeft;
  bestAskLabel.font = CityUi.labelFont;
  bestAskLabel.textColor = CityUi.labelColor;
  self.bestAskLabel = bestAskLabel;
  
  UILabel *avgBidLabel = [[UILabel alloc] init];
  [root addSubview:avgBidLabel];
  [avgBidLabel left:root dx:Ui.margin];
  [avgBidLabel right:root dx:Ui.margin];
  [avgBidLabel under:bestAskLabel dy:CityUi.labelSpacing];
  [avgBidLabel height:CityUi.labelHeight];
  avgBidLabel.textAlignment = NSTextAlignmentLeft;
  avgBidLabel.font = CityUi.labelFont;
  avgBidLabel.textColor = CityUi.labelColor;
  self.avgBidLabel = avgBidLabel;
  
  UILabel *avgAskLabel = [[UILabel alloc] init];
  [root addSubview:avgAskLabel];
  [avgAskLabel left:root dx:Ui.margin];
  [avgAskLabel right:root dx:Ui.margin];
  [avgAskLabel under:avgBidLabel dy:CityUi.labelSpacing];
  [avgAskLabel height:CityUi.labelHeight];
  avgAskLabel.textAlignment = NSTextAlignmentLeft;
  avgAskLabel.font = CityUi.labelFont;
  avgAskLabel.textColor = CityUi.labelColor;
  self.avgAskLabel = avgAskLabel;
}

@end