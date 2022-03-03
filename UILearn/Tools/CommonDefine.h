//
//  CommonDefine.h
//  RecycleallClear
//
//  Created by zm z on 2020/5/6.
//  Copyright © 2020 zm z. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h



#define RCVersionKey @"version"

#define RCAppName  ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

#define WeakSelf __weak typeof(self) weakSelf = self;
#define StrongSelf __strong typeof(self) strongSelf = self;


#define RCKeyWindow [UIApplication sharedApplication].delegate.window

#define SDKBundle [NSBundle mainBundle]

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width



#define TEXTFONT_M(a)   [UIFont fontWithName:@"PingFangSC-Medium" size:a]
#define TEXTFONT(a)     [UIFont fontWithName:@"PingFangSC-Regular" size:a]
#define TEXTFONT_SEM(a)     [UIFont fontWithName:@"PingFangHK-Semibold" size:a]

#define TEXTFONT_DIN(a)     [UIFont fontWithName:@"DINAlternate-Bold" size:a]

#define kFont(a) [UIFont systemFontOfSize:(a)]

#define IS_X     (SCREEN_HEIGHT==812||SCREEN_HEIGHT==896)
#define IS_IPHONE6P_7P_8P           (SCREEN_HEIGHT == 736)

#define IS_iPhoneX (SCREEN_HEIGHT==812)
#define IS_iPhoneX_Max (SCREEN_HEIGHT==896)



#define topLayout      (IS_X?88:64)
#define StateBarHeight  (IS_X?44:20)
#define SafeBottom  (IS_X?34:0)
#define IS_IPHONEX  (IS_X?1:0)
#define bottomLayout    (IS_X?83:49)


/** 最大内机 */
#define MaxIndoors   64


#define AUXKeyWindow [UIApplication sharedApplication].delegate.window
#define g_Global [AUXGlobalDataMgr sharedInsance]
#define APPdelegate [[UIApplication sharedApplication] delegate]

//自定义仅在Debug时候生效的Log
#ifdef DEBUG
#define NSLog(...) NSLog(@"-->>%s 行:%d  %@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#define kSimpleLog(...) NSLog(@"\n%@\n",[NSString stringWithFormat:__VA_ARGS__])
#define kBoolLog(a) NSLog(@"-->>%s 行:%d  %@ <<--\n\n",__func__,__LINE__,(a)?@"YES":@"NO")
#define NSLogFrame(view) NSLog(@"此控件的frame是:%f-%f-%f-%f,控件:%@",(view).frame.origin.x,(view).frame.origin.y,(view).frame.size.width,(view).frame.size.height,[view class])
#else
#define NSLog(...)
#endif


#define ALERT(title,msg,caption) UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle: UIAlertControllerStyleAlert];[alert addAction:[UIAlertAction actionWithTitle:caption style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }]]; [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alert animated:YES completion:^{ }];

#define ALERT2(_TITLE_,_MESSAGE_) UIAlertView *__alertView = [[UIAlertView alloc]initWithTitle:_TITLE_ message:_MESSAGE_ delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];\
[__alertView show];

#define ALERT3(_TITLE_,_MESSAGE_) UIAlertView *__alertView = [[UIAlertView alloc]initWithTitle:_TITLE_ message:_MESSAGE_ delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[__alertView show];

#define ALERT4(_TITLE_,_MESSAGE_) UIAlertView *__alertView = [[UIAlertView alloc]initWithTitle:_TITLE_ message:_MESSAGE_ delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[__alertView show];


#define ALERT5(_TITLE_,_MESSAGE_,_Cancle,_Conform) UIAlertView *__alertView = [[UIAlertView alloc]initWithTitle:_TITLE_ message:_MESSAGE_ delegate:self cancelButtonTitle:_Cancle otherButtonTitles:_Conform, nil];\
[__alertView show];








#endif /* CommonDefine_h */
