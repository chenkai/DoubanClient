//
//  NavigationBarViewController.m
//  DoubanClient
//
//  Created by chenkai on 14/11/10.
//  Copyright (c) 2014年 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationBarViewController.h"
#import "NavigationBarCustomView.h"

#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))

@implementation NavigationBarViewController

- (void)loadView
{
    [self checkSystemVersion];
    self.navigationBarView = [[NavigationBarView alloc] init];
    [self.navigationBarView.buildRightAndLeftBarBut addTarget:self
                                                       action:@selector(addNavigationBar)
                                             forControlEvents:UIControlEventTouchDown ];
    [self.navigationBarView.customerNavigationBarBut addTarget:self
                                                        action:@selector(customerNavigationBar)
                                              forControlEvents:UIControlEventTouchDown];
    self.view = self.navigationBarView;
}


- (void) addNavigationBar
{
    //SET Bar Left And Right Button
    UIBarButtonItem *leftNavigationBarBut = [[UIBarButtonItem alloc] init];
    [leftNavigationBarBut setTitle:@"left"];
    [leftNavigationBarBut setTarget:self];
    [leftNavigationBarBut setAction:@selector(leftNavigationBarAction)];
    self.navigationItem.leftBarButtonItem = leftNavigationBarBut;
    
  
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(leftNavigationBarAction)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rightNavigationBarAction)];
    
    //SET Bar Button Forground Color
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    //SET Back Button [Does't Work]
    [[UINavigationBar appearance] setTintColor: [UIColor greenColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
    [[UINavigationBar appearance] setBarTintColor: [UIColor yellowColor]];//does't work only for appDelegate
    
    //Add More Right Side Button
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                target:self
                                                                                action:nil];
    NSArray *actionButtonItems = @[cameraItem,leftNavigationBarBut];
    self.navigationItem.rightBarButtonItems = actionButtonItems;

}

- (void) customerNavigationBar
{
    NavigationBarCustomView *customNavigationView = [[NavigationBarCustomView alloc] init];
    //self.navigationBarView = customNavigationView; //does't work
}

- (void) leftNavigationBarAction
{
    NSLog(@"left button clicked");
}

- (void) rightNavigationBarAction
{
    NSLog(@"right button clicked");
}

- (void) useAlterViewTipSomeWord:(NSString *)message
{
    
}

- (void) checkSystemVersion
{
    if(IOS_VERSION_7_OR_ABOVE)
    {
        NSLog(@"yes ios version is 7 or above");
    }else
    {
        NSLog(@"no");
    }
}

@end