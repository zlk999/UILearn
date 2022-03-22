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

// 封装一个类方法来创建一个header view
+ (instancetype)CZGroupHeaderViewWithHeaderView:(UITableView *)tableView{
    static NSString *ID = @"reuseHeaderView";
    CZGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (headerView == nil) {
        headerView = [[CZGroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}

//重用HeaderView需要重写initWithReuseIdentifier方法
// 重写initWithReuseIdentifier方法, 在创建headerView的时候, 同时创建子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 创建按钮
         UIButton *btnGroupTitle = [[UIButton alloc] init];
        // 设置按钮的图片(三角图片)
        [btnGroupTitle setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        // 设置按钮的文字颜色
        [btnGroupTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置按钮默认的背景图片和高亮时的背景图片
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        // 设置按钮高亮的背景图片和高亮时的背景图片
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置按钮中内容整体左对齐
        btnGroupTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内容的内边距
        btnGroupTitle.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 设置按钮标题距离左边的边距
        btnGroupTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        // 为按钮增加一个点击事件
        [btnGroupTitle addTarget:self action:@selector(btnGroupTitleClicked) forControlEvents:UIControlEventTouchUpInside];
        // 设置按钮中图片的现实模式
        btnGroupTitle.imageView.contentMode = UIViewContentModeCenter;
        // 设置图片框超出的部分不要截掉
        btnGroupTitle.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        
        
        UILabel *lbl = [[UILabel alloc] init];
        [self.contentView addSubview:lbl];
        self.lblCount = lbl;
        
    }
    return self;
}

// 组标题按钮的点击事件
- (void)btnGroupTitleClicked{
    // 1. 设置组的状态
    self.groupModel.visible = !self.groupModel.isVisible;
    //    // 2.刷新tableView
        // 通过代理来实现
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewDidClickTitleButton:)]) {
        // 调用代理方法
        [self.delegate groupHeaderViewDidClickTitleButton:self];
    }
}


- (void)setGroupModel:(groups *)groupModel{
    
    _groupModel = groupModel;
    // 设置数据
    
    // 设置按钮上的文字
    [self.btnGroupTitle setTitle:groupModel.name forState:UIControlStateNormal];
    // 设置 lblCount商的文字
    self.lblCount.text =[ NSString stringWithFormat:@"%d / %zd",groupModel.online ,groupModel.friends.count ];
    // 设置按钮中的图片旋转问题
    if (self.groupModel.isVisible) {
        // 3. 让按钮中的图片实现旋转  解决重用的时候按钮展开小三角展示不正确
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    // 设置frame不要写在这里, 因为在这里获取的当前控件(self)的宽和高都是0
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

// 当一个新的header view 已经加到某个父控件中的时候执行这个方法。 当点击head的时候，会重新创造一个head，添加到head原来的位置上
- (void)didMoveToSuperview {

    if (self.groupModel.isVisible) {
        // 3. 让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
