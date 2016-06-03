//
//  CellHeightTableViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/20.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CellHeightTableViewController.h"
#import "CellHeightCell.h"

@interface CellHeightTableViewController ()

@property (strong, nonatomic) NSArray *list;

@end

@implementation CellHeightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _list = @[@"回家开很快就很快", @"换个时间的感觉很国家宏观环境国家和国家和国家和国家和国家和国家宏观环境国家宏观环境国家和国家和国家和国家和国家和国家宏观就好就回家开很快就很快就很快就好看见好看好看", @"太让人特意人尔特突然", @"空间互动分开就回家客户均可好你不你那边吗讨厌图样图沿", @"空间互动分开就回家客户均可好你不你那边吗讨厌图样图沿途愚人太让人特意人尔特突然"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _list.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = _list[indexPath.row];
    return 39 + [self getLabelHeightWithString:content andWidth:[UIScreen mainScreen].bounds.size.width - 16 andFont:[UIFont systemFontOfSize:17.0]];
}
//获取高度,传入文本框的宽度和字号以及内容
-(CGFloat)getLabelHeightWithString:(NSString *)text andWidth:(CGFloat)width andFont:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                                     attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]         // 文字的属性
                                                        context:nil].size;
    return textSize.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellid";
    UINib *nib = [UINib nibWithNibName:@"CellHeightCell" bundle:[NSBundle mainBundle]];
    [tableView registerNib:nib forCellReuseIdentifier:cellId];
    CellHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.tLabel.text = _list[indexPath.row];
    
    return cell;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
