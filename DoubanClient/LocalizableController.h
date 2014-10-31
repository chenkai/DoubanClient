//
//  LocalizableController.h
//  DoubanClient
//
//  Created by chenkai on 14/10/29.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LocalizableController : NSObject

- (NSBundle *) currentBundle;

- (void) initUserLanguage;

- (NSString *) currentUserLanguage;

- (void) setUserLanguage: (NSString *) language;

- (NSString *) getSystemLanguage;

@property (atomic,readwrite) BOOL *isUsedSystemToChangeLanguage;

@end