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
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)){
    

   //在这里手动创建新的window
//   UIWindowScene *windowScene = (UIWindowScene *)scene;
//   self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
//   self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//   self.window.rootViewController = [ViewController new];
//   [self.window makeKeyAndVisible];

    
    UIWindowScene *windowScene = (UIWindowScene*)scene;
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    [self.window setWindowScene:windowScene];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    XHomeController *homeVC = [XHomeController new];
    TabBarController *tabbar = [[TabBarController alloc] init];
    
//    tabbar.delegate = self;
    
    NavigationController *Nav = [[NavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    
    
//    UIWindowScene *windowScene = (UIWindowScene*)scene;
//    self.window = [[UIWindow alloc ] initWithFrame:[UIScreen mainScreen ].bounds];
//    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
//    [self.window setWindowScene:windowScene];
//    [self.window setBackgroundColor:[UIColor whiteColor]];
//    self.window.rootViewController = [[NavigationController alloc] initWithRootViewController:homeVC];
////    [self.window setRootViewController:[UITabBarController new]];
//    [self.window makeKeyAndVisible];
//
    
   
    
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
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
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    NSLog(@"sceneDidEnterBackground");
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
