//
//  FladModel.m
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import "FladModel.h"

@implementation FladModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)flagWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
