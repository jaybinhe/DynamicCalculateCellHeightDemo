//
//  TextViewTableViewCell.m
//  JB_DynamicCalculateCellHeightDemo
//
//  Created by jaybin on 16/7/1.
//  Copyright © 2016年 jaybin. All rights reserved.
//

#import "TextViewTableViewCell.h"

@interface TextViewTableViewCell (){
    IBOutlet UITextView *contentTextView;
}

@end


@implementation TextViewTableViewCell

+ (__kindof instancetype)textViewTableViewCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"TextViewTableViewCell";
    TextViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setContentStr:(NSString *)contentStr{
    _contentStr = contentStr;
    
    contentTextView.text = _contentStr;
}

- (CGFloat)getCellHeigh{
    CGFloat cellHeight = 0;
    cellHeight += [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    cellHeight += [contentTextView sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width-106-16, FLT_MAX)].height;
    if(cellHeight<=80){
        cellHeight = 80+5+5;
    }
    cellHeight += 1;
    
    return cellHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
