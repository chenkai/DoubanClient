//
//  UserBoardcastView.m
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserBoardcastView.h"


@implementation UserBoardcastView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.localizableController = [[LocalizableController alloc] init];
        self.localizableController.isUsedSystemToChangeLanguage = YES;
        [self.localizableController initUserLanguage];
        [self initUIButtonElement];
    }
    return self;
}
- (void) initUIButtonElement
{
    self.defineButton= [[UIButton alloc] initWithFrame:CGRectMake(80, 150, 200, 45)];
    self.defineButton.backgroundColor = [UIColor grayColor];

    NSString *customerName= [self.localizableController.currentBundle localizedStringForKey:@"CustomerName" value:nil
    table:@"Localizable"];
    [self.defineButton setTitle:customerName forState:UIControlStateNormal];
    [self addSubview: self.defineButton];
    
}


@end