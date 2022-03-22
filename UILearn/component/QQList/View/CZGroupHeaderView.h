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

@property(strong, nonatomic) groups *group;

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;

@property(nonatomic, weak) id<CZGroupHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
