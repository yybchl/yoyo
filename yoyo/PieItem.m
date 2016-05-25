//
//  PieItem.m
//  yoyo
//
//  Created by YoYo on 16/5/25.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//

#import "PieItem.h"

@implementation PieItem

+ (instancetype)pieItemWith:(UIColor *)pieColor ratio:(CGFloat)ratio {
    PieItem *item = [PieItem new];
    item.pieColor = pieColor;
    item.ratio  = ratio;
    return item;
}

@end
