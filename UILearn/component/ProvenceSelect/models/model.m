//
//  model.m
//  UILearn
//
//  Created by apple on 2022/3/27.
//

#import "model.h"

@implementation model

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)modelsWithDic:(NSDictionary *)dic{
    return  [[self alloc] initWithDic:dic];
}
@end
