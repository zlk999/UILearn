//
//  KeyBoardDIYVC.m
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import "KeyBoardDIYVC.h"

@interface KeyBoardDIYVC ()
@property (weak, nonatomic) IBOutlet UITextField *textFoeld;

@property (nonatomic, strong) UIDatePicker *datapick;
@property (nonatomic ,strong) UIToolbar *toolBar;

@end

@implementation KeyBoardDIYVC

- (UIDatePicker *)datapick{
    if (!_datapick) {
        _datapick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 500)];
        _datapick.datePickerMode = UIDatePickerModeDateAndTime;
        _datapick.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-hans"];
        if (@available(iOS 13.4, *)) {
            _datapick.preferredDatePickerStyle = UIDatePickerStyleInline;
        } else {
            // Fallback on earlier versions
        }
    }
    return _datapick;
}

- (UIToolbar *)toolBar{
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc] init];
        _toolBar.bounds = CGRectMake(0, 0, 0, 44);
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemClick)];
        
//        将两个item几道两边的弹簧
        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        
        UIBarButtonItem *confirmlItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(confirmlItemClick)];
        
        _toolBar.items = @[cancelItem,flexItem,confirmlItem];
    }
    return _toolBar;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFoeld.inputView = self.datapick;
    self.textFoeld.inputAccessoryView = self.toolBar;
}

- (void)cancelItemClick{
    [self.textFoeld endEditing:YES];
}

- (void)confirmlItemClick{
    NSDate *data = self.datapick.date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy年MM月dd日";
    NSString *str = [formatter stringFromDate:data];
    self.textFoeld.text = str;
    [self.textFoeld endEditing:YES];
}


@end
