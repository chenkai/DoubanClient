//
//  OauthAccess.m
//  DoubanClient
//
//  Created by Shuo.Xiong on 14-10-20.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OauthAccess.h"
#import "Config.h"

@implementation OauthAccess

- (id)init
{
    self = [super init];
    if (self) {
        self.oauthTokenUrl = @"token";
        self.oauthCodeUrl = @"auth";
    }
    return self;
}

- (NSString *) getAuthorizationCode
{
    NSMutableString *mergeOauthCodeUrlStr= [[NSMutableString alloc] initWithString: DouBan_Oauth_Host];
    [mergeOauthCodeUrlStr appendString: self.oauthCodeUrl];
    
    [mergeOauthCodeUrlStr appendString:@"?client_id="];
    [mergeOauthCodeUrlStr appendString: DouBan_AppKey];
    
    [mergeOauthCodeUrlStr appendString:@"&redirect_uri="];
    [mergeOauthCodeUrlStr appendString: DouBan_Oauth_CallBackHost];
    
    [mergeOauthCodeUrlStr appendString: @"&response_type="];
    [mergeOauthCodeUrlStr appendString: DouBan_Oauth_Response_Type];
    return [mergeOauthCodeUrlStr length] > 0 ? mergeOauthCodeUrlStr : nil;
}

- (NSString *) getAuthorizationToken:(NSString *) oauthCodeStr
{
    NSMutableString *mergeAccessTokenUrl = [[NSMutableString alloc] init];
    //[mergeAccessTokenUrl appendFormat: self.oauthTokenUrl];
    
    [mergeAccessTokenUrl appendString:@"client_id="];
    [mergeAccessTokenUrl appendString: DouBan_AppKey];
    
    [mergeAccessTokenUrl appendString:@"&client_secret="];
    [mergeAccessTokenUrl appendString: DouBan_AppSecret];
    
    [mergeAccessTokenUrl appendString:@"&redirect_uri="];
    [mergeAccessTokenUrl appendString: DouBan_Oauth_CallBackHost];
    
    [mergeAccessTokenUrl appendString:@"&grant_type=authorization_code"];
    [mergeAccessTokenUrl appendString:[NSString stringWithFormat:@"&code=%@",oauthCodeStr]];
    
    
    return [mergeAccessTokenUrl length] > 0 ? mergeAccessTokenUrl: nil;
}

- (void) saveAccessTokenToLocal
{
    //define group and quick help
}

- (void)removeAccessTokenFromLocal
{}

- (void)refreshUserAccessToken
{}

@end
