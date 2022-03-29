//
//  FlagVCViewController.m
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import "FlagVCViewController.h"
#import "FladModel.h"
#import "FlagView.h"

@interface FlagVCViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
// 模型数组
@property (nonatomic, strong) NSArray *flags;
@end

@implementation FlagVCViewController

- (NSArray *)flags{
    if (!_flags) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"03flags.plist" ofType:nil];
        NSArray *flag = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *temp =  [NSMutableArray arrayWithCapacity:flag.count];
        for (NSDictionary *dics in flag) {
            FladModel *model = [FladModel flagWithDic:dics];
            [temp addObject:model];
        }
        _flags = temp;
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
}


#pragma mark - 代理方法&数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    FlagView *flagView = [FlagView initFlag];
//    flagView.backgroundColor = UIColor.redColor;
    flagView.flagModel = self.flags[row];
    flagView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 150);
    
    return flagView;
    
}

// 返回对应的行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return [FlagView rowHeigt];
}

@end
