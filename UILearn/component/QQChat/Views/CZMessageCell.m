//
//  CZMessageCell.m
//  UILearn
//
//  Created by apple on 2022/3/22.
//

#import "CZMessageCell.h"
#import "CZMessage.h"
#import "CZMessageFrame.h"

@interface CZMessageCell ()

@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UIButton *btnText;

@end

@implementation CZMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *lblTime = [UILabel new];
        lblTime.font = [UIFont systemFontOfSize:12];
        // 设置文字居中
        lblTime.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lblTime];
        _lblTime = lblTime;
        
        UIImageView *imgViewIcon = [UIImageView new];
        
        [self.contentView addSubview:imgViewIcon];
        _imgViewIcon = imgViewIcon;
        
        UIButton *btnText = [UIButton new];
        btnText.titleLabel.font = textFont;
        // 修改按钮的正文文字颜色
        [btnText setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        // 设置按钮中的label的文字可以换行
        btnText.titleLabel.numberOfLines = 0;
        // 设置按钮的内边距
        btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [self.contentView addSubview:btnText];
        _btnText = btnText;
    }
    return self;
}

+ (instancetype)messageCellWithTableView:(UITableView *)TableView{
    static NSString *ID = @"reuseCell";
    
    CZMessageCell *cell = [TableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CZMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMessageFrame:(CZMessageFrame *)messageFrame{
    _messageFrame = messageFrame;
    
    CZMessage *message = messageFrame.message;
    
    self.lblTime.text = message.time;
    self.lblTime.frame = messageFrame.timeFrame;
    
    NSString *iconImg = message.type == CZMessageTypeMe ? @"me" : @"other";
    self.imgViewIcon.image = [UIImage imageNamed:iconImg];
    self.imgViewIcon.frame = messageFrame.iconFrame;
    
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame = messageFrame.textFrame;
    
}

@end
