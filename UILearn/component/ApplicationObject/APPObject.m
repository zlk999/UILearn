//
//  APPObject.m
//  UILearn
//
//  Created by apple on 2022/3/29.
//

#import "APPObject.h"
#import <UserNotifications/UNUserNotificationCenter.h>
#import <UserNotifications/UserNotifications.h>
@interface APPObject ()
@property (weak, nonatomic) IBOutlet UIButton *BTN;
- (IBAction)BTNClick:(UIButton *)sender;

@end

@implementation APPObject

- (void)viewDidLoad {
    [super viewDidLoad];
    self.BTN.layer.masksToBounds = YES;
    self.BTN.layer.cornerRadius = 10;
    self.BTN.backgroundColor = [UIColor blueColor];
    self.BTN.titleLabel.text = @"点击按钮，展示一条通知";
    [self.BTN setTitle:@"点击按钮，展示一条通知" forState:UIControlStateNormal];
    [self.BTN setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}



- (IBAction)BTNClick:(UIButton *)sender {
    [self addNotification];
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
    
    
    // 添加通知的一些操作 当点击查看通知的时候，会出现
    UNNotificationAction *openAction = [UNNotificationAction actionWithIdentifier:@"open" title:@"打开" options:UNNotificationActionOptionForeground];
    UNNotificationAction *closeAction = [UNNotificationAction actionWithIdentifier:@"close" title:@"关闭" options:UNNotificationActionOptionDestructive];
    UNNotificationAction *tempAction = [UNNotificationAction actionWithIdentifier:@"tempAction" title:@"咋回事" options:UNNotificationActionOptionAuthenticationRequired];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"category" actions:@[openAction, closeAction, tempAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
        
    NSSet *sets = [NSSet setWithObject:category];
    [UNUserNotificationCenter.currentNotificationCenter setNotificationCategories:sets];
}

@end
