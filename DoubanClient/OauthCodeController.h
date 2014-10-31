//
//  OauthCodeController.h
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "OauthAccess.h"
#import "DataRequestHandler.h"
#import "JsonConvertHandler.h"
#import "FileManagerHandler.h"

@interface OauthCodeController : UIViewController <UIWebViewDelegate>

@property (atomic,readwrite) OauthAccess *oauthcAccess;
@property (atomic,readwrite) DataRequestHandler *dataRequestHandler;
@property (atomic,readwrite) JsonConvertHandler *jsonConvertHandler;
@property (atomic,readwrite) FileManagerHandler *fileManageHandler;

- (void) saveAccessTokenCodeToLocal:(NSDictionary *) jsonData;

@end