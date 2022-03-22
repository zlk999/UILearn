//
//  QQChat.m
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import "QQChat.h"
#import "CZMessage.h"
#import "CZMessageFrame.h"
@interface QQChat ()
// 用来保存所有的消息的frame模型对象
@property (nonatomic, strong) NSMutableArray *messageFrames;

@end

@implementation QQChat

- (void)setMessageFrames:(NSMutableArray *)messageFrames{
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



@end
