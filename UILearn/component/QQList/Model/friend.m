//
//  friend.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "friend.h"

@implementation friend

- (instancetype)initWithDic:(NSDictionary *)Dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:Dic];
    }
    return self;
}

+ (instancetype)friendWithDic:(NSDictionary *)Dic{
    return [[self alloc] initWithDic:Dic];
}

@end
