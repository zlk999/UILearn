//
//  XNetCell.h
//  UILearn
//
//  Created by apple on 2021/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class XNetModel;
@interface XNetCell : UITableViewCell
@property (nonatomic, strong) XNetModel *netModel;
@property(nonatomic,strong) UILabel *province ;
@property(nonatomic,strong) UILabel *city ;
@property(nonatomic,strong) UILabel *weather ;
@property(nonatomic,strong) UILabel *temperature ;
@property(nonatomic,strong) UILabel *windpower ;
@end

NS_ASSUME_NONNULL_END
