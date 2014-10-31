//
//  DataRequestHandler.m
//  DoubanClient
//
//  Created by kai.chen on 14-10-20.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataRequestHandler.h"

@implementation DataRequestHandler
-  (id)init
{
    self = [super init];
    if (self) {
        timeOut = 15;
    }
    return self;
}

 - (void) setRequestUrl:(NSString *)url
{
    if ([url isEqualToString:@""]) {
        NSLog(@"requst url is empty please enter some value.");
        exit(1);
    }
    
    requestUrl = [[NSURL alloc] initWithString: url];
}

- (NSData *) dataRequestWithSync:(RequestMethod *)requestMethod RequestUrl:(NSString *)url RequestArguemnts:(NSData *)arguemntData
{
    [self setRequestUrl: url];
    
    //Init sync request object
    NSMutableURLRequest *syncRequest = [[NSMutableURLRequest alloc] initWithURL: requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval: timeOut];
    if (requestMethod == GET) {
        [syncRequest setHTTPMethod: @"GET"];
    }else
    {
        [syncRequest setHTTPMethod:@"POST"];
        if (arguemntData != nil) {
            
            NSString *postDataStr= [[NSString alloc] initWithData: arguemntData encoding:NSUTF8StringEncoding];
            NSString *postLength= [NSString stringWithFormat:@"%lu",(unsigned long)[postDataStr length]];
            
            [syncRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [syncRequest setHTTPBody: arguemntData];
        }
    }
    
    //Handle sync request result
    NSURLResponse *syncResponse;
    NSError *syncError;
    NSData *syncResult = [NSURLConnection sendSynchronousRequest: syncRequest returningResponse: &syncResponse error: &syncError];
    return (syncResult == nil ? nil:syncResult);
}


- (void) dataRequestWithAsync:(RequestMethod *)requestMethod RequestUrl:(NSString *)url RequestArguments:(NSString *)argumentsValueStr
{
    [self setRequestUrl: url];
    
    //Init Async request object and set post protocol argument value
    NSMutableURLRequest *asyncRequest= [[NSMutableURLRequest alloc] initWithURL: requestUrl cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:timeOut];
    
    if(requestMethod == POST)
    {
        [asyncRequest setHTTPMethod: @"POST"];
        if ([argumentsValueStr length] > 0) {
            NSData *asyncArgumentData = [argumentsValueStr dataUsingEncoding: NSUTF8StringEncoding];
            [asyncRequest setHTTPBody: asyncArgumentData];
        }
    }
    NSURLConnection *asyncConnection= [[NSURLConnection alloc] initWithRequest: asyncRequest delegate: self];
    [asyncConnection start];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *asyncResponse = (NSHTTPURLResponse *) response;
    NSDictionary *headers = [asyncResponse allHeaderFields];
    asyncTempDataBuff = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [asyncTempDataBuff appendData: data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *asyncResponseData = [[NSString alloc] initWithData: asyncTempDataBuff encoding: NSUTF8StringEncoding];
    asyncIsComplated = true;
    NSLog(asyncResponseData);
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"datarequest occur some error:%@",error);
}






















@end