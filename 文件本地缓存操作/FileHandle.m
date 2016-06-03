//
//  FileHandle.m
//  JinCaiShen
//
//  Created by 陈惠玲 on 16/4/24.
//  Copyright © 2016年 JinCaiShen. All rights reserved.
//

#import "FileHandle.h"

@implementation FileHandle

/**
 *保存数组数据到沙河中
 *@arrayName
 */
+(void)SaveArray:(NSArray *)array andFileName:(NSString *)arrayName{
    /**
     沙盒文件
     
     每个ios应用都有自己的应用沙盒，应用沙盒就是文件系统目录，与其他应用的文件系统隔离，ios系统不允许访问其他应用的应用沙盒。在ios8中已经开放访问。
     
     应用沙盒一般包括以下几个文件目录：应用程序包、Documents、Libaray（下面有Caches和Preferences目录）、tmp。
     
     应用程序包：包含所有的资源文件和可执行文件。
     
     Documents：保存应用运行时生成的需要持久化的数据，iTunes会自动备份该目录。苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
     
     tmp：保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也有可能会清除该目录下的文件，iTunes不会同步该目录。iphone重启时，该目录下的文件会丢失。
     
     Library：存储程序的默认设置和其他状态信息，iTunes会自动备份该目录。
     
     Libaray/Caches: 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除。一般存放体积比较大，不是特别重要的资源。
     
     Libaray/Preferences: 保存应用的所有偏好设置，ios的Settings（设置）应用会在该目录中查找应用的设置信息，iTunes会自动备份该目录。
     
     沙盒文件目录获取代码：
     
     //Home目录
     NSString *homeDirectory = NSHomeDirectory();
     
     //Document目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //Cache目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //Libaray目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //tmp目录
     NSString *tmpDir = NSTemporaryDirectory();
     */
    
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:arrayName];
    
    NSMutableArray *marray = [NSMutableArray new];
    
    for (id dict in array) {
        if ([dict isKindOfClass:[NSDictionary class]] || [dict isKindOfClass:[NSMutableDictionary class]]) {
            NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
            //排除nsnull
            for (NSString *key in [mDict allKeys]) {
                if (mDict[key] == [NSNull null]) {
                    [mDict setValue:@"" forKey:key];
                }
            }
            [marray addObject:mDict];
        }
    }
    
    //保存数组元素到本地文件，以xml格式序列化存储
    [marray writeToFile:path atomically:YES];
    
}
/**
 *从沙河中获取数组
 *@arrayName
 */
+(NSArray *)getArrayWithFileName:(NSString *)arrayName{
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:arrayName];
    //读取本地文件，反序列化为数组
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
    return array;
}

/**
 *保存字典数据到沙盒中
 *@arrayName
 */
+(void)SaveDictionary:(NSDictionary *)dict andFileName:(NSString *)dictionaryName{
    /**
     沙盒文件
     
     每个ios应用都有自己的应用沙盒，应用沙盒就是文件系统目录，与其他应用的文件系统隔离，ios系统不允许访问其他应用的应用沙盒。在ios8中已经开放访问。
     
     应用沙盒一般包括以下几个文件目录：应用程序包、Documents、Libaray（下面有Caches和Preferences目录）、tmp。
     
     应用程序包：包含所有的资源文件和可执行文件。
     
     Documents：保存应用运行时生成的需要持久化的数据，iTunes会自动备份该目录。苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
     
     tmp：保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也有可能会清除该目录下的文件，iTunes不会同步该目录。iphone重启时，该目录下的文件会丢失。
     
     Library：存储程序的默认设置和其他状态信息，iTunes会自动备份该目录。
     
     Libaray/Caches: 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除。一般存放体积比较大，不是特别重要的资源。
     
     Libaray/Preferences: 保存应用的所有偏好设置，ios的Settings（设置）应用会在该目录中查找应用的设置信息，iTunes会自动备份该目录。
     
     沙盒文件目录获取代码：
     
     //Home目录
     NSString *homeDirectory = NSHomeDirectory();
     
     //Document目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //Cache目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //Libaray目录
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
     NSString *path = [paths objectAtIndex:0];
     
     //tmp目录
     NSString *tmpDir = NSTemporaryDirectory();
     */
    
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:dictionaryName];
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    //排除nsnull
    for (NSString *key in [mDict allKeys]) {
        if (mDict[key] == [NSNull null]) {
            [mDict setValue:@"" forKey:key];
        }
    }
    //保存字典元素到本地文件，以xml格式序列化存储
    [mDict writeToFile:path atomically:YES];
}
/**
 *从沙河中获取字典
 *@arrayName
 */
+(NSDictionary *)getDictionaryWithFileName:(NSString *)dictionaryName{
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:dictionaryName];
    //读取本地文件，反序列化为数组
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    return dict;
}

/**
 *保存对象数据到沙盒中
 *@modelName
 */
+(void)SaveModel:(id)model andFileName:(NSString *)modelName{
    
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:modelName];
    
    //将自定义的对象保存到文件中
    [NSKeyedArchiver archiveRootObject:model toFile:path];
    
}

/**
 *从沙盒中获取对象
 *@modelName
 */
+(id)getModelWithFileName:(NSString *)modelName{
    
    //Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    //拼接文件名
    path = [path stringByAppendingPathComponent:modelName];
    
    //获取对象
    id model = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return model;
}

/**
 *清空缓存文件夹
 */
+(void)cleanCache{
    //GCD异步操作
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //Cache目录
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        //获取到缓存目录的文件
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:path];
        //一共几个文件
        NSLog(@"files :%ld",[files count]);
        //遍历删除各个文件
        for ( NSString *subPath  in files) {
            NSError *error;
            //拼接路径
            NSString *fullPath = [path stringByAppendingPathComponent:subPath];
            //如果存在临时文件
            if([[NSFileManager defaultManager] fileExistsAtPath:fullPath]) {
                //删除文件
                [[NSFileManager defaultManager] removeItemAtPath:fullPath error:&error];
            }
        }
    });
}

@end
