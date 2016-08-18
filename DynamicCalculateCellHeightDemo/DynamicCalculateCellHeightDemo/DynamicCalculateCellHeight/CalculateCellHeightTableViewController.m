//
//  CalculateCellHeightTableViewController.m
//  JB_DynamicCalculateCellHeightDemo
//
//  Created by jaybin on 16/6/29.
//  Copyright © 2016年 jaybin. All rights reserved.
//

#import "CalculateCellHeightTableViewController.h"
#import "LableTableViewCell.h"
#import "TextViewTableViewCell.h"

@interface CalculateCellHeightTableViewController ()

/**
 *  tableview datasource
 */
@property (nonatomic, strong, nonnull) NSArray<NSString *> *dataArray;

/**
 *  key   : identifier of cell
 *  value : instance of cell
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, __kindof UITableViewCell *> *cellDict;

@end


@implementation CalculateCellHeightTableViewController

#pragma mark - LifeCrycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configuredTableView];
}

#pragma mark - Getters and Setters

- (NSArray<NSString *> *)dataArray{
    if(!_dataArray){
        _dataArray = @[@"Hello World\n动态计算高度",
                       @"1\n2\n3\n4\n5\n6",
                       @"IOS开发者 热爱生活 热爱一切美好的事物",
                       @"带着曾经的梦中幻想，告别昨日的紧张彷徨，新的一天要大踏步迈向前方。",
                       @"当有一天，你发现你的情绪不能用语言说出来，而宁愿让自己渐渐消失在深夜亮着着华丽街灯的街道上，这就是孤独。",
                       @"到了现在这个年纪，谁都不想再取悦了，跟谁在一起舒服就和谁在一起，包括朋友也是，累了就躲远一点。取悦别人远不如快乐自己。宁可孤独，也不违心。宁可抱憾，也不将就。能入我心者，我待以君王。不入我心者，不屑敷衍。往事浓淡，色如清，已轻。经年悲喜，净如镜，已静。",
                       @"I know what i want,and i know how to get it,and doing it now.that’s all.——我知道我想要什么，也知道我该怎么去得到，而且正在做。这样就够了。",
                       @"“这个世界上总有那么20%的人，就是莫名其妙的喜欢你，总有那么20%的人，就是莫名其妙的讨厌你，剩余的60%的人处于中立状态。如果我们把关注点放在那个莫名其妙讨厌你的人身上，那我们每天接受到的信息就会烦恼不断。但是，如果你把关注点放在20%的喜欢你的人身上，每天就是如沐春风。”",
                       @"Time heals almost everything. Give time, time.时间几乎可以治愈一切。给时间一些时间。",
                       @"因为天真的理想主义者纵使执着、纵使顽强，却依然是软弱的。他们并不明白，在这世上，很多事情你可以不理解，却必须接受。只有真正了解这个世界的丑陋与污浊，被现实打击，被痛苦折磨，遍体鳞伤、无所遁形，却从未放弃对光明的追寻，依然微笑着，坚定前行的人，才是真正的勇者。不经历黑暗的人，是无法懂得光明的。——当年明月《明朝那些事儿》",
                       @"1989",
                       @"4234243242"
                       ];
    }
    return _dataArray;
}

- (NSMutableDictionary<NSString *, __kindof UITableViewCell *> *)cellDict{
    if(!_cellDict){
        _cellDict = @{}.mutableCopy;
    }
    
    return _cellDict;
}

#pragma mark - PrivateMethods

- (void)configuredTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LableTableViewCell class]) bundle:nil]forCellReuseIdentifier:NSStringFromClass([LableTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TextViewTableViewCell class]) bundle:nil]forCellReuseIdentifier:NSStringFromClass([TextViewTableViewCell class])];
}

- (__kindof UITableViewCell *)getTableViewCellWithIdentifier:(NSString *)identifier{
    UITableViewCell *cell = self.cellDict[identifier];
    if(!cell){
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        self.cellDict[identifier] = cell;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellHeight = 0;
    if(indexPath.row%2==0){
        //仅用于对应类型cell的高度计算，不参与界面显示
        LableTableViewCell *lableCell = [self getTableViewCellWithIdentifier:NSStringFromClass([LableTableViewCell class])];
        [lableCell setContentStr:self.dataArray[indexPath.row]];
        cellHeight = [lableCell getCellHeigh];
    }else{
        //仅用于对应类型cell的高度计算，不参与界面显示
        TextViewTableViewCell *textViewCell = [self getTableViewCellWithIdentifier:NSStringFromClass([TextViewTableViewCell class])];
        [textViewCell setContentStr:self.dataArray[indexPath.row]];
        cellHeight = [textViewCell getCellHeigh];
    }
    
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    if(indexPath.row%2==0){
        LableTableViewCell *lableTableViewCell = [LableTableViewCell lableTableViewCellWithTableView:tableView forIndexPath:indexPath];
        [lableTableViewCell setContentStr:self.dataArray[indexPath.row]];
        return lableTableViewCell;
    }else{
        TextViewTableViewCell *textViewTableViewCell = [TextViewTableViewCell textViewTableViewCellWithTableView:tableView forIndexPath:indexPath];
        [textViewTableViewCell setContentStr:self.dataArray[indexPath.row]];
        return textViewTableViewCell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
