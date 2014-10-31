//
//  FileManagerHandler.h
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

@interface FileManagerHandler : NSObject

typedef enum
{
    RootDir=1,
    DocumentDir=2,
    LibraryDir=3,
    LibraryCacheDir=4,
    TmpDir=5
} FileDirCatalog;

- (NSString *) getFileDirByFileCatalog : (FileDirCatalog *) fileCatalog;

- (BOOL *) createFileByFileName:(FileDirCatalog *) typeCatalog filePath:(NSString *) saveFilePath;

- (BOOL *) createDirectoryByFileName: (FileDirCatalog *)typeCatalog directoryName:(NSString *) dirName;

- (BOOL *) writeContentToFile: (NSString *) fileContent saveFilePath:(NSString *) saveFilePath;

- (BOOL *) checkFileDirIsExist: (NSString *) fileDir isDirectory:(BOOL *) isDir;
@end