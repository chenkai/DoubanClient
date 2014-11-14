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


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation DoubanAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window= [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    
    AuthorizationController *defineController=[[AuthorizationController alloc] init];
    UINavigationController *navigationController= [[UINavigationController alloc] initWithRootViewController:defineController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self setNavigationBarBackgroundColor];
    return YES;
}

- (void) setNavigationBarBackgroundColor
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x067ab5)];
    [[UINavigationBar appearance] setTranslucent:NO];//Default Value Is Yes
    
//    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7.png"]
//                                       forBarMetrics:UIBarMetricsDefault];

}

@end