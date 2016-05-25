//
//  PieItem.h
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PieItem : NSObject

@property (strong, nonatomic) UIColor *pieColor;//扇形的颜色
@property (assign, nonatomic) CGFloat ratio;//比例

+ (instancetype)pieItemWith:(UIColor *)pieColor ratio:(CGFloat)ratio;

@end
