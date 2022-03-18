//
//  QQListVC.m
//  UILearn
//
//  Created by apple on 2022/3/16.
//

#import "QQListVC.h"

@interface QQListVC ()
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation QQListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topLayout, Device_Width, Device_Height - topLayout - bottomLayout)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}


@end
