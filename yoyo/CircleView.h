//
//  CircleView.h
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

-(instancetype)initWithFrame:(CGRect)frame Items:(NSArray *)items; //初始化

#pragma mark 开始画图
-(void) startPieStroke;

@end
