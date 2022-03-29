//
//  model.h
//  UILearn
//
//  Created by apple on 2022/3/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface model : NSObject
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic ,copy) NSString *name;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)modelsWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
