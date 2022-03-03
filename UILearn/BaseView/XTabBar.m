//
//  XTabBar.m
//  UILearn
//
//  Created by apple on 2021/11/25.
//

#import "XTabBar.h"

@interface XTabBar ()

@property (nonatomic, strong) UIButton *plusButton;

@end

@implementation XTabBar

// self.items UITabBarItem模型，有多少个子控制器就有多少个UITabBarItem模型
// 调整子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height ;
    NSLog(@"%f",w);
    NSLog(@"%f",h);
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / ( self.items.count);
    CGFloat btnH = h;
    
    int i = 0;
    
//    调整系统自带的tabbar上的按钮位置
    for (UIView *tabBarButton in self.subviews) {
//        判断下是否是UITabbarButon
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            btnX = i * btnW;
            
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
//            tabBarButton.center = CGPointMake(w * 0.5, h * 0.5);
            i++;
        }
    }
}



@end
