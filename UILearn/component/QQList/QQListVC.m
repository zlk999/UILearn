//
//  QQListVC.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "QQListVC.h"
#import "groups.h"
#import "friend.h"

@interface QQListVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;

//获取plist文件数组
@property(nonatomic,strong) NSArray *groups;

@end

@implementation QQListVC

- (NSArray *)groups{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *arrayDic = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dic in arrayDic) {
            groups *models = [groups groupWithDic:dic];
            [arrayModels addObject:models];
        }
        _groups = arrayModels;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height - topLayout - bottomLayout)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 
}

#pragma mark - 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    groups *group = self.groups[section];
    return [group.friends count];
}


@end
