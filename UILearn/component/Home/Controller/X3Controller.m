//
//  XV4Controller.m
//  UILearn
//
//  Created by apple on 2021/11/25.
//

#import "X3Controller.h"
#import "X4Controller.h"
#import "XHomeController.h"
#import "XHomeController.h"
#import "X2Controller.h"
#import "X3Controller.h"
#import "X4Controller.h"
#import "X5Controller.h"
#import "X1-1ViewController.h"
#import "X1-2ViewController.h"

@interface X3Controller ()
@property(nonatomic,strong) UIButton *btn;

@end

@implementation X3Controller

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"副页3";

    self.view.backgroundColor = UIColor.whiteColor;

    // Do any additional setup after loading the view.
    [self imgSetting];


}

- (void)imgSetting {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height * 0.8)];
    img.image = [UIImage imageNamed:@"img03"];

    img.layer.cornerRadius = 8;
    img.layer.masksToBounds = YES;

    //自适应图片宽高比例
    img.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:img];

    [self creatButton];

}

- (void)creatButton {

    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 620, 100, 40)];
//    btn.center = CGPointMake(Device_Width * 0.5, Device_Height * 0.5);
    [self.btn setTitle:@"前往副页4" forState:UIControlStateNormal];
    self.btn.layer.cornerRadius = 15;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderWidth = 1;
    self.btn.layer.borderColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    self.btn.backgroundColor = UIColor.whiteColor;
    [self.btn setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    self.btn.hidden = YES;
    [self.view addSubview:self.btn];
    [self.btn addTarget:self action:@selector(jumpToNext) forControlEvents:UIControlEventTouchUpInside];
}

- (void)jumpToNext {
    X4Controller *vc = [X4Controller new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.btn.hidden = !self.btn.hidden;
}

@end
