//
//  CZMessage.m
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import "CZMessage.h"

@implementation CZMessage

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)CZMessageWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
