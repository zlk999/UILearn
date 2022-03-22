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

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell_head";
    CZGroupHeaderView *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CZGroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return cell;
}

// 重写initWithReuseIdentifier方法, 在创建headerView的时候, 同时创建子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
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
        
        // 创建lable
        UILabel *lblCount = [[UILabel alloc] init];
        [self.contentView addSubview:lblCount];
        self.lblCount = lblCount;
    }
    return self;
}

// 组标题按钮的点击事件
- (void)btnGroupTitleClicked
{

    // 1. 设置组的状态
    self.group.visible = !self.group.isVisible;
    
//    // 2.刷新tableView
    // 通过代理来实现
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewDidClickTitleButton:)]) {
        // 调用代理方法
       
        [self.delegate groupHeaderViewDidClickTitleButton:self];
    }
}


// 当一个新的header view 已经加到某个父控件中的时候执行这个方法。
- (void)didMoveToSuperview{
    if (self.group.isVisible) {// 3. 让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (void)setGroup:(groups *)group{
    _group = group;
    [self.btnGroupTitle setTitle:group.name forState:UIControlStateNormal];
    self.lblCount.text = [NSString stringWithFormat:@"%d / %zd",group.online, group.friends.count ];
    
    
    // 设置按钮中的图片旋转问题
    if (self.group.isVisible) {
        // 3. 让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}
// 当当前控件的frame发生改变的时候会调用这个方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮的frame
    self.btnGroupTitle.frame = self.bounds;
    //NSLog(@"%@", NSStringFromCGRect(self.btnGroupTitle.frame));
    
    // 设置lable的frame
    CGFloat lblW = 100;
    CGFloat lblH = self.bounds.size.height;
    CGFloat lblX = self.bounds.size.width - 10 - lblW;
    CGFloat lblY = 0;
    self.lblCount.frame = CGRectMake(lblX, lblY, lblW, lblH);
    //NSLog(@"%@", NSStringFromCGRect(self.lblCount.frame));
}

@end
