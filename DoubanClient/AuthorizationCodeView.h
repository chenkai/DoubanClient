//
//  AuthorizationCodeView.h
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalizableController.h"


@interface AuthorizationCodeView  : UIView

@property (atomic,readwrite) UIButton *userLoginButton;
@property (atomic,readwrite) LocalizableController *localizableController;

@end