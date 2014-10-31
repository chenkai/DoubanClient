//
//  UserLoginViewController.m
//  DoubanClient
//
//  Created by chenkai on 14/10/23.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLoginViewController.h"
#import "DataRequestHandler.h"
#import "OauthAccess.h"
#import "AuthorizationController.h"

@implementation UserLoginViewController

- (void) viewDidLoad
{
    //注解: 视图创建是调用
    [super viewDidLoad];
    
    //Init UI Element
    [self initUIElement];

}

- (void)viewWillAppear:(BOOL)animated
{
    //注解: 视图初始化完成展现视图前调用
}

- (void)viewDidAppear:(BOOL)animated
{
    //注解: 视图展现可见后调用
}

- (void)viewWillDisappear:(BOOL)animated
{
   //注解: 视图不可见之前调用
}

- (void)viewDidDisappear:(BOOL)animated
{
    //注解: 视图不可见之后调用
}

- (void) didReceiveMemoryWarning
{
    //DidReceiveMemoryWarning 方法主要用来释放view 页面内存
    //包括视图控制器中一些成员变量和视图的释放.
    [super didReceiveMemoryWarning];
}


 - (void) initUIElement
{
    startOauthBtu =[[UIButton alloc] initWithFrame:CGRectMake(10, 60, 200, 45)];
    startOauthBtu.backgroundColor=[UIColor grayColor];
    [startOauthBtu setTitle:@"Start Oatuh Validate" forState: UIControlStateNormal];
    [startOauthBtu addTarget:self action:@selector(getOauthCode) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview: startOauthBtu];

}

- (void) getOauthCode
{
    //transfer to authorization code
    AuthorizationController *authorizationController=[[AuthorizationController alloc] init];
    //[self.navigationController pushViewController: authorizationController animated:YES];
    [self.view.window addSubview: authorizationController.view];
    [self.view removeFromSuperview];
    //define group username and password define group this information
    
}

@end