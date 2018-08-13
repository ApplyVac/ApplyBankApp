#import "InfoService.h"

#PRAGMA MARK: IMPORT

#import "Types.h"
#import "Info.h"

#PRAGMA MARK: IMPLEMENTATION

@implementation InfoService

#PRAGMA MARK: PUBLIC

+ (void)loadInfoForLanguage:(Language *)language completion:(InfoCompletion)completion {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError *error;
		NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:language.infoPath]];
		NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
		Info *info = [[Info alloc] initWithJson:json];
		dispatch_async(dispatch_get_main_queue(), ^{ if (completion) { completion(info); } });
	});
}

@end