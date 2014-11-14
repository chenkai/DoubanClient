//
//  NavigationBarCustomView.m
//  DoubanClient
//
//  Created by chenkai on 14/11/14.
//  Copyright (c) 2014年 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationBarCustomView.h"

@implementation NavigationBarCustomView
@synthesize leftNavigationBut;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initNavigationLeftButton];
    }
    return self;
}

- (void) initNavigationLeftButton
{
    leftNavigationBut = [[UIButton alloc] initWithFrame: CGRectMake(0, 10, 45, 45)];
    leftNavigationBut.backgroundColor = [UIColor redColor];
    
    [leftNavigationBut setTitle:@"Left" forState: UIControlStateNormal];
    [self addSubview: leftNavigationBut];
}

@end