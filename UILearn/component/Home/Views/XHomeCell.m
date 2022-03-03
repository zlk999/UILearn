//
//  XHomeCell.m
//  UILearn
//
//  Created by apple on 2021/11/26.
//

#import "XHomeCell.h"

@implementation XHomeCell

+ (instancetype)cellModelWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cellModel";
    XHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 100, 50)];
    label.backgroundColor = UIColor.redColor;
    
    cell.backgroundColor = [UIColor colorWithRed:242/255.0 green:246/255.0 blue:247/255.0 alpha:1.0];
    return cell;
}


@end
