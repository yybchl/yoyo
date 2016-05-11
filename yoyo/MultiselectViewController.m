//
//  TestViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/6.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "MultiselectViewController.h"
#import "CheckViewController.h"

@interface MultiselectViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *selectIndexs;//选中的行

@end

@implementation MultiselectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectIndexs = [NSMutableArray new];
    self.title = @"多选";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped]; //Grouped类型的，section头部就不会一直停留在最上面
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_tableView];
    //多选
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setTitle:@"单选" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(checksView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
//跳到多选页面
- (void) checksView {
    CheckViewController *checkVC = [CheckViewController new];
    [self.navigationController pushViewController:checkVC animated:YES];
}
#pragma mark 列数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else if (section == 1) {
        return 14;
    }else {
        return 1;
    }
}
#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}
#pragma mark 列表头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}
#pragma mark 列表尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}
#pragma mark 列表头设置成自定义视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 25)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //设置勾
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (NSIndexPath *index in _selectIndexs) {
        if (index == indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        }
    }
    //需要赋值的时候，可以分开判断
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1) {
    
    }else {
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zi列,第%zi行",indexPath.section, indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //现在选中的
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [_selectIndexs removeObject:indexPath];
    }else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [_selectIndexs addObject:indexPath];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
