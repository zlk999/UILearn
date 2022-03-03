//
//  XWeatherHome.m
//  UILearn
//
//  Created by apple on 2022/1/4.
//

#import "XWeatherHome.h"
#import <CoreLocation/CoreLocation.h>

#import "XMessageController.h"
#import <MJExtension/MJExtension.h>
#import "XWeather.h"
#import "Xstatus.h"
#import "XNetModel.h"
#import "XWeatherModel.h"
#import "XSearchDBTool.h"
#import "XVCTools.h"
#import "XMessageController.h"

@interface XWeatherHome ()<CLLocationManagerDelegate,XVCToolsDelegate>

@property (nonatomic,strong) XMessageController *XMessageController;
@property (nonatomic,strong) XVCTools *localToool;

//存放天气数据
@property(nonatomic, strong) NSMutableArray *resultData;

//地点代码和地名
@property(nonatomic, copy) NSString *adcode;
@property(nonatomic, copy) NSString *cityName;
//模型数据
@property(nonatomic, strong) XWeatherModel *model;

//控件数据
@property(nonatomic,strong) UILabel *city;
@property(nonatomic,strong) UILabel *tips;
@property(nonatomic,strong) UILabel *temp;;
@property(nonatomic,strong) UILabel *weather;
@property(nonatomic,strong) UILabel *wind;


@end

@implementation XWeatherHome



- (NSMutableArray *)resultData {
    if (_resultData == nil) {
        _resultData = [NSMutableArray new];
    }
    return _resultData;
}

#pragma  mark - 导航栏透明
- (void)viewWillAppear:(BOOL)animated{
    
    self.localToool = [XVCTools new];
    self.localToool.delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    NSLog(@"开始出现"); 
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewDidAppear:animated];
    NSLog(@"开始消失");
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"天气";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, topLayout , Device_Width, Device_Height - topLayout  - bottomLayout)];
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weather_img"]];
    img.contentMode = UIViewContentModeScaleToFill;
    view.layer.contents = (id) img.image.CGImage;
    self.view = view;
    self.view.backgroundColor = UIColor.whiteColor;
    
}




#pragma mark - 加载控件、数据
- (void)getCityWithToool:(NSString *)cityName{
    self.cityName = cityName;
    NSLog(@"%@--------------------------------------------------------------",cityName);
    
    if (self.Weathermodel == nil  ) {
        //    查询获取模型数据
            self.resultData = [XSearchDBTool setInfoFrom:self.cityName];
        if (self.resultData.count > 0) {
            self.model = self.resultData[0];
            self.Weathermodel = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.model.adcode];
        }else{
            NSLog(@"self.resultData数组为空！！！");
        }
//    if (self.city.text != nil) {
        [self initSubView];
    }
    

}



- (void)initSubView{
    
//    添加图片
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(12, topLayout, 22, 22)];
    [img setImage:[UIImage imageNamed:@"common_nav_add"]];
    img.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(plusCity)];
    [img addGestureRecognizer:tap];
    [self.view addSubview:img];
    
//    城市
    self.city = [[UILabel alloc] initWithFrame:CGRectMake(50, topLayout, 150, 22)];
    self.city.text = [NSString stringWithFormat:@"%@",self.Weathermodel.city ];
//    self.city.textColor = UIColor.whiteColor;
    self.city.font = [UIFont systemFontOfSize:20];
//    self.city.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.city];
    
//    温馨提示
    self.tips = [[UILabel alloc] initWithFrame:CGRectMake(0, topLayout + 90, Device_Width, 40)];
    self.tips.backgroundColor = [UIColor colorWithRed:52.0 / 255.0 green:55.0 / 255.0 blue:57.0 / 255.0 alpha:0.1];
    self.tips.text = @"天气变化，请注意保暖";
    self.tips.textColor = UIColor.whiteColor;
    self.tips.textAlignment = NSTextAlignmentCenter;
//    [tips setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:20]];
    self.tips.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];//又粗又斜
    
    self.tips.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.tips];
    
//    温度展示
    self.temp = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 250, 200)];
    self.temp.text =  [NSString stringWithFormat: @"%@°",self.Weathermodel.temperature];
    self.temp.textColor = UIColor.whiteColor;
    self.temp.textAlignment = NSTextAlignmentCenter;
    self.temp.font = [UIFont systemFontOfSize:150];
    [self.view addSubview:self.temp];
    
//    天气展示
    self.weather = [[UILabel alloc] initWithFrame:CGRectMake(230, 250, 150, 50)];
    self.weather.text =  [NSString stringWithFormat: @"%@°",self.Weathermodel.weather];
    self.weather.textColor = UIColor.whiteColor;
//    weather.textAlignment = NSTextAlignmentCenter;
    self.weather.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:self.weather];
    
//    风力风向
    self.wind = [[UILabel alloc] initWithFrame:CGRectMake(30, 470, 250, 50)];
    self.wind.text = [NSString stringWithFormat:@"风力：%@ 级   风向：%@",self.Weathermodel.windpower,self.Weathermodel.winddirection] ;
//    self.wind.textColor = UIColor.whiteColor;
    self.wind.textAlignment = NSTextAlignmentCenter;
    self.wind.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.wind];

}



- (void)plusCity{
    
    
    self.city.text = @" ";
    self.tips.text = @" ";
    self.temp .text= @" ";
    self.weather.text = @" ";
    self.wind.text = @" ";
    
    
    
    XMessageController *vc = [XMessageController new];
    
    [vc setSendMsgToRootVc:^(XWeather * _Nonnull Weathermodel) {//block的实现
        self.Weathermodel = Weathermodel;
        [self initSubView];
    
    }];
    
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}



@end
