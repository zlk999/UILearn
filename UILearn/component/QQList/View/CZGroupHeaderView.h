//
//  CZGroupHeaderView.h
//  UILearn
//
//  Created by apple on 2022/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@class groups;
@interface CZGroupHeaderView : UITableViewHeaderFooterView

+ (instancetype)CZGroupHeaderViewWithHeaderView:(UITableView *) tableView;

@property(nonatomic, strong) groups *groupModel;

@end

NS_ASSUME_NONNULL_END
