//
//  NavigationController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "NavigationController.h"
#import "XHomeController.h"

@interface NavigationController ()

@end

@implementation NavigationController


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearance];

    if (@available(iOS 15.0, *)) {
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        UINavigationBarAppearance *scrollEdgeAppearance = [[UINavigationBarAppearance alloc] init];
        scrollEdgeAppearance.backgroundColor = [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:118 / 255.0 alpha:1];
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance;
        //scrollEdgeAppearance默认颜色

        UINavigationBarAppearance *standardAppearance = [[UINavigationBarAppearance alloc] init];
        standardAppearance.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:200 / 255.0 blue:0 / 255.0 alpha:1];
        navigationBar.standardAppearance = standardAppearance;
        //standardAppearance滑动时的颜色
    } else {
        //设置导航条不透明
        navBar.translucent = NO;
        //   navBar.barTintColor =   [UIColor whiteColor];

        // 设置导航条按钮的文字颜色
        NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
        titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
        titleAttr[NSFontAttributeName] = [UIFont systemFontOfSize:18];


        [navBar setBackgroundImage:[NavigationController imageWithColor:[UIColor colorWithRed:0 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
        [navBar setShadowImage:[UIImage new]];
        [navBar setTitleTextAttributes:titleAttr];
        navBar.tintColor = [UIColor whiteColor];
    }
  
}

//+ (void)initialize
//{
////appearance为设置所有UINavigationBar  如果不想 使用[UITabBarItem appearanceWhenContainedIn:self, nil];
//
////    XHomeController *home = [XHomeController new];
////    NSArray *array = [NSArray arrayWithObjects:[home class], nil];
////    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:array];
//
//
//    if (@available(iOS 15.0, *)) {
//        UINavigationBar *navigationBar = [UINavigationBar appearance];
//        UINavigationBarAppearance *scrollEdgeAppearance = [[UINavigationBarAppearance alloc] init];
//        scrollEdgeAppearance.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1];
////        scrollEdgeAppearance.backgroundColor = [UIColor redColor];
//        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance;
//        //scrollEdgeAppearance默认颜色
//
//        UINavigationBarAppearance *standardAppearance = [[UINavigationBarAppearance alloc] init];
//        standardAppearance.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1];
//        navigationBar.standardAppearance = standardAppearance;
//        //standardAppearance滑动时的颜色
//    } else {
//        // Fallback on earlier versions
//    }
//
//    UINavigationBar *navBar = [UINavigationBar appearance];
//
////  设置导航条不透明
//    navBar.translucent = NO;
//    // 设置导航条按钮的文字颜色
//    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
//    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    titleAttr[NSFontAttributeName]  = [UIFont systemFontOfSize:18];
//
//
//    [navBar setBackgroundImage:[NavigationController imageWithColor:[UIColor colorWithRed:0/255.0 green:145/255.0 blue:255/255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
//    [navBar  setShadowImage:[UIImage new
//                             ]];
//    [navBar setTitleTextAttributes:titleAttr];
//
//navBar.tintColor  =[UIColor whiteColor];
//
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];

}



@end
