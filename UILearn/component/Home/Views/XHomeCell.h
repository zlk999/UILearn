//
//  XHomeCell.h
//  UILearn
//
//  Created by apple on 2021/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHomeCell : UITableViewCell
// 封装一个创建自定义Cell的方法
+ (instancetype)cellModelWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
