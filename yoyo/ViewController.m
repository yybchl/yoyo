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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
