#import "City.h"

#PRAGMA MARK: INTERFACE

@interface City()

@property (nonatomic, strong, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite) NSString *title;

@end

#PRAGMA MARK: IMPLEMENTATION

@implementation City

#PRAGMA MARK: INIT

- (instancetype)initWithId:(NSString *)identifier title:(NSString *)title {
  self = [super init];
  self.identifier = identifier;
  self.title = title;
  return self;
}

#PRAGMA MARK: STATIC

+ (NSArray<City *> *)makeCities:(NSDictionary *)json {
  NSMutableArray<City *> *output = @[].mutableCopy;
  for (NSString *key in json.allKeys) {
    [output addObject:[[City alloc] initWithId:key title:json[key]]];
  }
  return output;
}

@end