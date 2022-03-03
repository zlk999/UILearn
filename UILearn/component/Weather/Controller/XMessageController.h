//
//  XMessageController.h
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import <UIKit/UIKit.h>
#import "XWeather.h"
NS_ASSUME_NONNULL_BEGIN

@interface XMessageController : UIViewController
@property(nonatomic,copy) void (^sendMsgToRootVc)(XWeather *Weathermodel);
@end

NS_ASSUME_NONNULL_END
