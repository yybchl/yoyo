//
//  ChecksViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/11.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CheckViewController.h"
#import "ProvinceChooseTableViewController.h"

@interface CheckViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行

@end

@implementation CheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"单选";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped]; //Grouped类型的，section头部就不会一直停留在最上面
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_tableView];
    //多选
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setTitle:@"城市" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(cityView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
//跳到多选页面
- (void) cityView {
    ProvinceChooseTableViewController *vc = [ProvinceChooseTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
    cell.textLabel.text = [NSString stringWithFormat:@"第%zi列,第%zi行",indexPath.section, indexPath.row];
    
    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
    if (_selIndex == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //之前选中的，取消选择
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    celled.accessoryType = UITableViewCellAccessoryNone;
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
