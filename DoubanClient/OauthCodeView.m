//
//  OauthCodeView.m
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OauthCodeView.h"
#import "OauthAccess.h"

@implementation OauthCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        [self initOauthWebView: frame];
    }
    return self;
}

- (void) initOauthWebView:(CGRect) frame {
    self.oauthWebView= [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, 375, 600)];
    self.oauthWebView.scalesPageToFit= YES;

    [self addSubview: self.oauthWebView];
    
    OauthAccess *defOauthAccess = [[OauthAccess alloc] init];
    NSString * oauthCodeRequestStr=[defOauthAccess getAuthorizationCode];
    if ([oauthCodeRequestStr length] > 0) {
        NSURLRequest *oauthCodeRequest= [NSURLRequest requestWithURL:[NSURL URLWithString:oauthCodeRequestStr]];
        [self.oauthWebView loadRequest: oauthCodeRequest];
    }
}

@end