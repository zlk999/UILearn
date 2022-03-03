//
//  XHomeController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//


#import <MJRefresh/MJRefreshGifHeader.h>
#import "XHomeController.h"
#import "X2Controller.h"
#import "X3Controller.h"
#import "X4Controller.h"
#import "X5Controller.h"
#import "X1-1ViewController.h"
#import "X1-2ViewController.h"

#import "XHomeCell.h"
#import "XHomeableViewController.h"

#import "MJRefresh.h"

static const CGFloat MJDuration = 0.5;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface XHomeController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray *listArray;
@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, assign) NSInteger *dropnumber;

@property(nonatomic, strong) NSMutableArray *rangeArray;
@end

@implementation XHomeController



- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.navigationItem.title = @"智能技术-张理科";

    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = view;
    self.view.backgroundColor = [UIColor colorWithRed:247.0 / 255.0 green:247.0 / 255.0 blue:247.0 / 255.0 alpha:1.0];
    
    self.listArray = [[NSMutableArray alloc] initWithObjects:@"单元格样式", @"定制单元格背景", @"     ", @"断章 --戴望舒", @"你站在桥上看风景，", @"看风景人在楼上看你。", @"明月装饰了你的窗子，", @"你装饰了别人的梦.", @"     ", nil];
    self.rangeArray = [NSMutableArray new];


    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height - topLayout) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:247.0 / 255.0 green:247.0 / 255.0 blue:247.0 / 255.0 alpha:1.0];
    [self.view addSubview:self.tableView];

    [self dropDownRefresh];
    [self pullToRefresh];

   
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - 上拉加载更多数据

- (void)pullToRefresh {

    [self dropDownRefresh];
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }

    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];

    self.tableView.mj_footer = footer;
}

- (void)loadMoreData {
    // 1.添加假数据
    int num = self.dropnumber;

    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSString *strings = [NSString stringWithFormat:@"👆👆👆👆上拉加载第%d条数据👆", num];
        [self.listArray addObject:strings];
        [self.rangeArray addObject:strings];
        // 刷新表格
        [tableView reloadData];

        // 拿到当前的上拉刷新控件，结束刷新状态
        [tableView.mj_footer endRefreshing];
    });
    num += 1;
    self.dropnumber = num;
}

#pragma mark 下拉刷新数据
- (void)dropDownRefresh {

    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
//    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    调用loadNewData方法
    MJRefreshGifHeader *head = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }

    [head setImages:idleImages forState:MJRefreshStateIdle];

    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    [head setImages:refreshingImages forState:MJRefreshStatePulling];

    // 设置正在刷新状态的动画图片
    [head setImages:refreshingImages forState:MJRefreshStateRefreshing];

    // 马上进入刷新状态
//    [self.tableView.mj_header beginRefreshing];

    self.tableView.mj_header = head;
}


#pragma mark - 下拉刷新 数据处理相关
- (void)loadNewData {
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self.listArray removeObjectsInArray:self.rangeArray];

        // 刷新表格
        [tableView reloadData];

        // 拿到当前的下拉刷新控件，结束刷新状态
        [tableView.mj_header endRefreshing];

    });
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSString *text = self.listArray[indexPath.row];
    cell.textLabel.text = text;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            
            X2Controller *VC = [X2Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 1: {
            X2Controller *VC = [X2Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 3: {
            X1_1ViewController *VC = [X1_1ViewController new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 4: {
            X1_2ViewController *VC = [X1_2ViewController new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 5: {
            X3Controller *VC = [X3Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 6: {
            X4Controller *VC = [X4Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        case 7: {
            X5Controller *VC = [X5Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
//            self.hidesBottomBarWhenPushed=NO;
        }
            break;

        default:
            break;
    }
}



@end
