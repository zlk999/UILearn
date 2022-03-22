//
//  QQListVC.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "QQListVC.h"
#import "groups.h"
#import "friend.h"
#import "QQListCell.h"
#import "CZGroupHeaderView.h"

@interface QQListVC ()<UITableViewDelegate,UITableViewDataSource, CZGroupHeaderViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CZGroupHeaderView *HeaderView;
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
            groups *models = [groups groupsWithDic:dic];
            [arrayModels addObject:models];
        }
        _groups = arrayModels;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height - topLayout - bottomLayout) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.HeaderView.frame = CGRectMake(0, 0, Device_Width, 44);
    self.tableView.tableHeaderView = self.HeaderView;
}

#pragma mark - 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    groups *group = self.groups[section];
    if (group.isVisible) {
        return [group.friends count];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    groups *agroup = self.groups[indexPath.section];
    friend *afriend = agroup.friends[indexPath.row];
    QQListCell *cell = [QQListCell friendWithTableView:tableView];
    cell.friendModel = afriend;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 不要在这个方法中直接创建一个UIView对象返回, 因为这样无法实现重用该UIView
    // 为了能重用每个Header中的UIView, 所以这里要返回一个UITableViewHeaderFooterView
    // 1. 获取模型数据
    groups *group = self.groups[section];
    

    // 2. 创建UITableViewHeaderFooterView
    CZGroupHeaderView *headerVw = [CZGroupHeaderView CZGroupHeaderViewWithHeaderView:tableView];
    headerVw.tag = section;
    
    // 3. 设置数据
    headerVw.groupModel = group;
    
    // 设置headerView的代理为当前控制器
    headerVw.delegate = self;
    
    
    // 在刚刚创建好的header view中获取的header view的frame都是0, 因为刚刚创建好的header view我们没有为其frame赋值, 所以frame都是 0
    // 但是, 程序运行起来以后, 我们看到的header view是有frame的。原因是: 在当前方法当中, 将header view返回以后, UITableView在执行的时候, 会用到header view， UITableView既然要用Header View， 那么就必须将header view添加到UITableview中, 当把header view添加到UITableView中的时候, UITableView内部会根据一些设置来动态的为header view的frame赋值，也就是说在UITableView即将使用header view的时候, 才会为header view的frame赋值。
    
    // 4. 返回view
    return headerVw;
}

#pragma mark - *********** CZGroupHeaderViewDelegate的代理方法 ***********
- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView{
    
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    if (self.tableView.style == UITableViewStyleGrouped && groupHeaderView.tag == 0) {
        groupHeaderView.groupModel = self.groups[groupHeaderView.tag];
    }
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
}

@end
