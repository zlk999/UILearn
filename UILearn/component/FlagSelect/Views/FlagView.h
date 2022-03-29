//
//  FlagView.h
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FladModel;
@interface FlagView : UIView
@property (nonatomic, strong) FladModel *flagModel;

//快速创建一个flag界面
+ (instancetype)initFlag;

//返回这个xib高度  ,供外界使用
+ (CGFloat)rowHeigt;

@end

NS_ASSUME_NONNULL_END
