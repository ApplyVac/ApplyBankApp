#import "CityViewController.h"

#PRAGMA MARK: IMPORT

#import "BankViewController.h"
#import "CityViewModel.h"
#import "InfoService.h"
#import "Preferences.h"
#import "CityCell.h"
#import "Label.h"
#import "Types.h"
#import "Bank.h"
#import "Info.h"
#import "Img.h"
#import "Ui.h"

#PRAGMA MARK: TYPES

typedef CityCell Cell;
typedef CityUi CUi;

#PRAGMA MARK: INTERFACE

@interface CityViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) Info *info;
@property (nonatomic, strong) NSArray<CityViewModel *> *viewModels;
@property (nonatomic, strong) Grid *collectionView;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation CityViewController

#PRAGMA MARK: INIT

- (instancetype)initWithNibName:(NSString *)name bundle:(NSBundle *)bundle {
  self = [super initWithNibName:name bundle:bundle]; 
  [self commomInit];
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  [self commonInit];
  return self;
}

- (void)commonInit {
  self.collectionView = Ui.verticalCv;
  self.viewModels = @[];
}

#PRAGMA MARK: LIFE CYCLE

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configure];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self loadInfo];
}

#PRAGMA MARK: LOADING

- (void)loadInfo {
  __weak typeof(self) wself = self;
  [InfoService loadInfoForLanguage:Language.main completion:^(Info *info){
    __strong typeof(wself) sself = wself;
    sself.info = info;
    sself.viewModels = [CityViewModel makeViewModels:info currency:Preferences.makeDeserialized.currency];
    [sself.collectionView reloadData];
    [sself fadeIn];
  }];
}

- (void)fadeIn {
  [UIView animateWithDuration:CUi.fadeTime animations:^{ self.collectionView.alpha = Ui.maxA; }];
}

#PRAGMA MARK: ACTION

- (void)changeCurrencyTap {
  if (self.completion) { self.completion(self); }
}

#PRAGMA MARK: COLLECTION VIEW DATA SOURCE

- (NSInteger)collectionView:(Grid *)view numberOfItemsInSection:(NSInteger)section {
  return self.viewModels.count;
}

- (UICollectionViewCell *)collectionView:(Grid *)view cellForItemAtIndexPath:(Path *)path {
  Cell *cell = (id)[view dequeueReusableCellWithReuseIdentifier:CUi.cellId forIndexPath:path];
  [cell configure:self.viewModels[path.row]];
  return cell
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE

- (void)collectionView:(Grid *)view didSelectItemAtIndexPath:(Path *)path {
  CityViewModel *vm = self.viewModels[path.row];
  NSArray<Bank *> *banks = [self.info banksForCityId:vm.identifier];
  BankViewController *vc = [[BankViewController alloc] initWithCityViewModel:vm banks:banks];
  [self.navigationController pushViewController:vc animated:YES];
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE FLOW LAYOUT

- (CGSize)collectionView:(Grid *)view layout:(Layout *)layout sizeForItemAtIndexPath:(Path *)path {
  return CUi.cellSize;
}

#PRAGMA MARK: CONFIGURATION

- (void)configure {
  [self configureCurrencyButton];
  [self configureBackground];
  [self configureGrid];
}

- (void)configureCurrencyButton {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:Label.cityChangeCurr forState:UIControlStateNormal];
  [button addTarget:self action:@selector(changeCurrencyTap) forControlEvents:UIControlEventTouchUpInside];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
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
  cv.alpha = Ui.minA;
  [cv registerClass:[Cell class] forCellWithReuseIdentifier:CUi.cellId];
  cv.dataSource = self;
  cv.delegate = self;
  [cv reloadData];
}

@end