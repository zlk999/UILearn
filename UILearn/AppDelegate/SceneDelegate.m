//
//  SceneDelegate.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "SceneDelegate.h"
#import "TabBarController.h"
#import "XHomeController.h"
#import "NavigationController.h"
#import "XMessageController.h"
#import "XProfileController.h"
#import "XDiscoverController.h"

#import <MagicalRecord/MagicalRecord.h>

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)){
    UIWindowScene *windowScene = (UIWindowScene*)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    XHomeController *homeVC = [XHomeController new];
    TabBarController *tabbar = [[TabBarController alloc] init];
    NavigationController *Nav = [[NavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
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


- (void)sceneDidDisconnect:(UIScene *)scene {
    NSLog(@"sceneDidDisconnect");
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    NSLog(@"sceneDidBecomeActive");
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    NSLog(@"sceneWillResignActive");
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    NSLog(@"sceneWillEnterForeground");
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    // 对Magical Record的初始化
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"User.sqlite"];
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    NSLog(@"sceneDidEnterBackground");
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
