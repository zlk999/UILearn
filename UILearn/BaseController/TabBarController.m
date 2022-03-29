//
//  TabBarController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "TabBarController.h"
#import "NavigationController.h"
//
#import "XHomeController.h"  // 刷新页
#import "XMessageController.h"  // 测试
#import "XProfileController.h"  // 个人
#import "XDiscoverController.h"  // 发现
#import "XWeatherHome.h"  // 天气

//#import "XImagePickCV.h"   //
//#import "XTabBar.h"
//#import "XRandomPickFoof.h"   // 选餐系统
//#import "XNotification.h"   // 通知学习

//#import "QQListVC.h"   // QQ好友列表
//#import "QQChat.h"   // QQ聊天界面
//#import "Provence.h" //pickerview选择省市并展示
//#import "FlagVCViewController.h"  //自定义pickerview
//#import "KeyBoardDIYVC.h"    //自定义键盘
#import "APPObject.h"

@interface TabBarController ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation TabBarController


+ (void)initialize
{
    if (@available(iOS 9.0, *)) {
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
//        dictNormal[NSForegroundColorAttributeName] = [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:118 / 255.0 alpha:1];
        dictNormal[NSForegroundColorAttributeName] = [UIColor greenColor];
        dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        
        NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
//        dictSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:118 / 255.0 alpha:1];
        dictSelected[NSForegroundColorAttributeName] = [UIColor yellowColor];//tabbar字体颜色
        dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        
        [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    } else {
        // Fallback on earlier versions
    }
}


- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    self.tabBar.translucent = NO;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, 100)];
    backView.backgroundColor =   [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:118 / 255.0 alpha:1];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    
    //    设置tabbar颜色
//        [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
//        [UITabBar appearance].translucent = NO;
//    UITabBar *tabBar = [[UITabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    
//    设置tabbar颜色
//        UIView *view = [[UIView alloc]init];
//        view.backgroundColor =  [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:118 / 255.0 alpha:1];
//        view.frame = self.tabBar.bounds;
//        [[UITabBar appearance] insertSubview:view atIndex:0];
    
}


#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc{
    
    APPObject *home = [APPObject new];
    [self setUpOneChildVcWithVc:home Image:@"tab_home_ unselected" selectedImage:@"tab_home_ selected" title:@"主页"];
    
    XDiscoverController *logVC  =[XDiscoverController new];
    [self setUpOneChildVcWithVc:logVC Image:@"tab_find_ unselected" selectedImage:@"tab_find_ selected" title:@"发现"];
    
   

    XWeatherHome *SearVC = [XWeatherHome new];
    [self setUpOneChildVcWithVc:SearVC Image:@"tab_weather_ selected-1" selectedImage:@"tab_weather_ selected" title:@"天气"];

    


//    logVC.tabBarItem.badgeValue = @"消息";
    
    XDiscoverController *Lock = [XDiscoverController new];
    [self setUpOneChildVcWithVc:Lock Image:@"tab_my_ unselected" selectedImage:@"tab_my_ selected" title:@"我的"];
}


#pragma mark - 初始化设置tabBar上面单个按钮的方法
/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:Vc];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    Vc.tabBarItem.title = title;
    // 保存tabBarItem模型到数组
//    [self.items addObject:Vc.tabBarItem];
    
 
    
    [self addChildViewController:nav];
    
}

-(UIUserInterfaceStyle)overrideUserInterfaceStyle{

    return UIUserInterfaceStyleLight;

}

@end
