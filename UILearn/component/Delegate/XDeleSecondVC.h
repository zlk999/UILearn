//
//  XDeleSecondVC.h
//  UILearn
//
//  Created by apple on 2022/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ConfigViewDelegate <NSObject>

- (void)changeBgColor:(UIColor *)UIColor;

@end

@interface XDeleSecondVC : UIViewController
@property (nonatomic,weak) id<ConfigViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
