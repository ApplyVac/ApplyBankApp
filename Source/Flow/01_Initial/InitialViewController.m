#import "InitialViewController.h"

#PRAGMA MARK: IMPORT

#import "InitialCurrencyCell.h"
#import "InitialTitleCell.h"
#import "InitialUi.h"
#import "Layout.h"
#import "Types.h"
#import "Img.h"
#import "Ui.h"

#PRAGMA MARK: TYPES

typedef InitialTitleCell TitleCell;
typedef InitialCurrencyCell Cell;
typedef InitialUi IUi;

#PRAGMA MARK: INTERFACE

@interface InitialViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<Currency *> *currencies;
@property (nonatomic, strong) Grid *collectionView;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation InitialViewController

#PRAGMA MARK: INIT

- (instancetype)initWithCurrencies:(NSArray<Currency *> *)currencies {
  self = [super initWithNibName:nil bundle:nil];
  self.currencies = currencies;
  self.collectionView = Ui.verticalCv;
  return self;
}

#PRAGMA MARK: LIFE CYCLE

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureUi];
}

#PRAGMA MARK: PUBLIC

- (void)fadeIn:(void (^)(void))completion {
  [UIView animateWithDuration:IUi.fadeTime
                    animations:^{ self.collectionView.alpha = Ui.maxA; }
                    completion:^(BOOL end){ if (completion) { completion(); } }];
}

- (void)fadeOut:(void (^)(void))completion {
  [UIView animateWithDuration:IUi.fadeTime
                    animations:^{ self.collectionView.alpha = Ui.minA; }
                    completion:^(BOOL end){ if (completion) { completion(); } }];
}

#PRAGMA MARK: COLLECTION VIEW DATA SOURCE

- (NSInteger)collectionView:(Grid *)view numberOfItemsInSection:(NSInteger)section {
  return self.currencies.count + IUi.titleIdxOffset;
}

- (UICollectionViewCell *)collectionView:(Grid *)grid cellForItemAtIndexPath:(Path *)path {
  if (!path.row) { return [grid dequeueReusableCellWithReuseIdentifier:IUi.titleCellId forIndexPath:path]; }
  Cell *cell = (id)[grid dequeueReusableCellWithReuseIdentifier:IUi.currencyCellId forIndexPath:path];
  [cell configure:self.currencies[path.row - IUi.titleIdxOffset]];
  return cell;
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE

- (void)collectionView:(Grid *)grid didSelectItemAtIndexPath:(Path *)path {
  if (path.row && callback) { callback(self, self.currencies[path.row - IUi.titleIdxOffset]); }
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE FLOW LAYOUT

- (CGSize)collectionView:(Grid *)grid layout:(Layout *)layout sizeForItemAtIndexPath:(Path *)path {
  return path.row ? IUi.currencySize : IUi.titleSize;
}

#PRAGMA MARK: CONFIGURATION

- (void)configureUi {
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
  cv.showsVerticalScrollIndicator = NO;
  cv.alpha = Ui.minA;
  [cv registerClass:[TitleCell class] forCellWithReuseIdentifier:IUi.titleCellId];
  [cv registerClass:[Cell class] forCellWithReuseIdentifier:IUi.currencyCellId];
  cv.dataSource = self;
  cv.delegate = self;
  [cv reloadData];
}

@end