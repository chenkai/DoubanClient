//
//  NavigationBarView.m
//  DoubanClient
//
//  Created by chenkai on 14/11/7.
//  Copyright (c) 2014年 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationBarView.h"

@implementation NavigationBarView

@synthesize buildRightAndLeftBarBut;
@synthesize customerNavigationBarBut;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBuildNaivgaionBarBut];
        [self initCustomerNavigationBarBut];
    }
    return  self;
}

- (void) initBuildNaivgaionBarBut
{
    buildRightAndLeftBarBut = [[UIButton alloc] initWithFrame:CGRectMake(45, 75, 300, 45)];
    [buildRightAndLeftBarBut setTitle:@"add navigation bar" forState:UIControlStateNormal];
    buildRightAndLeftBarBut.backgroundColor = [UIColor darkGrayColor];
    [self addSubview: buildRightAndLeftBarBut];
}

- (void) initCustomerNavigationBarBut
{
    customerNavigationBarBut = [[UIButton alloc] initWithFrame: CGRectMake(45, 125, 300, 45)];
    customerNavigationBarBut.backgroundColor = [UIColor darkGrayColor];
    [customerNavigationBarBut setTitle:@"Customer NavigationBar" forState:UIControlStateNormal];
    [self addSubview: customerNavigationBarBut];
}



@end