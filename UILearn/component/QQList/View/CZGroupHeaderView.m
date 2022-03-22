//
//  CZGroupHeaderView.m
//  UILearn
//
//  Created by apple on 2022/3/21.
//

#import "CZGroupHeaderView.h"
#import "groups.h"

@interface CZGroupHeaderView ()
@property (nonatomic, weak) UIButton *btnGroupTitle;

@property (nonatomic, weak) UILabel *lblCount;


@end

@implementation CZGroupHeaderView

+ (instancetype)CZGroupHeaderViewWithHeaderView:(UITableView *)tableView{
    static NSString *ID = @"reuseHeaderView";
    CZGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[CZGroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
         UIButton *btnGroupTitle = [[UIButton alloc] init];
        [btnGroupTitle setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btnGroupTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        
        
        UILabel *lbl = [[UILabel alloc] init];
        [self.contentView addSubview:lbl];
        self.lblCount = lbl;
        
    }
    return self;
}


- (void)setGroupModel:(groups *)groupModel{
    
    _groupModel = groupModel;
    [self.btnGroupTitle setTitle:groupModel.name forState:UIControlStateNormal];
    self.lblCount.text =[ NSString stringWithFormat:@"%d / %zd",groupModel.online ,groupModel.friends.count ];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.btnGroupTitle.frame = self.bounds;
    
    CGFloat lblW = 100;
    CGFloat lblH = self.bounds.size.height;
    CGFloat lblX = self.bounds.size.width - 10 - lblW;
    CGFloat lblY = 0;
    
    self.lblCount.frame = CGRectMake(lblX, lblY, lblW, lblH);
}

// 当一个新的header view 已经加到某个父控件中的时候执行这个方法。
- (void)didMoveToSuperview {


    if (self.groupModel.isVisible) {
        // 3. 让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
