//
//  groups.h
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface groups : NSObject

//model属性
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int online;
@property (nonatomic, strong) NSArray *friends;

// 表示这个组是否可见
@property (nonatomic, assign, getter=isVisible) BOOL visible;

- (instancetype)initWithDic:(NSDictionary *)Dic;

+ (instancetype)groupsWithDic:(NSDictionary *)Dic;

@end

NS_ASSUME_NONNULL_END
