//
//  LableTableViewCell.m
//  JB_DynamicCalculateCellHeightDemo
//
//  Created by jaybin on 16/6/29.
//  Copyright © 2016年 jaybin. All rights reserved.
//

#import "LableTableViewCell.h"

@interface LableTableViewCell (){
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *contentLbl;
}

@end

@implementation LableTableViewCell

+ (__kindof instancetype)lableTableViewCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LableTableViewCell";
    LableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //设置label最大的布局宽度，label显示多少行与它的宽度有关
    [contentLbl setPreferredMaxLayoutWidth:[UIScreen mainScreen].bounds.size.width-16*2];
}

- (void)setContentStr:(NSString *)contentStr{
    _contentStr = contentStr;
    
    contentLbl.text = _contentStr;
}

- (CGFloat)getCellHeigh{
    CGFloat cellHeight = 0.0f;
    //contentView的内容高度比cell的高度少1厘米，这里可以去IB上看看
    cellHeight += [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;

    return cellHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
