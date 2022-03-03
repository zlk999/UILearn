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


@end

@implementation XSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   

}




- (IBAction)Btn:(UIButton *)sender {
    XThirdVC *vc = [XThirdVC new];
    
    vc.SendMsg = ^(NSString * _Nonnull txt) {
        self.lbl.text = txt;
    };
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
