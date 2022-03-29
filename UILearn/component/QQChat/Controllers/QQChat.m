//
//  QQChat.m
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import "QQChat.h"
#import "CZMessage.h"
#import "CZMessageFrame.h"
#import "CZMessageCell.h"
@interface QQChat ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
// 用来保存所有的消息的frame模型对象
@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation QQChat

- (NSMutableArray *)messageFrames{
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrarDic = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModel = [NSMutableArray new];
        for (NSDictionary *inDic in arrarDic) {
            
            CZMessage *message = [CZMessage CZMessageWithDic:inDic];
            
            CZMessageFrame *modelFrame = [CZMessageFrame new];
            
            CZMessage *lastMessage = (CZMessage *)[[ arrayModel lastObject] message];
            
            if ([message.time isEqualToString:lastMessage.time]) {
                message.hideTime =YES;
            } else {
                message.hideTime = NO;
            }
            modelFrame.message = message;
            
            [arrayModel addObject:modelFrame];
        }
        _messageFrames = arrayModel;
    }
    return _messageFrames;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
    self.tableView.allowsSelection = NO;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 1)];
    self.textField.leftView = leftView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
//    监听键盘的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillChangeFrame:(NSNotification *)noteInfo{
    CGRect rectEnd = [noteInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyBoardY = rectEnd.origin.y;
    CGFloat tranformValue = keyBoardY - self.view.frame.size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, tranformValue);
//        self.view.bounds.origin.y = tranformValue;
    }];
    
    // 让UITableView的最后一行滚动到最上面
    NSIndexPath *lastRowIdxPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}



#pragma  mark - 数据源方法和代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CZMessageFrame *medelFrame = self.messageFrames[indexPath.row];
    
    CZMessageCell *cell = [CZMessageCell messageCellWithTableView:tableView];
    
    cell.messageFrame = medelFrame;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZMessageFrame *messageFrame = self.messageFrames[indexPath.row];
    return messageFrame.rowHeight;
}

#pragma  mark - 文本框代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *text = textField.text;
    
    [self sendMessage:text withType:CZMessageTypeMe];
    [self sendMessage:@"aaaaaaa" withType:CZMessageTypeOther];
    
    textField.text = nil;
    
    return YES;
}

- (void)sendMessage:(NSString *)msg withType:(CZMessageType)type{
    CZMessage *message = [CZMessage new];
    
    message.type = type;
    message.text = msg;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat =  @"今天 HH:mm";
    message.time = [dateFormatter stringFromDate:date];

    
    CZMessageFrame *lastMessageFrame = [self.messageFrames lastObject];
    NSString *lastTime = lastMessageFrame.message.time;
    if ([message.time isEqualToString:lastTime]) {
        message.hideTime = YES;
    }
    
    CZMessageFrame *frame = [CZMessageFrame new];
    frame.message = message;
    
    [self.messageFrames addObject:frame];
    
    [self.tableView reloadData];
    
    // 5. 把最后一行滚动到最上面
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


@end
