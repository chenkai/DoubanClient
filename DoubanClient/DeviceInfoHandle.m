//
//  DeviceInfoHandle.m
//  DoubanClient
//
//  Created by chenkai on 14/10/31.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInforHandle.h"
#import <UIKit/UIKit.h>

@implementation DeviceInforHandle

- (void)getDeviceInfo
{
      //device name
    NSString *deviceName=[[UIDevice currentDevice] name];
    NSString *systemNane = [[UIDevice currentDevice] systemName];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion ];
    
    NSLog(@"current DEvice Name:%@",deviceName);
}

@end