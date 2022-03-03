//
//  XNetModel.m
//  UILearn
//
//  Created by apple on 2021/12/27.
//

#import "XNetModel.h"

@implementation XNetModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
