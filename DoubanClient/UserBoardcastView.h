//
//  UserBoardcastView.h
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LocalizableController.h"
@interface UserBoardcastView : UIView

@property (atomic,readwrite) LocalizableController *localizableController;
@property (atomic,readwrite) UIButton *defineButton;
@property (atomic,readwrite) UILabel *defineLable;

@end