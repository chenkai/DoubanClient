//
//  DoubanAccessTokenInfo.h
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

@interface DoubanAccessTokenInfo : NSObject

@property (atomic,readwrite) NSString * accessToken;
@property (atomic,readwrite) NSString * doubanUserName;
@property (atomic,readwrite) NSString * doubanUserId;
@property (atomic,readwrite) NSString * expiresDateInSecond;
@property (atomic,readwrite) NSString * refreshToken;

@end