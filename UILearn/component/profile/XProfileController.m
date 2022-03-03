//
//  XProfileController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "XProfileController.h"
#import "XVCTools.h"
#import "XDemoVC.h"
#import "XImagePickCV.h"

@interface XProfileController()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) NSArray *data;
@end

@implementation XProfileController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 400, 0, 0)];
    pickView.delegate = self;
    pickView.dataSource = self;
    pickView.showsSelectionIndicator = YES;
    pickView.backgroundColor = UIColor.whiteColor;
//    [self.view addSubview:pickView];
    
//    加载plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil];
    self.data = [[NSArray alloc] initWithContentsOfFile:path];
    
//    [self imgSetting];
    [self locateBtn];
    [self DemoBtn];
    [self creatImagePickerViewController];
    
}
- (void)creatImagePickerViewController{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(0, 250, 200, 50);
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:20];;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"相册" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(album) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

- (void)album{
    XImagePickCV *cv = [XImagePickCV new];
    [cv setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:cv animated:YES];
}

//定位按钮
- (void)locateBtn{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(210, 150, 200, 50);
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:20];;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"定位" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(locate) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

- (void)locate{
    self.localToool = [XVCTools new];
    self.localToool.delegate = self;
    [self.localToool setGetCityblock:^(NSString * _Nonnull cityName) {
       
        NSLog(@"------------------%@===========",cityName);
        
    }];
    NSLog(@"执行结束");
}

-(void)getCityWithToool:(NSString *)cityName{//协议
    NSLog(@"------------------%@------------------",cityName);
}

//设置背景图片
- (void)imgSetting{
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height)];
    img.image = [UIImage imageNamed:@"profile"];
    
    img.layer.cornerRadius = 8;
    img.layer.masksToBounds = YES;

       //自适应图片宽高比例
    img.contentMode = UIViewContentModeScaleToFill;
    
    [self.view addSubview:img];
}

//Demo按钮
- (void)DemoBtn{
    UIButton *Btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    Btn.frame = CGRectMake(0, 150, 200, 50);
    Btn.layer.cornerRadius = 20;
    Btn.layer.masksToBounds = YES;
    Btn.titleLabel.font = [UIFont systemFontOfSize:20];;
    Btn.backgroundColor = UIColor.redColor;
    [Btn setTitle:@"dmeo" forState:(UIControlStateNormal)];
    [Btn addTarget:self action:@selector(test) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:Btn];
}

//页面跳转
- (void)test{
    XDemoVC *vc = [XDemoVC new];
    [vc setHidesBottomBarWhenPushed:YES];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark - UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.data.count;
    }
    //返回第一列选择的行的索引
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *items = [self.data objectAtIndex:selectedRow];
    //取得该省下所有的市
    NSArray *cities = [items objectForKey:@"cities"];
    
    return cities.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        NSDictionary *dic = [self.data objectAtIndex:row];
        NSString *state = [dic objectForKey:@"state"];
        return state;
    }
    
    //返回第一列选择的行的索引
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *items = [self.data objectAtIndex:selectedRow];
    //取得该省下所有的市
    NSArray *cities = [items objectForKey:@"cities"];
    NSString *cityName = [cities objectAtIndex:row];
    return cityName;
}

@end
