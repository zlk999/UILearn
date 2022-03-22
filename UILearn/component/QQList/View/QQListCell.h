//
//  QQListCell.h
//  UILearn
//
//  Created by apple on 2022/3/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class friend;
@interface QQListCell : UITableViewCell

+ (instancetype)friendWithTableView:(UITableView *)tableview;

@property (nonatomic, strong) friend *friendModel;
@end

NS_ASSUME_NONNULL_END
