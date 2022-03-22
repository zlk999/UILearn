//
//  CZGroupHeaderView.h
//  UILearn
//
//  Created by apple on 2022/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CZGroupHeaderView;
@protocol CZGroupHeaderViewDelegate <NSObject>

- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView;

@end


@class groups;
@interface CZGroupHeaderView : UITableViewHeaderFooterView

+ (instancetype)CZGroupHeaderViewWithHeaderView:(UITableView *) tableView;

@property(nonatomic, strong) groups *groupModel;

// 增加一个代理属性
@property (nonatomic, weak) id<CZGroupHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
