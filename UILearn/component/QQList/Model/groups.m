//
//  groups.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "groups.h"
#import "friend.h"

@implementation groups

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *sub_dic in self.friends) {
            friend *model = [friend friendWithDic:sub_dic];
            [arrayModels addObject:model];
        }
        self.friends = arrayModels;
    }
    return self;
}

+ (instancetype)groupWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
