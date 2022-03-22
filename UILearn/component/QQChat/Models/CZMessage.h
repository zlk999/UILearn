//
//  CZMessage.h
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import <Foundation/Foundation.h>

typedef enum {
    CZMessageTypeMe = 0,
    CZMessageTypeOther = 1
}CZMessageType;

NS_ASSUME_NONNULL_BEGIN

@interface CZMessage : NSObject
//消息的正文
@property(nonatomic, copy) NSString *text;
//消息发送的时间
@property(nonatomic, copy) NSString *time;
//枚举 消息的类型  表示是别人发送还是自己发送
@property(nonatomic, assign) CZMessageType *type;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)CZMessageWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
