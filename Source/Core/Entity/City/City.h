#import <Foundation/Foundation.h>

#PRAGMA MARK: CITY

@interface City: NSObject

@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithId:(NSString *)identifier title:(NSString *)title;
+ (NSArray<City *> *)makeCities:(NSDictionary *)json;

@end