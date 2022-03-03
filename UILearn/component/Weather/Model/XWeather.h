//
//  XWeather.h
//  UILearn
//
//  Created by apple on 2021/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWeather : NSObject
@property(nonatomic,copy) NSString *province;
@property(nonatomic,copy) NSString *city;
@property(nonatomic,copy) NSString *adcode;
@property(nonatomic,copy) NSString *weather;
@property(nonatomic,copy) NSString *temperature;
@property(nonatomic,copy) NSString *winddirection;
@property(nonatomic,copy) NSString *windpower;
@property(nonatomic,copy) NSString *humidity;
@property(nonatomic,copy) NSString *reporttime;
@end

NS_ASSUME_NONNULL_END
