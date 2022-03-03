//
//  XDeleFirstVC.m
//  UILearn
//
//  Created by apple on 2022/2/16.
//

#import "XDeleFirstVC.h"
#import "XDeleSecondVC.h"
@interface XDeleFirstVC ()<ConfigViewDelegate>
@end

@implementation XDeleFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(90, 200, 100, 50);
    button.layer.cornerRadius = 9;
    button.layer.masksToBounds = YES;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"Block" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(jumpToSecondVc) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
}
- (void)changeBgColor:(UIColor *)color{
self.view.backgroundColor = color;
}


- (void)jumpToSecondVc{
    XDeleSecondVC *vc = [XDeleSecondVC new];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
