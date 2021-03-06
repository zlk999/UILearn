//
//  XDiscoverController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "XDiscoverController.h"
#import "XSecondVC.h"
#import "XDeleFirstVC.h"
#import "QQChat.h"
@interface XDiscoverController ()
@property (strong, nonatomic)  UILabel *label;
@end

@implementation XDiscoverController

static NSString *city;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(40, 150, 100, 50);
    button.layer.cornerRadius = 9;
    button.layer.masksToBounds = YES;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"Block" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(jumpToSecondVc) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button1.frame = CGRectMake(190, 150, 100, 50);
    button1.layer.cornerRadius = 9;
    button1.layer.masksToBounds = YES;
    button1.backgroundColor = UIColor.redColor;
    [button1 setTitle:@"代理" forState:(UIControlStateNormal)];
    [button1 addTarget:self action:@selector(jumpToDelegetaVc) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button1];
    
    UIButton *QQChatBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    QQChatBtn.frame = CGRectMake(40, 230, 150, 50);
    QQChatBtn.layer.cornerRadius = 9;
    QQChatBtn.layer.masksToBounds = YES;
    QQChatBtn.backgroundColor = UIColor.redColor;
    [QQChatBtn setTitle:@"QQChatBtn" forState:(UIControlStateNormal)];
    [QQChatBtn addTarget:self action:@selector(jumpToQQChatBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:QQChatBtn];
    

}


- (void)jumpToSecondVc{
    XSecondVC *vc = [XSecondVC new];
//    vc.sendMsgToFirstVc = ^(NSString * _Nonnull txt) {
//        self.label.text = txt;
//    };
    [self.navigationController pushViewController:vc  animated:YES];
 
}

- (void)jumpToDelegetaVc{
    XDeleFirstVC *vc = [XDeleFirstVC new];
    [self.navigationController pushViewController:vc  animated:YES];
 
}

- (void)jumpToQQChatBtn{
    QQChat *vc = [QQChat new];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc  animated:YES];
}

@end
