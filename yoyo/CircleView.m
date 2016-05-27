//
//  CircleView.m
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "CircleView.h"
#import "PieItem.h"
#import "PieStroke.h"

@implementation CircleView {
    CGPoint _pieCenter;//中心点
    CGFloat _pieRadius;//半径
    NSMutableArray *_pathArray;//路径数组
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
        //画底图
        [self drawBasePie:frame];
        CGFloat startAngle = M_PI * 0.25; //开始的角度
        CGFloat endAngle = 0;//结束的位置
        _pathArray = [NSMutableArray new];
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
            _pieCenter = CGPointMake(frame.size.width/2, frame.size.height/2);
            _pieRadius = frame.size.height / 2 - 50;
            //创建path
            UIBezierPath *circlePath = [UIBezierPath bezierPath];
            // 添加圆到path
            [circlePath addArcWithCenter:_pieCenter radius:_pieRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
            //添加到数组
            PieStroke *pieStroke = [PieStroke pieStrokeWithCenter:_pieCenter ratio:_pieRadius circlePath:circlePath spLayer:_spLayer];
            [_pathArray addObject:pieStroke];
            
            //获取每一截环的开始点
            [self calcCircleCoordinateWithCenter:_pieCenter andWithAngle:startAngle  andWithRadius:_pieRadius];
            
            startAngle = startAngle + M_PI * 2.0 * item.ratio;
        }
    }
    return self;
}
#pragma mark 顺时针计算圆圈上点在IOS系统中的坐标，传入弧度
-(CGPoint) calcCircleCoordinateWithCenter:(CGPoint)center andWithAngle:(CGFloat)angle andWithRadius:(CGFloat)radius {
    CGFloat x2 = radius*cosf(angle);
    CGFloat y2 = radius*sinf(angle);
    return CGPointMake(center.x+x2, center.y+y2);
}
#pragma mark 画底图
-(void) drawBasePie:(CGRect)frame {
    CAShapeLayer *_spLayer = [CAShapeLayer layer];
    _spLayer.lineCap = kCALineCapButt;//设置线条起点和终点的样式
    _spLayer.lineJoin = kCALineJoinBevel;//设置线条的转角的样式
    _spLayer.fillColor   = [[UIColor clearColor] CGColor];
    _spLayer.strokeColor   = [[UIColor lightGrayColor] CGColor];
    _spLayer.lineWidth   = 60.0;
    [self.layer addSublayer:_spLayer];
    //创建path
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    // 添加圆到path
    [circlePath addArcWithCenter:CGPointMake(frame.size.width/2, frame.size.height/2) radius:frame.size.height / 2 - 50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    _spLayer.path = circlePath.CGPath;

}
#pragma mark 开始画图
-(void) startPieStroke {
    for (PieStroke *item in _pathArray) {
        item.spLayer.path = item.circlePath.CGPath;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(1.0);
        animation.duration = 1.0;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.autoreverses = NO;
        [item.spLayer addAnimation:animation forKey:@"strokeEnd"];
    }
}

@end
