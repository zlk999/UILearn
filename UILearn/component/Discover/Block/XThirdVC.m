//
//  XThirdVC.m
//  UILearn
//
//  Created by apple on 2022/2/15.
//

#import "XThirdVC.h"

@interface XThirdVC ()
@property (weak, nonatomic) IBOutlet UITextField *Field;

@end

@implementation XThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.Field.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    if (self.SendMsg) {
        self.SendMsg(_Field.text);
    }
}

@end
