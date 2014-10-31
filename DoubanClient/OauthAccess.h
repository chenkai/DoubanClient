//
//  OauthAccess.h
//  DoubanClient
//
//  Created by Shuo.Xiong on 14-10-20.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

@interface OauthAccess :NSObject


@property (atomic,readwrite) NSString *oauthCodeUrl;
@property (atomic,readwrite) NSString *oauthTokenUrl;

- (NSString *) getAuthorizationCode;
- (NSString *) getAuthorizationToken:(NSString *)codeStr;
- (void) saveAccessTokenToLocal;
- (void) removeAccessTokenFromLocal;
- (void) refreshUserAccessToken;

@end
