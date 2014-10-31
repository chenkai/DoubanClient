//
//  DoubanAppDelegate.m
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubanAppDelegate.h"
#import "UserLoginViewContorler.h"
#import "AuthorizationController.h"

@implementation DoubanAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window= [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    
    AuthorizationController *defineController=[[AuthorizationController alloc] init];
    UINavigationController *navigationController= [[UINavigationController alloc] initWithRootViewController:defineController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end