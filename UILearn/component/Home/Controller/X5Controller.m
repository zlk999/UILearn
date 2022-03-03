//
//  X5Controller.m
//  UILearn
//
//  Created by apple on 2021/11/25.
//

#import "X5Controller.h"
#import "XHomeController.h"
#import "X2Controller.h"
#import "XHomeController.h"
#import "X2Controller.h"
#import "X3Controller.h"
#import "X4Controller.h"
#import "X5Controller.h"
#import "X1-1ViewController.h"
#import "X1-2ViewController.h"

@interface X5Controller ()
@property(nonatomic, strong) UIButton *btn;
@property(nonatomic, strong) UIButton *home1;
@property(nonatomic, strong) UIButton *home2;
@property(nonatomic, strong) UIButton *home3;
@property(nonatomic, strong) UIButton *home4;
@end

@implementation X5Controller

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"副页5";

    self.view.backgroundColor = UIColor.whiteColor;

    // Do any additional setup after loading the view.
    [self imgSetting];
    [self btnSetting];
}

- (void)imgSetting {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height * 0.8)];
    img.image = [UIImage imageNamed:@"img05"];

    img.layer.cornerRadius = 8;
    img.layer.masksToBounds = YES;

    //自适应图片宽高比例
    img.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:img];
}


- (void)btnSetting {

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(280, 415, 100, 500)];
    lineView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:lineView];

//    主页
    self.btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn.frame = CGRectMake(0, 0, 70, 35);
    self.btn.layer.cornerRadius = 10;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderWidth = 1;
    self.btn.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [self.btn setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.btn.backgroundColor = UIColor.whiteColor;
    [self.btn setTitle:@"主页" forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(VC) forControlEvents:(UIControlEventTouchUpInside)];
    self.btn.hidden = YES;
    [lineView addSubview:self.btn];

//
    self.home1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.home1.frame = CGRectMake(0, 55, 70, 35);
    self.home1.layer.cornerRadius = 10;
    self.home1.layer.masksToBounds = YES;
    self.home1.layer.borderWidth = 1;
    self.home1.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [self.home1 setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.home1.backgroundColor = UIColor.whiteColor;
    [self.home1 setTitle:@"副页1" forState:(UIControlStateNormal)];
    [self.home1 addTarget:self action:@selector(VC1) forControlEvents:(UIControlEventTouchUpInside)];
    self.home1.hidden = YES;
    [lineView addSubview:self.home1];

    self.home2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.home2.frame = CGRectMake(0, 110, 70, 35);
    self.home2.layer.cornerRadius = 10;
    self.home2.layer.masksToBounds = YES;
    self.home2.layer.borderWidth = 1;
    self.home2.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [self.home2 setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.home2.backgroundColor = UIColor.whiteColor;
    [self.home2 setTitle:@"副页2" forState:(UIControlStateNormal)];
    [self.home2 addTarget:self action:@selector(VC2) forControlEvents:(UIControlEventTouchUpInside)];
    self.home2.hidden = YES;
    [lineView addSubview:self.home2];

    self.home3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.home3.frame = CGRectMake(0, 165, 70, 35);
    self.home3.layer.cornerRadius = 10;
    self.home3.layer.masksToBounds = YES;
    self.home3.layer.borderWidth = 1;
    self.home3.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [self.home3 setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.home3.backgroundColor = UIColor.whiteColor;
    [self.home3 setTitle:@"副页3" forState:(UIControlStateNormal)];
    [self.home3 addTarget:self action:@selector(VC3) forControlEvents:(UIControlEventTouchUpInside)];
    self.home3.hidden = YES;
    [lineView addSubview:self.home3];


    self.home4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.home4.frame = CGRectMake(0, 220, 70, 35);
    self.home4.layer.cornerRadius = 10;
    self.home4.layer.masksToBounds = YES;
    self.home4.layer.borderWidth = 1;
    self.home4.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [self.home4 setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.home4.backgroundColor = UIColor.whiteColor;
    [self.home4 setTitle:@"副页4" forState:(UIControlStateNormal)];
    [self.home4 addTarget:self action:@selector(VC4) forControlEvents:(UIControlEventTouchUpInside)];
    self.home4.hidden = YES;
    [lineView addSubview:self.home4];


}

- (void)VC {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)VC1 {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[X1_1ViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}


- (void)VC2 {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[X1_2ViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)VC3 {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[X3Controller class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)VC4 {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[X4Controller class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.btn.hidden = !self.btn.hidden;
    self.home1.hidden = !self.home1.hidden;
    self.home2.hidden = !self.home2.hidden;
    self.home3.hidden = !self.home3.hidden;
    self.home4.hidden = !self.home4.hidden;
}

@end
