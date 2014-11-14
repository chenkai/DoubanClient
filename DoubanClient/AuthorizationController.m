//
//  AuthorizationController.m
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorizationController.h"
#import "AuthorizationCodeView.h"
#import "OauthCodeController.h"
#import "OauthCodeView.h"
#import "UserBoardcastController.h"
#import "SystemControlViewController.h"

@implementation AuthorizationController

- (id)init {
    if (self) {
      
    }
    return self;

}

- (void) loadView {
    [super loadView];
    
    AuthorizationCodeView *uiView=[[AuthorizationCodeView alloc] init];
    uiView.alpha=0.5;
    uiView.backgroundColor=[UIColor whiteColor];
    
    [uiView.userLoginButton addTarget: self action:@selector(getOauthCode)  forControlEvents:UIControlEventTouchDown];
    [uiView.systemControlBut addTarget:self action:@selector(navigateToSystemControlView) forControlEvents: UIControlEventTouchDown];
    
    self.view=uiView;
    
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (void)getOauthCode {
    UserBoardcastController *boardcastController = [[UserBoardcastController alloc] init];
    [self.navigationController pushViewController: boardcastController animated:true];
}

- (void)navigateToSystemControlView{
    SystemControlViewController *systemViewController= [[SystemControlViewController alloc] init];
    [self.navigationController pushViewController: systemViewController animated:true];
}

@end
