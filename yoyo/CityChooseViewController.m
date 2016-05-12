//
//  CityChooseViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/12.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CityChooseViewController.h"

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

@interface CityChooseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *mainTableView; //主
@property (strong, nonatomic) UITableView *subTableView; //次
@property (strong, nonatomic) NSArray *cityList; //城市列表
@property (assign, nonatomic) NSInteger selIndex;//主列表当前选中的行
@property (assign, nonatomic) NSIndexPath *subSelIndex;//子列表当前选中的行
@property (assign, nonatomic) BOOL clickRefresh;//是否是点击主列表刷新子列表,系统刚开始默认为NO

@end

@implementation CityChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
}

#pragma mark 创建两个tableView
- (void)addTableView {
    self.title = @"城市";
    self.view.backgroundColor = [UIColor whiteColor];
    //获取目录下的city.plist文件
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    _cityList = [NSArray arrayWithContentsOfFile:plistPath];
    //刚开始，默认选中第一行
    _selIndex = 0;
    //tableView
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width / 4 + 1, screen_height) style:UITableViewStylePlain];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    [self.view addSubview:_mainTableView];
    _subTableView = [[UITableView alloc] initWithFrame:CGRectMake(screen_width / 4, 64, screen_width * 3 / 4, screen_height - 64) style:UITableViewStylePlain];
    _subTableView.dataSource = self;
    _subTableView.delegate = self;
    [self.view addSubview:_subTableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:_mainTableView]) {
        return _cityList.count;
    }else {
        NSArray *areaList = _cityList[_selIndex][@"cities"];
        return areaList.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_mainTableView]) {
        static NSString *mainCellId = @"mainCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainCellId];
        }
        cell.textLabel.text = _cityList[indexPath.row][@"state"];
        return cell;
    }else {
        static NSString *subCellId = @"subCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:subCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:subCellId];
        }
        NSArray *areaList = _cityList[_selIndex][@"cities"];
        cell.textLabel.text = areaList[indexPath.row];
        //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
        if (_subSelIndex == indexPath && _clickRefresh == NO) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_mainTableView]) {
        _selIndex = indexPath.row;
        _clickRefresh = YES;
        [_subTableView reloadData];
    }else {
        _clickRefresh = NO;
        //之前选中的，取消选择
        UITableViewCell *celled = [tableView cellForRowAtIndexPath:_subSelIndex];
        celled.accessoryType = UITableViewCellAccessoryNone;
        //记录当前选中的位置索引
        _subSelIndex = indexPath;
        //当前选择的打勾
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
