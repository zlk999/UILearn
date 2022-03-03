//
//  XNetCell.m
//  UILearn
//
//  Created by apple on 2021/12/26.
//

#import "XNetCell.h"
#import "XNetModel.h"
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]
@interface XNetCell ()

@end

@implementation XNetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
//        省份
        UILabel *province = [UILabel new];
        [self.contentView addSubview:province];
        self.province = province;
        
//        城市
        UILabel *city = [UILabel new];
        [self.contentView addSubview:city];
        self.city = city;
        
//        天气
        UILabel *weather = [UILabel new];
        [self.contentView addSubview:weather];
        self.weather = weather;
        
//        温度
        UILabel *temperature = [UILabel new];
        [self.contentView addSubview:temperature];
        self.temperature = temperature;
        
//        风力
        UILabel *windpower = [UILabel new];
        [self.contentView addSubview:windpower];
        self.windpower = windpower;
    }
    // 1. 设置当前单元格中的子控件的数据
//    [self settingData];
    // 2. 设置当前单元格中的子控件的frame
    [self settingFrame];
    return self;
}

#pragma mark - 重写netmodel属性的set方法
- (void)setNetModel:(XNetModel *)netModel{
    _netModel = netModel;
    // 1. 设置当前单元格中的子控件的数据
//    [self settingData];
    // 2. 设置当前单元格中的子控件的frame
    [self settingFrame];
}


//设置数据的方法
//- (void)settingData{
//    XNetModel *model = self.netModel;
//
//    self.province.text = model.province;
//    self.city.text = model.city;
//    self.weather.text = model.weather;
////    self.temperature.text = model.temperature;
//    self.temperature.text = @"1111";
//    self.windpower.text = model.windpower;
//}

//设置frame的方法
- (void)settingFrame{
    
//    提取统一距离
    CGFloat margin = 10;
    
//    省份
    CGFloat provinceW = 60;
    CGFloat provinceH = 40;
    CGFloat provinceX = margin;
    CGFloat provinceY = margin;
    self.province.frame = CGRectMake(provinceX, provinceY, provinceW, provinceH);
    self.province.font  = [UIFont systemFontOfSize:20];
//    self.province.backgroundColor = UIColor.redColor;
    
//    城市
    CGFloat cityW = 70;
    CGFloat cityH = 40;
    CGFloat cityX = 70;
    CGFloat cityY = margin;
    self.city.frame = CGRectMake(cityX, cityY, cityW, cityH);
    self.city.font  = [UIFont systemFontOfSize:20];
//    self.city.backgroundColor = UIColor.orangeColor;
    
//    温度
    CGFloat temperatureW = 220;
    CGFloat temperatureH = 40;
    CGFloat temperatureX = margin;
    CGFloat temperatureY = 60;
    self.temperature.frame = CGRectMake(temperatureX, temperatureY, temperatureW, temperatureH);
    self.temperature.font  = [UIFont systemFontOfSize:20];
//    self.temperature.backgroundColor = UIColor.systemPinkColor;
    
//    天气
    CGFloat weatherW = 180;
    CGFloat weatherH = 40;
    CGFloat weatherX = 140;
    CGFloat weatherY = margin;
    self.weather.frame = CGRectMake(weatherX, weatherY, weatherW, weatherH);
    self.weather.font  = [UIFont systemFontOfSize:20];
//    self.weather.backgroundColor = UIColor.grayColor;
    
    
//    风力
    CGFloat windpowerW = 150;
    CGFloat windpowerH = 40;
    CGFloat windpowerX = 270;
    CGFloat windpowerY = margin;
    self.windpower.frame = CGRectMake(windpowerX, windpowerY, windpowerW, windpowerH);
    self.windpower.font  = [UIFont systemFontOfSize:20];
//    self.windpower.backgroundColor = UIColor.greenColor;
    
}



@end
