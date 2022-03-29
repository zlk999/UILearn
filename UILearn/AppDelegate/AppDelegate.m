//
//  AppDelegate.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "AppDelegate.h"
#import "TabBarController.h"

#import "NavigationController.h"
#import "XHomeController.h"
#import "XMessageController.h"
#import "XProfileController.h"
#import "XDiscoverController.h"

#import <UserNotifications/UserNotifications.h>
@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

// 注册通知

- (void)registerNotification {
    UNAuthorizationOptions options = UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge;
    UNUserNotificationCenter.currentNotificationCenter.delegate = self;
    [UNUserNotificationCenter.currentNotificationCenter requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            // 允许授权
            NSLog(@"允许授权");
        } else {
            // 不允许授权
            NSLog(@"不允许授权");
        }
    }];
    // 获取用户对通知的设置
    // 通过settings.authorizationStatus 来处理用户没有打开通知授权的情况
    [UNUserNotificationCenter.currentNotificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"通过settings.authorizationStatus 来处理用户没有打开通知授权的情况:%@",settings);
    }];
}

// 在前台时 收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}


// 点击通知，从后台进入前台
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    NSString *identifier =  response.actionIdentifier;
    
    if ([identifier isEqualToString:@"open"]) {
        NSLog(@"打开操作");
    } else if ([identifier isEqualToString:@"close"]) {
        NSLog(@"关闭操作");
    }
    completionHandler();
}


- (void)addNotification {
    // 创建一个通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @1;
    content.title = @"title";
    content.subtitle = @"subtitle";
    content.body = @"body";
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = @"category";
    
    
    // 通知触发器
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:false];
    // 通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"noti" content:content trigger:trigger];
    //添加通知
    [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        NSLog(@"error:%@",error);
    }];
    
    
    // 添加通知的一些操作
    UNNotificationAction *openAction = [UNNotificationAction actionWithIdentifier:@"open" title:@"打开" options:UNNotificationActionOptionForeground];
    UNNotificationAction *closeAction = [UNNotificationAction actionWithIdentifier:@"close" title:@"关闭" options:UNNotificationActionOptionDestructive];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"category" actions:@[openAction, closeAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
        
    NSSet *sets = [NSSet setWithObject:category];
    [UNUserNotificationCenter.currentNotificationCenter setNotificationCategories:sets];
}

- (void)removeNotifiation {
    // 移除 待处理的通知
    [UNUserNotificationCenter.currentNotificationCenter removePendingNotificationRequestsWithIdentifiers:@[@"noti"]];
    // 移除 已经处理的通知
    [UNUserNotificationCenter.currentNotificationCenter removeDeliveredNotificationsWithIdentifiers:@[@"noti"]];
    
    // 移除所有的通知
    [UNUserNotificationCenter.currentNotificationCenter removeAllDeliveredNotifications];
    [UNUserNotificationCenter.currentNotificationCenter removeAllPendingNotificationRequests];
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=4;
    [self registerNotification];
    [self addNotification];
    return YES;
}

#pragma mark - 生命周期
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"状态** 将要进入前台");
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"状态** 已经活跃");
}
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"状态** 将要进入后台");
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"状态** 已经进入后台");
}
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"状态** 将要退出程序");
}


-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error{
    
    NSLog(@"%@",error.description);
}
#pragma mark - ****************
-(void)setUpThirdOptions:(NSDictionary *)launchOptions application:(UIApplication *)application{

}


#pragma mark - **************** tabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {

       return YES;
}



@end
