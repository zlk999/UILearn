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
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        // 设置按钮高亮的背景图片和高亮时的背景图片
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        btnGroupTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内容的内边距
        btnGroupTitle.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 设置按钮标题距离左边的边距
        btnGroupTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
        [btnGroupTitle addTarget:self action:@selector(btnGroupTitleClicked) forControlEvents:UIControlEventTouchUpInside];
        
        btnGroupTitle.imageView.contentMode = UIViewContentModeCenter;
        
        btnGroupTitle.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        
        
        UILabel *lbl = [[UILabel alloc] init];
        [self.contentView addSubview:lbl];
        self.lblCount = lbl;
        
    }
    return self;
}

- (void)btnGroupTitleClicked{
    self.groupModel.visible = !self.groupModel.isVisible;
    
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewDidClickTitleButton:)]) {
        [self.delegate groupHeaderViewDidClickTitleButton:self];
    }
}


- (void)setGroupModel:(groups *)groupModel{
    
    _groupModel = groupModel;
    [self.btnGroupTitle setTitle:groupModel.name forState:UIControlStateNormal];
    self.lblCount.text =[ NSString stringWithFormat:@"%d / %zd",groupModel.online ,groupModel.friends.count ];
    
    if (self.groupModel.isVisible) {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    

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
