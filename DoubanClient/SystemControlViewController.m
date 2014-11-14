//
//  SystemControlViewController.m
//  DoubanClient
//
//  Created by chenkai on 14/11/7.
//  Copyright (c) 2014年 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemControlViewController.h"
#import "NavigationBarViewController.h"

@implementation SystemControlViewController

- (id) init
{
    self = [super init];
    if (self) {
        self.systemView = [[SystemControlView alloc] init];
        self.systemView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)loadView
{
    [self.systemView.navigationBarBut addTarget:self action:@selector(transferToNavigationBar) forControlEvents: UIControlEventTouchDown];
    self.view = self.systemView;
}

- (void) transferToNavigationBar
{
    NavigationBarViewController *navigationBarController = [[NavigationBarViewController alloc] init];
    [self.navigationController pushViewController: navigationBarController animated:true];
}

@end