//
//  AuthorizationCodeView.m
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorizationCodeView.h"
#import "OauthCodeController.h"
#import "LocalizableController.h"


@implementation AuthorizationCodeView

@synthesize systemControlBut;

- (instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        
        self.localizableController = [[LocalizableController alloc] init];
        self.localizableController.isUsedSystemToChangeLanguage=true;
        [self.localizableController initUserLanguage];
        
        [self initUserLoginButton:frame];
        [self initSystemControlButton];
        [self actionWithInter];
    }
    return self;
}

- (void) initUserLoginButton:(CGRect)frame {
    
    self.userLoginButton= [[UIButton alloc] initWithFrame:CGRectMake(50, 80, 280, 45)];
    self.userLoginButton.backgroundColor =[UIColor darkGrayColor];

    NSString *oauthTitle= [self.localizableController.currentBundle localizedStringForKey:@"Start_Oauth_Validate" value:nil table:@"Localizable"];
    [self.userLoginButton setTitle:oauthTitle forState:UIControlStateNormal];
  
    [self addSubview: self.userLoginButton];
}

- (void) actionWithInter {
    //LocalizableController *localizableController = [[LocalizableController alloc] init];
    //[localizableController initUserLanguage];
    
    [self.localizableController setUserLanguage: @"zh-Hans"];//Chinese
    NSString *chineseName=  [self.localizableController.currentBundle localizedStringForKey:@"Start_Oauth_Validate" value:nil table:@"Localizable"];
    NSLog(chineseName);
    
    [self.localizableController setUserLanguage:@"en"];
    NSString *englishName=  [self.localizableController.currentBundle localizedStringForKey:@"Start_Oauth_Validate" value:nil table:@"Localizable"];
    NSLog(englishName);
    
    [self.localizableController setUserLanguage:@"zh-Hant"];
    NSString *traditionalName=  [self.localizableController.currentBundle localizedStringForKey:@"Start_Oauth_Validate" value:nil table:@"Localizable"];
    NSLog(traditionalName);

 }

- (void) initSystemControlButton {
    systemControlBut = [[UIButton alloc] initWithFrame:CGRectMake(50, 30, 280, 45)];
    systemControlBut.backgroundColor = [UIColor darkGrayColor];
    
    [systemControlBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [systemControlBut setTitle:@"System Controls" forState: UIControlStateNormal];
    [self addSubview: systemControlBut];
}

@end


