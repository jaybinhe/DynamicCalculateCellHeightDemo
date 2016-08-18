//
//  TextViewTableViewCell.h
//  JB_DynamicCalculateCellHeightDemo
//
//  Created by jaybin on 16/7/1.
//  Copyright © 2016年 jaybin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTableViewCell : UITableViewCell

+ (__kindof instancetype)textViewTableViewCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, copy) NSString *contentStr;

- (CGFloat)getCellHeigh;

@end
