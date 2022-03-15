//
//  XNotificationLister.m
//  UILearn
//
//  Created by apple on 2022/3/15.
//

#import "XNotificationLister.h"

@implementation XNotificationLister
- (void)mm{
    NSLog(@"回复无法挽回分别位于v服务v");
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
