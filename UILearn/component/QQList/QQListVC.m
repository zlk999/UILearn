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

#pragma mark - *********** 懒加载 ***********
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
    
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.sectionFooterHeight = 0;
    
    self.HeaderView.frame = CGRectMake(0, 0, Device_Width, 44);
    self.tableView.tableHeaderView = self.HeaderView;
}

#pragma mark - tableview数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 因为在这个方法中, 要根据当前组的状态（是否是展开）, 来设置不同的返回值
    // 所以, 需要为CZGroup模型增加一个用来保存"是否展开"状态的属性
    groups *group = self.groups[section];
    if (group.isVisible) {
        return [group.friends count];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. 获取模型对象（数据）
    groups *agroup = self.groups[indexPath.section];
    friend *afriend = agroup.friends[indexPath.row];
    // 2. 创建单元格(视图)
    QQListCell *cell = [QQListCell friendWithTableView:tableView];
    // 3. 设置单元格数据(把模型设置给单元格)
    cell.friendModel = afriend;
    // 4. 返回单元格
    return cell;
}
//// 设置每一组的组标题(下面的这个方法只能设置每一组的组标题字符串, 但是我们要的是每一组中还包含其他子控件)
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    CZGroup *group = self.groups[section];
//    return group.name;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 不要在这个方法中直接创建一个UIView对象返回, 因为这样无法实现重用该UIView
    // 为了能重用每个Header中的UIView, 所以这里要返回一个UITableViewHeaderFooterView
    // 1. 获取模型数据
    groups *group = self.groups[section];
    

    // 2. 创建UITableViewHeaderFooterView
    CZGroupHeaderView *headerVw = [CZGroupHeaderView CZGroupHeaderViewWithHeaderView:tableView];
    headerVw.frame = CGRectMake(0, 0, tableView.bounds.size.width, 30);
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

#pragma mark - *********** 隐藏状态栏 ***********
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - *********** CZGroupHeaderViewDelegate的代理方法 ***********
- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView{
    // 刷新table view
    //[self.tableView reloadData];
    
    // 局部刷新(只刷新某个组)
    // 创建一个用来表示某个组的对象
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    
    if (self.tableView.style == UITableViewStyleGrouped && groupHeaderView.tag == 0) {
        groupHeaderView.groupModel = self.groups[groupHeaderView.tag];
    }
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationTop];
}

@end
