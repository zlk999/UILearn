//
//  XNotification.m
//  UILearn
//
//  Created by apple on 2022/3/15.
//

#import "XNotification.h"
#import "XNotificationLister.h"
#import "XNotificationSender.h"
@interface XNotification ()

@end

@implementation XNotification

- (void)viewDidLoad {
    [super viewDidLoad];
//    创建一个通知发布者
    XNotificationSender *sender = [[XNotificationSender alloc] init];
    
//    创建一个通知监听者
    XNotificationLister *lister = [[XNotificationLister alloc] init];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:lister selector:@selector(mm) name:@"tzname" object:sender];
    
    
    [notificationCenter postNotificationName:@"tzname" object:sender userInfo:@{@"title":@"hhhhhhhhh",@"content":@"wuwuwuuuwuwu"}];
    
    
}



@end
