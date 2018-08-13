#import <UIKit/UIKit.h>

#PRAGMA MARK: CURR

@interface Curr: NSObject

@property (nonatomic, strong, readonly) NSString *code;
@property (nonatomic, readonly) CGFloat ask;
@property (nonatomic, readonly) CGFloat bid;

- (instancetype)initWithCode:(NSString *)code ask:(CGFloat)ask bid:(CGFloat)bid;
+ (NSArray<Curr *> *)makeCurrs:(NSDictionary *)json;

@end
