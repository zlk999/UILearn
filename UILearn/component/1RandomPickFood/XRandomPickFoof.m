//
//  XRandomPickFoof.m
//  UILearn
//
//  Created by apple on 2022/3/9.
//

#import "XRandomPickFoof.h"

@interface XRandomPickFoof ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *PickView;
@property (weak, nonatomic) IBOutlet UILabel *fruitLBL;
@property (weak, nonatomic) IBOutlet UILabel *foodLBL;
@property (weak, nonatomic) IBOutlet UILabel *drinkLBL;
@property (weak, nonatomic) IBOutlet UILabel *fruitderail;
@property (weak, nonatomic) IBOutlet UILabel *drinkdetail;
@property (weak, nonatomic) IBOutlet UILabel *frink;

@property (weak, nonatomic) IBOutlet UIButton *randomBtn;
- (IBAction)randomBtnClick:(UIButton *)sender;


@property (nonatomic, strong) NSArray *food;
@end

@implementation XRandomPickFoof
- (NSArray *)food{
    if (!_food) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"01foods.plist" ofType:nil];
        _food = [NSArray arrayWithContentsOfFile:path];
    }
    return _food;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.PickView.delegate = self;
    self.PickView.dataSource = self;
    self.PickView.layer.cornerRadius = 20;
    self.PickView.layer.masksToBounds = YES;
    
    self.randomBtn.backgroundColor = [UIColor systemPinkColor];
    self.randomBtn.layer.cornerRadius = 10;
    self.randomBtn.layer.masksToBounds = YES;
    [self.randomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    for (int i = 0; i < self.food.count; i++) {
        [self pickerView:self.PickView didSelectRow:0 inComponent:i];
    }
    
}

- (IBAction)randomBtnClick:(UIButton *)sender {
    
    for (int i = 0; i < self.food.count; i++) {
        
        NSUInteger max = [self.food[i] count];
        NSUInteger randomNub = arc4random_uniform((int)max);
        NSUInteger selRow = [self.PickView selectedRowInComponent:i];
        while (selRow == randomNub) {
            randomNub = arc4random_uniform((int)max);
        }
        [self.PickView selectRow:randomNub inComponent:i animated:YES];
        [self pickerView:self.PickView didSelectRow:randomNub inComponent:i];
    }
    
    
}

#pragma mark - PickView数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{ //有多少列
    return self.food.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{ //每一列有多行
    return [self.food[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.food[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *string = self.food[component][row];
    
    switch (component) {
        case 0:
            self.fruitderail.text = string;
            break;
            
        case 1:
            self.drinkdetail.text = string;
            break;
            
        case 2:
            self.frink.text = string;
            break;
            
        default:
            break;
    }
    
}

@end
