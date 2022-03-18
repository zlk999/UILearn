//
//  XThirdVC.h
//  UILearn
//
//  Created by apple on 2022/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XThirdVC : UIViewController
@property(nonatomic,copy) void (^SendMsg)(NSString *txt);
@end

NS_ASSUME_NONNULL_END
