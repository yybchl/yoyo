//
//  ViewController.m
//  yoyo
//
//  Created by zx on 16/5/5.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "ViewController.h"
#import "MultiselectViewController.h"
#import "CityChooseViewController.h"
#import "TextUpViewController.h"
#import "CellHeightTableViewController.h"
#import "MyAnimalViewController.h"
#import "MyCurveAnimalViewController.h"
#import "CircleViewController.h"
#import "FileHandle.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 260, self.view.frame.size.width - 16, 35)];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.placeholder = @"请输入关键字";
    [searchBar setImage:[UIImage imageNamed:@"test_sousuo"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal]; //替换收缩放大镜
    [searchBar setImage:[UIImage imageNamed:@"test_quxiao"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal]; //输入的时候，右侧的清除按钮
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"sousuokuang"] forState:UIControlStateNormal]; //输入背景框
    //改变提示文字颜色
    UITextField *sbTextField = [searchBar valueForKey:@"searchField"]; //首先取出textfield
    sbTextField.textColor = [UIColor blueColor]; //输入的颜色
    UILabel *sbPlaceholderLabel = [sbTextField valueForKey:@"placeholderLabel"]; //然后取出textField的placeHolder
    sbPlaceholderLabel.textColor = [UIColor redColor]; //改变颜色
    searchBar.delegate = self;
    //取消按钮有显示的时候
    searchBar.showsCancelButton = YES;
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"]; //首先取出cancelBtn
    cancelBtn.enabled = YES;
    //这样就可以随便设置这个按钮了
    [cancelBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.view addSubview:searchBar];
    NSArray *arr = @[@"hhhh",@"jjj"];
    [FileHandle SaveArray:arr andFileName:@"testttttyoyo"];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder]; //searchBar失去焦点
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"]; //首先取出cancelBtn
    cancelBtn.enabled = YES; //把enabled设置为yes
}
- (IBAction)nextAction:(id)sender {
    MultiselectViewController *vc = [MultiselectViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)selectCity:(id)sender {
    CityChooseViewController *vc = [CityChooseViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)textFieldUp:(id)sender {
    TextUpViewController *vc = [TextUpViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)cellHeightAction:(id)sender {
    [FileHandle cleanCache];
    CellHeightTableViewController *vc = [CellHeightTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)animalAction:(id)sender {
    MyAnimalViewController *vc = [MyAnimalViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)curveAnimalAction:(id)sender {
    MyCurveAnimalViewController *vc = [MyCurveAnimalViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)circleAction:(id)sender {
    CircleViewController *vc = [CircleViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
