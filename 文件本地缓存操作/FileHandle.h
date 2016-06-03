//
//  FileHandle.h
//  JinCaiShen
//
//  Created by 陈惠玲 on 16/4/24.
//  Copyright © 2016年 JinCaiShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHandle : NSObject

/**
 *保存数组数据到沙盒中
 *@arrayName文件名
 */
+(void)SaveArray:(NSArray *)array andFileName:(NSString *)arrayName;

/**
 *从沙盒中获取数组
 *@arrayName文件名
 */
+(NSArray *)getArrayWithFileName:(NSString *)arrayName;

/**
 *保存字典数据到沙盒中
 *@arrayName
 */
+(void)SaveDictionary:(NSDictionary *)dict andFileName:(NSString *)dictionaryName;

/**
 *从沙盒中获取字典
 *@arrayName
 */
+(NSDictionary *)getDictionaryWithFileName:(NSString *)dictionaryName;

/**
 *保存对象数据到沙盒中
 *@modelName文件名
 */
+(void)SaveModel:(id)model andFileName:(NSString *)modelName;

/**
 *从沙盒中获取对象
 *@modelName文件名
 */
+(id)getModelWithFileName:(NSString *)modelName;

/**
 *清空缓存文件夹
 */
+(void)cleanCache;

@end
