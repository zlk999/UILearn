//
//  XVCTools.m
//  UILearn
//
//  Created by apple on 2022/1/4.
//

#import "XVCTools.h"
#import <CoreLocation/CoreLocation.h>

@interface XVCTools () <CLLocationManagerDelegate>
@property(nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation XVCTools
//全局变量



//获取手机当前显示的ViewController
+ (UIViewController *)currentViewController {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *) vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *) vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
    return vc;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self locate];
    }
    return self;
}


- (void)locate {
    if ([CLLocationManager locationServicesEnabled]) {//检测权限设置
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self; //设置代理
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置精度
        self.locationManager.distanceFilter = 1000.0f;//距离过滤
        [self.locationManager requestAlwaysAuthorization];//位置权限申请
        [self.locationManager startUpdatingLocation];//开始定位
    }
}

#pragma mark - location代理
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还未开启定位服务，是否开启？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"取消！");
    }];

    UIAlertAction *queren = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        NSURL *setingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:setingsURL options:@{} completionHandler:nil];
    }];

    [alert addAction:cancel];
    [alert addAction:queren];
    [[XVCTools currentViewController].navigationController presentViewController:alert animated:YES completion:nil];
}

//获取经纬度  转换为中文城市名
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    [self.locationManager stopUpdatingLocation]; //停止定位
//    地址反编码
    CLLocation *currentLocation = [locations lastObject];

    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];//用于在地理坐标和地名之间转换的接口

//    当系统设置为其他语言的时候，可利用此方法获得中文地理名称
    NSMutableArray *userDefaulLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];

//    强制转换成简体中文
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObject:@"zh-hans"] forKey:@"AppleLanguages"];

    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans", nil] forKey:@"AppleLanguages"];

    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> *_Nullable placemarks, NSError *_Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0]; //CLPlacemark 地理坐标的用户友好描述，通常包含地点的名称、地址和其他相关信息

            NSString *city = placeMark.locality;
            if (!city) {
                self.currentCity = @"⟳定位获取失败,点击重试";
            } else {
                self.currentCity = placeMark.locality;//获取当前城市
                NSLog(@"获取当前城市%@", self.currentCity);

//                当block有值的时候 回调
                if (self.getCityblock) {
                    self.getCityblock(self.currentCity);
                }
                
                if(self.delegate && [self.delegate respondsToSelector:@selector(getCityWithToool:)]){
                    [self.delegate getCityWithToool:self.currentCity];
//                    NSLog(@"-----------------------%@---self.currentCity-----------------------",self.currentCity);
                }
                

            }
        } else if (error == nil && placemarks.count == 0) {

        } else if (error) {
            self.currentCity = @"⟳定位获取失败,点击重试";
        }
        // 还原Device 的语言
        [[NSUserDefaults standardUserDefaults] setObject:userDefaulLanguages forKey:@"AppleLanguages"];
    }];

}



//- (void)findme{
//
//    //    初始化管理器
//        self.locationManager = [[CLLocationManager alloc] init];
//        self.locationManager.delegate = self;
//    //    设置定位精度
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//
//    /** 由于IOS8中定位的授权机制改变 需要进行手动授权
//          * 获取授权认证，两个方法：
//          * [self.locationManager requestWhenInUseAuthorization];
//          * [self.locationManager requestAlwaysAuthorization];
//          */
//    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
//        NSLog(@"requestAlwaysAuthorization");
//        [self.locationManager requestAlwaysAuthorization];
//    }
//
////    开始定位 不断调用代理方法
//    [self.locationManager startUpdatingLocation];
//    NSLog(@"开始调用 GPS");
//}
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    CLLocation *location = [locations lastObject];
//    CLLocationCoordinate2D coorinate = location.coordinate;
//    NSLog(@"纬度：%f 经度 %f",coorinate.latitude,coorinate.longitude);
//
////    coorinate.longitude = [NSNumber numberWithDouble:coorinate.longitude];
////    coorinate.latitude = [NSNumber numberWithDouble:coorinate.latitude];
//
//    [manager stopUpdatingLocation];
//
//}
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
//    if (error.code == kCLErrorDenied) {
//        NSLog(@"出错啦！！！！！！");
//    }
//}

@end
