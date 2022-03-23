//
//  CZMessageFrame.h
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import <Foundation/Foundation.h>
#define textFont [UIFont systemFontOfSize:15]
NS_ASSUME_NONNULL_BEGIN
@class CZMessage;
@interface CZMessageFrame : NSObject

//引用数据模型
@property(nonatomic, strong) CZMessage *message;

//时间label的frame
@property(nonatomic, assign, readonly) CGRect timeFrame;

//头像的frame
@property(nonatomic, assign, readonly) CGRect iconFrame;

//正文的frame
@property(nonatomic, assign, readonly) CGRect textFrame;

//行高
@property(nonatomic, assign, readonly) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
