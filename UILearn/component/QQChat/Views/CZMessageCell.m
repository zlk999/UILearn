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
        // 设置按钮的内边距 以使得文字和按钮边缘有内边距，避免文字超出图片气泡 在frame中按钮的宽高增加40、30
        btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [self.contentView addSubview:btnText];
        _btnText = btnText;
    }
    self.backgroundColor = [UIColor clearColor];
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
    self.lblTime.hidden = message.hideTime;
    
    NSString *iconImg = message.type == CZMessageTypeMe ? @"me" : @"other";
    self.imgViewIcon.image = [UIImage imageNamed:iconImg];
    self.imgViewIcon.frame = messageFrame.iconFrame;
    
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame = messageFrame.textFrame;
    
    // 设置正文的背景图
    NSString *imgNor, *imgHighlighted;
    if (message.type == CZMessageTypeMe) {
        // 自己发的消息
        imgNor = @"chat_send_nor";
        imgHighlighted = @"chat_send_press_pic";
        
        // 设置消息的正文文字颜色为 "白色"
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        // 对方发的消息
        imgNor = @"chat_recive_nor";
        imgHighlighted = @"chat_recive_press_pic";
        
       // 设置消息的正文文字颜色为 "黑色"
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    // 加载图片
    UIImage *imageNormal = [UIImage imageNamed:imgNor];
    UIImage *imageHighlighted = [UIImage imageNamed:imgHighlighted];
    
    imageNormal = [imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width * 0.5 topCapHeight:imageNormal.size.height * 0.5];
    imageHighlighted = [imageHighlighted stretchableImageWithLeftCapWidth:imageHighlighted.size.width * 0.5 topCapHeight:imageHighlighted.size.height * 0.5];
    
    // 设置背景图
    [self.btnText setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    
}

@end
