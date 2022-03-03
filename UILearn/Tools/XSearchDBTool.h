//
//  XSearchDBTool.h
//  UILearn
//
//  Created by apple on 2021/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class XWeather;
@interface XSearchDBTool : NSObject
+ (NSMutableArray *)setInfoFrom:(NSString *)strQuery;
+ (XWeather *)getWeatherFromUrlWitnAdcode:(NSString *)adcode;


@end

NS_ASSUME_NONNULL_END
