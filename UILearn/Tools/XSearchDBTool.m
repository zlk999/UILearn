//
//  XSearchDBTool.m
//  UILearn
//
//  Created by apple on 2021/12/28.
//

#import "XSearchDBTool.h"
#import <FMDatabase.h>
#import "XWeatherModel.h"
#import "Xstatus.h"

@interface XSearchDBTool ()
@property(nonatomic, strong) NSMutableDictionary *dic;
@end

@implementation XSearchDBTool

- (NSMutableDictionary *)dic {
    if (_dic == nil) {
        _dic = [NSMutableDictionary new];
    }
    return _dic;
}

+ (NSMutableArray *)setInfoFrom:(NSString *)strQuery {
//    获取bd文件所在路径
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"mapCode" ofType:@"db"];
//    创建对应路径下的数据库文件
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
//    打开数据库
    [db open];
//    创建可变数组
    NSMutableArray *arrData = [NSMutableArray new];
//    使用sql语句模糊查询
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM mapCode WHERE area like '%%%@%%'", strQuery];
    FMResultSet *ressultSet = [db executeQuery:sql];
    while ([ressultSet next]) {
        XWeatherModel *model = [XWeatherModel new];
        model.area = [ressultSet stringForColumn:@"area"];
        model.adcode = [ressultSet stringForColumn:@"adcode"];
        [arrData addObject:model];
    }
    [db close];
    return arrData;
}


+ (XWeather *)getWeatherFromUrlWitnAdcode:(NSString *)adcode {
    NSString *urlString = [NSString stringWithFormat:@"https://restapi.amap.com/v3/weather/weatherInfo?city=%@&key=e5c71ec2ae5274045ca6bc040ce2e1d3", adcode];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    XWeather *model = [XWeather new];

    Xstatus *info = [Xstatus mj_objectWithKeyValues:dic];
    for (int i = 0; i < info.lives.count; i++) {
        NSDictionary *tt = info.lives[i];
        model = [XWeather mj_objectWithKeyValues:tt];
    }
    return model;
}



@end
