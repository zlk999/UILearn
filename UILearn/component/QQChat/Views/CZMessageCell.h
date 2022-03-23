//
//  CZMessageCell.h
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CZMessageFrame;
@interface CZMessageCell : UITableViewCell

@property(nonatomic, strong) CZMessageFrame *messageFrame;

+ (instancetype)messageCellWithTableView:(UITableView *)TableView;

@end

NS_ASSUME_NONNULL_END
