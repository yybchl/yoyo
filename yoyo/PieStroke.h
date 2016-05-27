//
//  PieStroke.h
//  yoyo
//
//  Created by YoYo on 16/5/27.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PieStroke : NSObject

@property (assign, nonatomic) CGPoint pieCenter;//中心点
@property (assign, nonatomic) CGFloat pieRadius;//半径
@property (strong, nonatomic) UIBezierPath *circlePath;//贝塞尔路径
@property (strong, nonatomic) CAShapeLayer *spLayer;//形状渲染图层
//初始化方法
+ (instancetype)pieStrokeWithCenter:(CGPoint)pieCenter ratio:(CGFloat)pieRadius circlePath:(UIBezierPath *)circlePath spLayer:(CAShapeLayer *)spLayer;

@end
