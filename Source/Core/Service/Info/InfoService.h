#import <Foundation/Foundation.h>

#PRAGMA MARK: TYPES

@class Info, Language;

typedef void (^InfoCompletion)(Info);

#PRAGMA MARK: INFO SERVICE

@interface InfoService

+ (void)loadInfoForLanguage:(Language *)language completion:(InfoCompletion)completion;

@end