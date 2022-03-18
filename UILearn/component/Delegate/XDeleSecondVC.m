//
//  XDeleSecondVC.m
//  UILearn
//
//  Created by apple on 2022/2/16.
//

#import "XDeleSecondVC.h"
#import "XDeleFirstVC.h"
@interface XDeleSecondVC ()
@property(nonatomic,strong) UIColor *color;
@end

@implementation XDeleSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    button.frame = CGRectMake(90, 200, 100, 50);
//    button.layer.cornerRadius = 9;
//    button.layer.masksToBounds = YES;
//    button.backgroundColor = UIColor.redColor;
//    [button setTitle:@"Block" forState:(UIControlStateNormal)];
//    [button addTarget:self action:@selector(jumpToSecondVc) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:button];
    self.view.backgroundColor = UIColor.whiteColor;
    self.color = UIColor.redColor;
    
    //这一步一般是在B跳转到A的方法中实现的，我是在B中创建了一个Button,让这个通知代理在Button中跳转方法中实现。
   if ([self.delegate respondsToSelector:@selector(changeBgColor:)]) {
      // 加入if语句就是先判断在界面A中是否有changeBgColor这个方法，当有这个方法的时候，才进行代理传值。
      //一般会先实例化出一个color的对象，在进行代理传值的时候，是带着这个color一起传递过去的。
      [self.delegate changeBgColor:self.color];
    //这里的self是界面B，self.delegate就是界面A了（在第4步和第5步的设置中设置了）
  }
}





@end
