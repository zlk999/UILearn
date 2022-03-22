//
//  QQListCell.m
//  UILearn
//
//  Created by apple on 2022/3/18.
//

#import "QQListCell.h"
#import "friend.h"
@implementation QQListCell

+ (instancetype)friendWithTableView:(UITableView *)tableview{
    static NSString *ID = @"frienf_cell";
    QQListCell *cell =  [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setFriendModel:(friend *)friendModel{
    _friendModel = friendModel;
    self.imageView.image = [UIImage imageNamed:friendModel.icon];
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
    
//    根据当前还有是否为Vip显示红色昵称
    self.textLabel.textColor = friendModel.isVip ? [UIColor redColor] : [UIColor blackColor];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
