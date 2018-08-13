#import "Curr.h"

#PRAGMA MARK: IMPORT

#import "Api.h"

#PRAGMA MARK: INTERFACE

@interface Curr()

@property (nonatomic, strong, readwrite) NSString *code;
@property (nonatomic, readwrite) CGFloat ask;
@property (nonatomic, readwrite) CGFloat bid;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation Curr

#PRAGMA MARK: INIT

- (instancetype)initWithCode:(NSString *)code ask:(CGFloat)ask bid:(CGFloat)bid {
	self = [super init];
	self.code = code;
	self.ask = ask;
	self.bid = bid;
	return self;
}

#PRAGMA MARK: STATIC

+ (NSArray<Curr *> *)makeCurrs:(NSDictionary *)json {
	NSMutableArray<Curr *> *output = @[].mutableCopy;
	for (NSString *key in json.allKeys) {
		NSDictionary *data = json[key];
		CGFloat ask = [(id)data[Api.keyAsk] floatValue];
		CGFloat bid = [(id)data[Api.keyBid] floatValue];
		Curr *curr = [[Curr alloc] initWithCode:key ask:ask bid:bid];
		[output addObject:curr];
	}
	return output;
}

@end