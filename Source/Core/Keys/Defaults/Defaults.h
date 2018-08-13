#import <Foundation/Foundation.h>

#PRAGMA MARK: DEFAULTS KEYS

FOUNDATION_EXPORT const struct DefaultsKeys {
	__unsafe_unretained NSString *currency;
} DefaultsKeys

#PRAGMA MARK: DEFAULTS

@interface Defaults: NSObject

+ (NSUserDefaults *)main;
+ (BOOL)hasKeyStored:(NSString *)key;

@end