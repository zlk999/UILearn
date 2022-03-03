//
//  XDownWeatherInfo.m
//  UILearn
//
//  Created by apple on 2021/12/28.
//

#import "XDownWeatherInfo.h"

#import <MJExtension/MJExtension.h>
#import "XWeather.h"
#import "Xstatus.h"


#import "XWeatherModel.h"
#import "XSearchDBTool.h"

@interface XDownWeatherInfo ()
@property(nonatomic, strong) XWeather *model;
@end

@implementation XDownWeatherInfo

- (XWeather *)model {
    if (_model == nil) {
        _model = [XWeather new];
    }
    return _model;
}


- (void)viewDidLoad {

    self.navigationItem.title = @"天气";
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
//    获取天气数据模型
    self.model = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.adcode];

    [self weartherView];
}

//绘制天气展示界面UI
- (void)weartherView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, topLayout , Device_Width, Device_Height - topLayout  - bottomLayout)];
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weather"]];
    img.contentMode = UIViewContentModeScaleToFill;
    view.layer.contents = (id) img.image.CGImage;

//    省 市
    UILabel *province = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, Device_Width, 50)];
    province.text = [NSString stringWithFormat:@"%@ %@", self.model.province, self.model.city];
    province.font = [UIFont systemFontOfSize:30];
    province.textAlignment = NSTextAlignmentCenter;

//    气温
    UILabel *tem = [[UILabel alloc] initWithFrame:CGRectMake(0, topLayout * 2 + 100, 250, 140)];
    tem.center = CGPointMake(Device_Width * 0.45, topLayout * 2 + 100);
    tem.text = self.model.temperature;
    tem.font = [UIFont systemFontOfSize:130];
    tem.textAlignment = NSTextAlignmentCenter;

//    摄氏度单位
    UILabel *danwei = [[UILabel alloc] initWithFrame:CGRectMake(210, 0, 40, 40)];
    danwei.text = @"℃";
    danwei.font = [UIFont systemFontOfSize:20];

//    天气
    UILabel *weather = [[UILabel alloc] initWithFrame:CGRectMake(0, topLayout * 2 + 150, Device_Width, 80)];
    weather.text = self.model.weather;
    weather.font = [UIFont systemFontOfSize:25];
    weather.textAlignment = NSTextAlignmentCenter;

//    风力
    UILabel *windPower = [[UILabel alloc] initWithFrame:CGRectMake(90, 450, 300, 50)];
    windPower.text = [NSString stringWithFormat:@"风力：%@级", self.model.windpower];
    windPower.font = [UIFont systemFontOfSize:20];

//    风向
    UILabel *windDirection = [[UILabel alloc] initWithFrame:CGRectMake(90, 500, 300, 50)];
    windDirection.text = [NSString stringWithFormat:@"风向：%@", self.model.winddirection];
    windDirection.font = [UIFont systemFontOfSize:20];

//    报告时间
    UILabel *reprtTime = [[UILabel alloc] initWithFrame:CGRectMake(90, 550, 300, 50)];
    reprtTime.text = [NSString stringWithFormat:@"时间:%@", self.model.reporttime];
    reprtTime.font = [UIFont systemFontOfSize:20];

    [view addSubview:province];
    [view addSubview:tem];
    [tem addSubview:danwei];
    [view addSubview:weather];
    [view addSubview:windPower];
    [view addSubview:windDirection];
    [view addSubview:reprtTime];

    [self.view addSubview:view];

}

@end
