//
//  FileManagerHandler.m
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileManagerHandler.h"

@implementation FileManagerHandler

- (NSString *)getFileDirByFileCatalog:(FileDirCatalog *)fileCatalog
{
    NSString * fileDirPath;
    NSArray * rootFileArray;
    
    switch ((NSInteger)fileCatalog) {
        case 1:
            fileDirPath = NSHomeDirectory();
            break;
        case 2:
            rootFileArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES );
            break;
        case 3:
            rootFileArray = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
            break;
        case 4:
            rootFileArray =NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            break;
        case 5:
            rootFileArray = NSTemporaryDirectory();
            break;
        default:
            break;
    }
    
    fileDirPath = [rootFileArray objectAtIndex:0];
    return fileDirPath;
}

- (BOOL *)createFileByFileName:(FileDirCatalog *)typeCatalog filePath:(NSString *)saveFilePath
{
    BOOL *isCreated=false;
    NSString *filePath= [self getFileDirByFileCatalog:typeCatalog];
    filePath= [filePath stringByAppendingString:saveFilePath];
    
    //does't know how figurot diretory is exist ?
    NSFileManager *fileManager= [NSFileManager defaultManager];
    isCreated = [fileManager createFileAtPath: filePath contents:nil attributes:nil];
    return isCreated;
}


- (BOOL *)createDirectoryByFileName:(FileDirCatalog *)typeCatalog directoryName:(NSString *)dirName
{
    BOOL *isCreated=false;
    NSString *filePath= [self getFileDirByFileCatalog: typeCatalog];
    NSFileManager *fileManager= [NSFileManager defaultManager];
    
    filePath = [filePath stringByAppendingString:dirName];
    if (![self checkFileDirIsExist:filePath isDirectory:YES]) {
        NSLog(@"file no exist then create it");
        isCreated= [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return isCreated;
}

- (BOOL *) writeContentToFile:(NSString *)fileContent saveFilePath:(NSString *)saveFilePath
{
    bool isWrited=false;
    
    if ([fileContent length] > 0) {
        isWrited = [fileContent writeToFile:saveFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isWrited;
}

- (BOOL *)checkFileDirIsExist:(NSString *)filePath isDirectory:(BOOL *)isDir
{
    if ([filePath length] > 0) {
        return false;
    }
    NSFileManager *fileManager= [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath: filePath isDirectory:isDir];
}
@end