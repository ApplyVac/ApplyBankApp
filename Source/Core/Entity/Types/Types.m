#import "Types.h"

#PRAGMA MARK: IMPORT

#import "Api.h"

#PRAGMA MARK: LANGUAGE IMPLEMENTATION

@implementation Language

#PRAGMA MARK: STATIC

+ (BOOL)isPhoneInUkrainian {
	NSLocale *lid = [NSLocale autoupdatingCurrentLocale].localeIdentifier;
	return [lid isEqualToString:@"uk"] || [lid isEqualToString:@"uk_UA"];
}

+ (NSArray<Language *> *)languages {
	return @[
		[[self alloc] initWithType:LanguageTypeUa], 
		[[self alloc] initWithType:LanguageTypeRu]
	];
}

+ (Language *)main {
	return [[self alloc] initWithType:(self.isPhoneInUkrainian ? LanguageTypeUa : LanguageTypeRu)];
}

#PRAGMA MARK: INIT

- (instancetype)initWithType:(CurrencyType)type {
	self = [super init];
	self.type = type;
	return self;
}

#PRAGMA MARK: ACCESSORS

- (NSString *)code {
	switch (self.type) {
		case LanguageTypeRu: return @"RU";
		default:              return @"UA";
	}
}

- (NSString *)infoPath {
	switch (self.type) {
		case LanguageTypeRu: return Api.infoUrlRu;
		default:              return Api.infoUrlUa;
	}
}

@end

#PRAGMA MARK: CURRENCY IMPLEMENTATION

@implementation Currency

#PRAGMA MARK: STATIC

+ (NSArray<Currency *> *)currencies {
	return @[
		[[self alloc] initWithType:CurrencyTypeUsd], 
		[[self alloc] initWithType:CurrencyTypeEur]
	];
}

#PRAGMA MARK: INIT

- (instancetype)initWithType:(CurrencyType)type {
	self = [super init];
	self.type = type;
	return self;
}

#PRAGMA MARK: ACCESSORS

- (NSString *)symbol {
	switch (self.type) {
		case CurrencyTypeUsd: return "$";
		default:               return "€";
	}
}

- (NSString *)code {
	switch (self.type) {
		case CurrencyTypeUsd: return "usd";
		default:               return "eur";
	}
}

- (NSString *)title {
	switch (self.type) {
		case CurrencyTypeUsd: return "ДОЛАР";
		default:               return "ЄВРО";
	}
}

@end