//
//  XMessageController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "XMessageController.h"
#import <MJExtension/MJExtension.h>
#import "XWeather.h"
#import "Xstatus.h"
#import "XNetCell.h"
#import "XNetModel.h"
#import "XWeatherModel.h"
#import "XSearchDBTool.h"
#import "XWeatherHome.h"
#import "XDownWeatherInfo.h"

@interface XMessageController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UISearchBar *searchBar;
//存放天气数据
@property(nonatomic, strong) NSMutableArray *resultData;

//天气属性
@property(nonatomic, copy) NSString *province;
@property(nonatomic, copy) NSString *city;
@property(nonatomic, copy) NSString *weather;//晴？
@property(nonatomic, copy) NSString *temperature;//气温
@property(nonatomic, copy) NSString *winddirection;//风向
@property(nonatomic, copy) NSString *windpower;//风力
@property(nonatomic, copy) NSString *reporttime;//报告时间
//地点代码
@property(nonatomic, copy) NSString *adcode;
//模型数据
@property(nonatomic, strong) XWeatherModel *model;
@property(nonatomic, strong) XWeather *Weathermodel;

@end

@implementation XMessageController

- (NSMutableArray *)resultData {
    if (_resultData == nil) {
        _resultData = [NSMutableArray new];
    }
    return _resultData;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"天气查询";

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topLayout + StateBarHeight + 100, Device_Width, Device_Height - topLayout - StateBarHeight - 150 - bottomLayout)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];


    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, topLayout + StateBarHeight - 10 , Device_Width, 40)];
    self.searchBar.delegate = self;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.searchResultsButtonSelected = YES;  //默认为NO

    self.searchBar.placeholder = @"搜索地名";
//    计算placeholder长度
    CGFloat placeholderWith = [self.searchBar.placeholder boundingRectWithSize:CGSizeMake(1000, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil].size.width;
    if (@available(iOS 11.0, *)) {//使得placeholder以及放大镜居中
        [self.searchBar setPositionAdjustment:UIOffsetMake((self.searchBar.frame.size.width - placeholderWith * 2.0) / 2, 0) forSearchBarIcon:UISearchBarIconSearch];
    }

    [self.view addSubview:self.searchBar];

}


// 当searchBar输入框中的文字开始编辑时调用
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {

    if ([self.searchBar.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]) {
        [self.searchBar.delegate searchBarShouldBeginEditing:self.searchBar];
    }

    NSLog(@"开始输入搜索内容");
    [searchBar setShowsCancelButton:YES animated:YES]; // 动画显示取消按钮

//调整placeholder
    if (searchBar.text.length == 0) {
        if (@available(iOS 11.0, *)) {
            [self.searchBar setPositionAdjustment:UIOffsetZero forSearchBarIcon:UISearchBarIconSearch];
        }
    }
}

//
//// 通过返回值设置searchBar是否结束编辑
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
//    NSLog(@"是否结束编辑");
//    return YES;
//}
//
// 当searchBar结束编辑时调用
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {

//    调整placeholder
    CGFloat placeholderWith = [self.searchBar.placeholder boundingRectWithSize:CGSizeMake(1000, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil].size.width;

    if (searchBar.text.length == 0) {
        if (@available(iOS 11.0, *)) {
            [self.searchBar setPositionAdjustment:UIOffsetMake((searchBar.frame.size.width - placeholderWith * 2.0) / 2, 0) forSearchBarIcon:UISearchBarIconSearch];
        }
    }

    NSLog(@"结束编辑");
}

// 当searchBar输入框中的文字发生变化时调用（包括清除操作）
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"当searchBar输入框中的文字发生变化时调用（包括清除操作） == %@", searchText);
    self.resultData = [XSearchDBTool setInfoFrom:searchText];
    [self.tableView reloadData];
}


// 当点击键盘中的搜索按钮时调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    self.resultData = [XSearchDBTool setInfoFrom:searchBar.text];

    if (self.resultData.count == 0) {
        [self inputIllegal];
    } else {
        //    获取模型数据
        _model = self.resultData[0];
        //判断模型数据是否为空
        bool value = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.model.adcode];

        if (value) {
            if (self.sendMsgToRootVc) {
                self.sendMsgToRootVc(self.Weathermodel);
            }
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            [self alertView];
        }
    }


}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    self.model = self.resultData[indexPath.row];

    cell.textLabel.text = self.model.area;
    self.adcode = self.model.adcode;
    cell.backgroundColor = UIColor.whiteColor;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    bool value = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.model.adcode];
    self.Weathermodel = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.adcode];
    if (value) {
        if (self.sendMsgToRootVc) {//block调用
            self.sendMsgToRootVc(self.Weathermodel);
        }

//        XWeatherHome *vc = [XWeatherHome new];
//        self.Weathermodel = [XSearchDBTool getWeatherFromUrlWitnAdcode:self.adcode];
//        vc.Weathermodel = self.Weathermodel;
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } else {
        [self alertView];
    }

}

//输入非法数据警示
- (void)inputIllegal {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"输入错误" message:@"😄输入的数据错误，请输入合法地名😄" preferredStyle:UIAlertControllerStyleAlert];

    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"OK Action");
    }];

    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


//网络获取数据为空  弹出提示框  告知
- (void)alertView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"网络数据为空" message:@"程序运行正常，但是网络接口未获取数据，请检查网络或更换接口" preferredStyle:UIAlertControllerStyleAlert];

    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"OK Action");
        [self.searchBar resignFirstResponder];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"Cancel Action");
        [self.searchBar resignFirstResponder];
    }];

    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.resultData removeAllObjects];
    [self.tableView reloadData];
    [self.searchBar setShowsCancelButton:NO animated:YES]; // 动画显示取消按钮
    [self.searchBar resignFirstResponder];
}

@end
