//
//  groups.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "groups.h"
#import "friend.h"

@implementation groups

- (instancetype)initWithDic:(NSDictionary *)Dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:Dic];
        
        NSMutableArray *arrarModel = [NSMutableArray new];
        for (NSDictionary *subDic in self.friends) {
            friend *friendModel = [friend friendWithDic:subDic];
            [arrarModel addObject:friendModel];
        }
        self.friends  = arrarModel;
    }
    return self;
}

+ (instancetype)groupsWithDic:(NSDictionary *)Dic{
    return [[self alloc] initWithDic:Dic];
}


@end
