#import <UIKit/UIKit.h>

#PRAGMA MARK: COLLECTION

typedef UICollectionViewLayout Layout;
typedef UICollectionView Grid;
typedef NSIndexPath Path;

#PRAGMA MARK: LANGUAGE

typedef enum { LanguageTypeUa, LanguageTypeRu } LanguageType;

@interface Language

@property (nonatomic, assign) LanguageType type;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) NSString *infoPath;

- (instancetype)initWithType:(LanguageType)type;
+ (NSArray<Language *> *)languages;
+ (Language *)main;

@end

#PRAGMA MARK: CURRENCY

typedef enum { CurrencyTypeUsd, CurrencyTypeEur } CurrencyType;

@interface Currency: NSObject

@property (nonatomic, assign) CurrencyType type;
@property (nonatomic, readonly) NSString *symbol;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) NSString *title;

- (instancetype)initWithType:(CurrencyType)type;
+ (NSArray<Currency *> *)currencies;

@end