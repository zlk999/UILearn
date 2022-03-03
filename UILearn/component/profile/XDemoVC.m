//
//  XDemoVC.m
//  UILearn
//
//  Created by apple on 2022/1/5.
//

#import "XDemoVC.h"
#import "XVCTools.h"

@interface XDemoVC ()<XVCToolsDelegate>
@property (nonatomic,strong)XVCTools *localToool;
@end

@implementation XDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.localToool = [XVCTools new];
    self.localToool.delegate = self;
    [self DemoBtn];
}

- (void)DemoBtn{
    UIButton *Btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    Btn.backgroundColor=UIColor.blueColor;
    Btn.frame = CGRectMake(150, 200, 200, 50);
    Btn.layer.cornerRadius = 20;
    Btn.layer.masksToBounds = YES;
    Btn.titleLabel.font = [UIFont systemFontOfSize:20];;
    Btn.backgroundColor = UIColor.redColor;
    [Btn setTitle:@"Dmeo" forState:(UIControlStateNormal)];
    [Btn addTarget:self action:@selector(test) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:Btn];
}

- (void)test{
    self.localToool = [XVCTools new];
//    self.localToool.delegate = self;
    [self.localToool setGetCityblock:^(NSString * _Nonnull cityName) {
            NSLog(@"%@",cityName);
    }];
}

- (void)getCityWithToool:(NSString *)cityName{

    NSLog(@"%@",cityName);
}



@end
