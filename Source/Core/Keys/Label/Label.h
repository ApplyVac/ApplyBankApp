#import <Foundation/Foundation.h>

#PRAGMA MARK: LABEL

@interface Label: NSObject

+ (NSString *)initialTitle;

+ (NSString *)cityTitle;
+ (NSString *)cityChangeCurr;
+ (NSString *)cityBestBid;
+ (NSString *)cityBestAsk;
+ (NSString *)cityAvgBid;
+ (NSString *)cityAvgAsk;

+ (NSString *)bankSortButton;

@end