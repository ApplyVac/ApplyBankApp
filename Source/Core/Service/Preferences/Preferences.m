#import "Preferences.h"

#PRAGMA MARK: IMPORT

#import "Defaults.h"
#import "Types.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation Preferences 

#PRAGMA MARK: STATIC

+ (instancetype)makeDefault {
	return [[self alloc] initWithCurrency:[[Currency alloc] initWithType:CurrencyTypeUsd]];
}

+ (instancetype)makeDeserialized {
	if (!self.hasCurrencySerialized) { return nil; }
	return [[self alloc] initWithCurrency:self.decerializeCurrency];
}

#PRAGMA MARK: INIT

- (instancetype)initWithCurrency:(Currency *)currency {
	self = [super init];
	self.currency = currency;
	return self;
}

#PRAGMA MARK: PUBLIC

- (void)serialize {
	[Defaults.main setInteger:self.currency.type forKey:DefaultsKeys.currency];
	[Defaults.main synchronize];
}

#PRAGMA MARK: PRIVATE

+ (BOOL)hasCurrencySerialized {
	return [Defaults hasKeyStored:DefaultsKeys.currency];
}

+ (Currency)deserializeCurrency { 
	CurrencyType type = (CurrencyType)[Defaults.main integerForKey:DefaultsKeys.currency];
	return [[Currency alloc] initWithType:type]; 
}

@end