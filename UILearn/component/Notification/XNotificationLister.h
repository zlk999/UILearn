//
//  XNotificationLister.h
//  UILearn
//
//  Created by apple on 2022/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNotificationLister : NSObject
//通知监听者名称
@property (nonatomic, copy) NSString *name;

- (void)mm;
@end

NS_ASSUME_NONNULL_END
