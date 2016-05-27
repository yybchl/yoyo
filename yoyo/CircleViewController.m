//
//  CircleViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"
#import "PieItem.h"

@interface CircleViewController ()

@property (strong, nonatomic) CircleView *circleView;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *items = @[[PieItem pieItemWith:[UIColor redColor] ratio:0.45], [PieItem pieItemWith:[UIColor blueColor] ratio:0.25], [PieItem pieItemWith:[UIColor greenColor] ratio:0.15], [PieItem pieItemWith:[UIColor purpleColor] ratio:0.15]];
    _circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300) Items:items];
    [self.view addSubview:_circleView];
    //添加促发按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 50, 35)];
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"绘画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startStroke) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)startStroke {
    [_circleView startPieStroke];
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
