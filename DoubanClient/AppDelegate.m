//
//  AppDelegate.m
//  DoubanClient
//
//  Created by Shuo.Xiong on 14-10-20.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //[Test Code]
    NSLog(@"didFinishLaunchingWithOptions: 应用程序开始启动.");
    
    
    //生命周期注解：
    //应用程序启动时执行. 应用程序启动入口. 只在应用程序启动执行一次.
    //如果用户直接启动. lauchOptions内无数据. 若通过其他方式启动应用。lauchOptions包含对应方式的内容.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    
    //[Test Code]
    NSLog(@"applicationWillResignActive: 活动状态切换到非活动状态.");
    
    //生命周期注解：
    //应用程序由活动状态切换到非活动状态时，触发，要执行的委托调用.
    //如按下home键 返回主屏幕，或者全屏之间切换应用程序等.
    //会触发执行该委托
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    //[Test Code]
    NSLog(@"applicationDidEnterBackground: 应用程序进入后台");
    
    //生命周期注解：
    //当应用程序进入后台程序时，触发，要执行的委托调用.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //[Test Code]
    NSLog(@"applicationWillEnterForeground: 应用程序进入前台");
    
    
    //生命周期注解:
    //当应用程序进入前台（激活展示时）触发，要执行的委托调用.
    //刚好与applicationWillResignActive 方法相对应
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //[Test Code]
    NSLog(@"applicationDidBecomeActive : 应用程序已经被激活");
    
    
    //生命周期注解:
    //在应用程序已经被激活后，要执行的委托.
    //刚好与applicationDidEnterBackground 方法相对应。
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    
    //[Test Code]
    NSLog(@"applicationWillTerminate : 应用程序退出");
    
    //生命周期注解:
    //在应用程序要完全退出的时候，要执行的委托调用，
    //这个需要要设置UIApplicationExitsOnSuspend的键值
    //如果没有设置UIApplicationExitsOnSuspend 的值 程序不会彻底退出
}



@end
