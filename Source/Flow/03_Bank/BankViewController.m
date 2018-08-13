#import "BankViewController.h"

#PRAGMA MARK: IMPORT

#import "CurrViewController.h"
#import "CityViewModel.h"
#import "BankTitleCell.h"
#import "BankCell.h"
#import "Layout.h"
#import "BankUi.h"
#import "Types.h"
#import "Label.h"
#import "Bank.h"
#import "Curr.h"
#import "Img.h"

#PRAGMA MARK: TYPES

typedef BankTitleCell TitleCell;
typedef BankCell Cell;
typedef BankUi BUi;

#PRAGMA MARK: SORT

typedef enum { BankSortBestSell, BankSortBestBuy } BankSort;
static const BankSort kDefaultSort = BankSortBestBuy;

BankSort invertedSort(BankSort sort) {
  switch (sort) {
    case BankSortBestBuy: return BankSortBestSell;
    case BankSortBestSell: return BankSortBestBuy;
  }
}

#PRAGMA MARK: INTERFACE

@interface BankViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BankSort bankSort;
@property (nonatomic, strong) NSArray<Bank *> *banks;
@property (nonatomic, strong) NSArray<Bank *> *sortedBanks; // should not be updated directly

@property (nonatomic, strong) CityViewModel *cityViewModel;
@property (nonatomic, strong) Grid *collectionView;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation BankViewController

#PRAGMA MARK: INIT

- (instancetype)initWithCityViewModel:(CityViewModel *)viewModel banks:(NSArray<Bank *> *)banks {
  self = [super initWithNibName:nil bundle:nil];
  self.collectionView = Ui.verticalCv;
  self.cityViewModel = city;
  [self configureBanks:banks sort:kDefaultSort];
  return self;
}

#PRAGMA MARK: LIFE CYCLE

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configure];
}

- (void)configureBanks:(NSArray<Bank *> *)banks sort:(BankSort)sort {
  self.bankSort = sort;
  self.banks = banks;
  
  // to do: verify sorting algorythm
  
  Currency *currency = [Preferences makeDeserialized].currency;
  self.sortedBanks = [self.banks sortedArrayUsingComparator:^(Bank *b1, Bank *b2){
    Curr *c1 = [b1 currForCode:currency.code];
    Curr *c2 = [b2 currForCode:currency.code];
    if (!c1 || !c2) { return NSOrderedSame; }
    switch (sort) {
      case BankSortBestBuy: return [@(c1.bid) compare:@(c2.bid)];
      case BankSortBestSell: return [@(c2.ask) compare:@(c1.ask)];
    }
  }];
  
  [self.collectionView reloadData];
}

#PRAGMA MARK: COLLECTION VIEW DATA SOURCE

- (NSInteger)collectionView:(Grid *)view numberOfItemsInSection:(NSInteger)section {
  return self.sortedBanks.count + BUi.titleIdxOffset;
}

- (UICollectionViewCell *)collectionView:(Grid *)grid cellForItemAtIndexPath:(Path *)path {
  if (!path.row) {
    TitleCell *cell = (id)[grid dequeueReusableCellWithReuseIdentifier:BUi.titleCellId forIndexPath:path];
    [cell configure:self.cityViewModel];
    return cell;
  }
  
  Cell *cell = (id)[grid dequeueReusableCellWithReuseIdentifier:BUi.cellId forIndexPath:path];
  [cell configure:self.sortedBanks[path.row - BUi.titleIdxOffset]];
  return cell
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE

- (void)collectionView:(Grid *)grid didSelectItemAtIndexPath:(Path *)path {
  if (path.row) { [self navigateToBank:self.sortedBanks[path.row - BUi.titleIdxOffset]]; }
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE FLOW LAYOUT

- (CGSize)collectionView:(Grid *)grid layout:(Layout *)layout sizeForItemAtIndexPath:(Path *)path {
  return path.row ? BUi.cellSize : BUi.titleCellSize;
}

#PRAGMA MARK: ACTION

- (void)sortButtonTap {
  [self configureBanks:self.banks sort:invertedSort(self.bankSort)];
}

- (void)navigateToBank:(Bank *)bank {
  CurrViewController *vc = [[CurrViewController alloc] initWithBank:bank];
  [self.navigationController pushViewController:vc animated:YES];
}

#PRAGMA MARK: CONFIGURATION

- (void)configure {
  [self configureSortButton];
  [self configureBackground];
  [self configureGrid];
}

- (void)configureBackground {
  UIView *root = self.view;
  [root width:Ui.fullWidth];
  [root height:Ui.fullHeight];
  
  UIView *bg = [[UIView alloc] initWithFrame:Ui.fullBounds];
  [root addSubview:bg];
  [bg top:root dy:Ui.attach];
  [bg left:root dx:Ui.attach];
  [bg width:Ui.fullWidth];
  [bg height:Ui.fullHeight];
  bg.backgroundColor = UIColor.clear;
  
  UIImageView *bgIv = [[UIImageView alloc] initWithFrame:Ui.fullBounds];
  [bg addSubview:bgIv];
  [bgIv top:bg dy:Ui.attach];
  [bgIv left:bg dx:Ui.attach];
  [bgIv width:Ui.fullWidth];
  [bgIv height:Ui.fullHeight];
  bgIv.contentMode = UIViewContentModeScaleAspectFill;
  bgIv.image = Img.initialBg;
  
  UIView *dim = [[UIView alloc] initWithFrame:Ui.fullBounds];
  [bg addSubview:bgIv];
  [dim top:bg dy:Ui.attach];
  [dim left:bg dx:Ui.attach];
  [dim width:Ui.fullWidth];
  [dim height:Ui.fullHeight];
  dim.backgroundColor = IUi.dimColor;
}

- (void)configureGrid {
  UIView *root = self.view;
  Grid *cv = self.collectionView;
  [root addSubview:cv];
  [cv top:root dy:Ui.attach];
  [cv left:root dx:Ui.attach];
  [cv width:Ui.fullWidth];
  [cv height:Ui.fullHeight];
  cv.backgroundColor = UIColor.clearColor;
  cv.alwaysBounceVertical = YES;
  [cv registerClass:[TitleCell class] forCellWithReuseIdentifier:BUi.titleCellId];
  [cv registerClass:[Cell class] forCellWithReuseIdentifier:BUi.cellId];
  cv.dataSource = self;
  cv.delegate = self;
  [cv reloadData];
}

- (void)configureSortButton {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:Label.bankSortButton forState:UIControlStateNormal];
  [button addTarget:self action:@selector(sortButtonTap) forControlEvents:UIControlEventTouchUpInside];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end