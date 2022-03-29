//
//  FlagView.m
//  UILearn
//
//  Created by apple on 2022/3/28.
//

#import "FlagView.h"
#import "FladModel.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation FlagView

+ (instancetype)initFlag{
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
}

+ (CGFloat)rowHeigt{
    return 150;
}

- (void)setFlagModel:(FladModel *)flagModel{
    _flagModel = flagModel;
    
    self.name.text = flagModel.name;
    self.img.image = [UIImage imageNamed:flagModel.icon];
    
}

@end
