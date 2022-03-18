//
//  friend.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "friend.h"

@implementation friend
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)friendWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
