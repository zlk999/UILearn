//
//  friend.h
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface friend : NSObject
//cell 头像
@property(nonatomic, copy) NSString *icon;
//个性签名
@property(nonatomic, copy) NSString *intro;
//昵称
@property(nonatomic, copy) NSString *name;
//是否是VIP
@property (nonatomic, assign, getter = isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)Dic;

+ (instancetype)friendWithDic:(NSDictionary *)Dic;

@end

NS_ASSUME_NONNULL_END
