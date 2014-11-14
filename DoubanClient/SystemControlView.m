//
//  SystemControlView.m
//  DoubanClient
//
//  Created by chenkai on 14/11/7.
//  Copyright (c) 2014年 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemControlView.h"

@implementation SystemControlView

@synthesize navigationBarBut;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initNavigationBarButton];
    }
    return self;
}

- (void) initNavigationBarButton
{
    self.navigationBarBut = [[UIButton alloc] initWithFrame: CGRectMake(45, 75, 300, 45)];
    self.navigationBarBut.backgroundColor = [UIColor grayColor];
    
    [self.navigationBarBut setTitle:@"NavigationBar" forState:UIControlStateNormal];
    [self addSubview:self.navigationBarBut];
}

@end