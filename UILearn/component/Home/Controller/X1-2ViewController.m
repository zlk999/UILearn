//
//  X1-2ViewController.m
//  UILearn
//
//  Created by apple on 2021/12/23.
//

#import "X1-2ViewController.h"
#import "XHomeController.h"
#import "X2Controller.h"
#import "X3Controller.h"
#import "X4Controller.h"
#import "X5Controller.h"
#import "X1-1ViewController.h"
#import "X1-2ViewController.h"

@interface X1_2ViewController ()
@property(nonatomic,strong) UIButton *btn;

@end

@implementation X1_2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height)];
    View.backgroundColor = UIColor.whiteColor;
    self.view = View;
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"副页2";

    [self imgSetting];
    [self creatButton];

}

- (void)imgSetting {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height * 0.8)];
    img.image = [UIImage imageNamed:@"img02"];

    img.layer.cornerRadius = 8;
    img.layer.masksToBounds = YES;

    //自适应图片宽高比例
    img.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:img];
}

- (void)creatButton {

    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 620, 100, 40)];
//    btn.center = CGPointMake(Device_Width * 0.5, Device_Height * 0.5);
    [self.btn setTitle:@"前往副页3" forState:UIControlStateNormal];
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
    X3Controller *vc = [X3Controller new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.btn.hidden = !self.btn.hidden;
}

@end
