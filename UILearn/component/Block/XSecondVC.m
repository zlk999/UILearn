//
//  XSecondVC.m
//  UILearn
//
//  Created by apple on 2022/2/15.
//

#import "XSecondVC.h"
#import "XThirdVC.h"

@interface XSecondVC ()

@property (weak, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)Btn:(UIButton *)sender;

@property(nonatomic, strong) XThirdVC *vc;
@end

@implementation XSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.vc =[XThirdVC new];
    
    self.vc.SendMsg = ^(NSString * _Nonnull txt) {
        
        self.lbl.text = txt;
    };
}




- (IBAction)Btn:(UIButton *)sender {
    [self.navigationController pushViewController:self.vc animated:YES];
    
}
@end
