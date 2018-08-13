#import "CurrViewController.h"

#PRAGMA MARK: IMPORT

#import "CurrTitleCell.h"
#import "CurrCell.h"
#import "CurrUi.h"
#import "Layout.h"
#import "Types.h"
#import "Bank.h"
#import "Curr.h"
#import "Img.h"
#import "Ui.h"

#PRAGMA MARK: INTERFACE

@interface CurrViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) Bank *bank;
@property (nonatomic, strong) Grid *collectionView;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation CurrViewController

#PRAGMA MARK: INIT

- (instancetype)initWithBank:(Bank *)bank {
	self = [super initWithNibName:nil bundle:nil];
	self.bank = bank;
	self.collectionView = Ui.verticalCv;
	return self;
}

#PRAGMA MARK: LIFE CYCLE

- (void)viewDidLoad {
	[super viewDidLoad];
	[self configure];
}

#PRAGMA MARK: COLLECTION VIEW DATA SOURCE

- (NSInteger)collectionView:(Grid *)view numberOfItemsInSection:(NSInteger)section {
	return self.bank.currencies.count + CurrUi.titleIdxOffset;
}

- (UICollectionViewCell *)collectionView:(Grid *)view cellForItemAtIndexPath:(Path *)path {
	if (!path.row) {
		CurrTitleCell *cell = (id)[view dequeueReusableCellWithReuseIdentifier:CurrUi.cellId forIndexPath:path];
		[cell configure:bank];
		return cell
	}
	
	CurrCell *cell = (id)[view dequeueReusableCellWithReuseIdentifier:CurrUi.cellId forIndexPath:path];
	[cell configure:self.bank.currencies[path.row - CurrUi.titleIdxOffset]];
	return cell
}

#PRAGMA MARK: COLLECTION VIEW DELEGATE FLOW LAYOUT

- (CGSize)collectionView:(Grid *)view layout:(Layout *)layout sizeForItemAtIndexPath:(Path *)path {
	return path.row ? CurrUi.cellHeight : CurrUi.titleCellHeight;
}

#PRAGMA MARK: CONFIGURATION

- (void)configure {
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

@end