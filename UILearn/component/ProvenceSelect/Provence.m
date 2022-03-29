//
//  ViewController.m
//  UILearn
//
//  Created by apple on 2022/3/27.
//

#import "Provence.h"
#import "model.h"

@interface Provence ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) NSArray *cityArray;

//省
@property (weak, nonatomic) IBOutlet UILabel *Provence;
@property (weak, nonatomic) IBOutlet UILabel *cities;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

@property (nonatomic, strong) model *selProvince;

@end

@implementation Provence

- (NSArray *)cityArray{
    
    if (!_cityArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"02cities.plist" ofType:nil];
        NSArray *cityArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mutalArr = [NSMutableArray arrayWithCapacity:cityArr.count];
        for (NSDictionary *dic_sub in cityArr) {
            model *cityModel = [model modelsWithDic:dic_sub];
            [mutalArr addObject:cityModel];
        }
        _cityArray = mutalArr;
    }
    return _cityArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    // 启动后的默认选中操作
//    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
    
}

#pragma mark - 数据源方法和代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

//每一组返回多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _cityArray.count;
    } else {
        NSInteger selProIdx = [pickerView selectedRowInComponent:0];
        model *selPro = self.cityArray[selProIdx];
        self.selProvince = selPro;
        return self.selProvince.cities.count;
    }
}

//每一行显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        model *model = self.cityArray[row];
        return model.name;
    }else{
        return self.selProvince.cities[row];
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
//        保证第一组数据变化后，第二组数据跟随第一组数据变化
        [pickerView reloadComponent:1];
        // 去选中第1组城市  第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    NSInteger selPro = [pickerView selectedRowInComponent:0];
    NSInteger selcity = [pickerView selectedRowInComponent:1];
    
    model *Model = self.cityArray[selPro];
    
    self.Provence.text = Model.name;
    self.cities.text = Model.cities[selcity];
    
}

@end
