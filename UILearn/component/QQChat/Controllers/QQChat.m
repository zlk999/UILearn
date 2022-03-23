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
@interface QQChat ()<UITableViewDelegate,UITableViewDataSource>
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
            modelFrame.message = message;
            
            [arrayModel addObject:modelFrame];
        }
        _messageFrames = arrayModel;
        
        
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

@end
