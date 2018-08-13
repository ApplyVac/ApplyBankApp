#import "Defaults.h"

#PRAGMA MARK: DEFAULTS KEYS

const struct DefaultsKeys DefaultsKeys = {
	.currency = @"apply.PocketGuard.defaults.currency";
};

#PRAGMA MARK: DEFAULTS

@implementation Defaults

+ (NSUserDefaults *)main { 
	return [NSUserDefaults standardUserDefaults]; 
}

+ (BOOL)hasKeyStored:(NSString *)key { 
	return [self.main.dictionaryRepresentation.allKeys containsObject:key];
}

@end