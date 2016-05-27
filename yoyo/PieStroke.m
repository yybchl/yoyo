//
//  PieStroke.m
//  yoyo
//
//  Created by YoYo on 16/5/27.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "PieStroke.h"

@implementation PieStroke
//初始化方法
+ (instancetype)pieStrokeWithCenter:(CGPoint)pieCenter ratio:(CGFloat)pieRadius circlePath:(UIBezierPath *)circlePath spLayer:(CAShapeLayer *)spLayer{
    PieStroke *pieStroke = [PieStroke new];
    pieStroke.pieCenter = pieCenter;
    pieStroke.pieRadius = pieRadius;
    pieStroke.circlePath = circlePath;
    pieStroke.spLayer = spLayer;
    return pieStroke;
}
@end
