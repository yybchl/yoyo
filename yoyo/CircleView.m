//
//  CircleView.m
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CircleView.h"
#import "PieItem.h"

@implementation CircleView {
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    //创建path
//    UIBezierPath *circlePath = [UIBezierPath bezierPath];
//    // 添加圆到path
//    [circlePath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:100.0 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
//    // 设置描边宽度（为了让描边看上去更清楚）
//    [circlePath setLineWidth:5.0];
//    //设置颜色（颜色设置也可以放在最上面，只要在绘制前都可以）
//    [[UIColor blueColor] setStroke];
//    [[UIColor redColor] setFill];
//    // 描边和填充
//    [circlePath stroke];
//    [circlePath fill];
}
-(instancetype)initWithFrame:(CGRect)frame Items:(NSArray *)items{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        CGFloat startAngle = M_PI * 0.25; //开始的角度
        CGFloat endAngle = 0;//结束的位置
        for (int i = 0; i < items.count; i++) {
            PieItem *item  = items[i];
            CAShapeLayer *_spLayer = [CAShapeLayer layer];
            _spLayer.lineCap = kCALineCapButt;//设置线条起点和终点的样式
            _spLayer.lineJoin = kCALineJoinBevel;//设置线条的转角的样式
            _spLayer.fillColor   = [[UIColor clearColor] CGColor];
            _spLayer.strokeColor   = [item.pieColor CGColor];
            _spLayer.lineWidth   = 60.0;
            [self.layer addSublayer:_spLayer];
            endAngle = startAngle + M_PI * 2.0 * item.ratio;
            //创建path
            UIBezierPath *circlePath = [UIBezierPath bezierPath];
            // 添加圆到path
            [circlePath addArcWithCenter:CGPointMake(frame.size.width/2, frame.size.height/2) radius:frame.size.height / 2 - 50 startAngle:startAngle endAngle:endAngle clockwise:YES];
            _spLayer.path = circlePath.CGPath;
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.fromValue = @(0.0);
            animation.toValue = @(1.0);
            animation.duration = 1.0;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation.autoreverses = NO;
            [_spLayer addAnimation:animation forKey:@"strokeEnd"];
            startAngle = startAngle + M_PI * 2.0 * item.ratio;
        }
    }
    return self;
}

@end
