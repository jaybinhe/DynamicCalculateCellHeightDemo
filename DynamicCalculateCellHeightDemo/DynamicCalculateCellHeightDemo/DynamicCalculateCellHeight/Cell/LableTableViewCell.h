//
//  LableTableViewCell.h
//  JB_DynamicCalculateCellHeightDemo
//
//  Created by jaybin on 16/6/29.
//  Copyright © 2016年 jaybin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LableTableViewCell : UITableViewCell

+ (__kindof instancetype)lableTableViewCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, copy) NSString *contentStr;

- (CGFloat)getCellHeigh;

@end
