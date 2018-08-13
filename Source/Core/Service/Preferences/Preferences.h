#import <Foundation/Foundation.h>

#PRAGMA MARK: TYPES

@class Currency;

#PRAGMA MARK: PREFERENCES

@interface Preferences: NSObject

@property (nonatomic, strong) Currency *currency;

+ (instancetype)makeDefault;
+ (instancetype)makeDeserialized;

- (void)serialize;

@end