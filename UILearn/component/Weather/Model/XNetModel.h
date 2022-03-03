//
//  XNetModel.h
//  UILearn
//
//  Created by apple on 2021/12/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNetModel : NSObject
@property(nonatomic, copy) NSString *province;
@property(nonatomic, copy) NSString *city;
@property(nonatomic, copy) NSString *weather;
@property(nonatomic, copy) NSString *temperature;
@property(nonatomic, copy) NSString *windpower;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
