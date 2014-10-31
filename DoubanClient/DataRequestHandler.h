//
//  DataRequestHandler.h
//  DoubanClient
//
//  Created by Shuo.Xiong on 14-10-20.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//


@interface DataRequestHandler : NSObject<NSURLConnectionDataDelegate>
{
    @private
    NSURL * requestUrl;
    int timeOut;
  
    @public
    NSMutableData *asyncTempDataBuff;
    BOOL asyncIsComplated;
   
}

typedef enum
{
    GET,
    POST
}RequestMethod;

typedef enum
{
    SYNC,
    ASYNC
}RequestProtocolType;

- (void) setRequestUrl:(NSString *) url;

- (NSData *) dataRequestWithSync:(RequestMethod *) requestMethod RequestUrl:(NSString *) url RequestArguemnts : (NSData *) arguemntData;
- (void) dataRequestWithAsync:(RequestMethod *) requestMethod RequestUrl:(NSString *) url RequestArguments: (NSString *) argumentsValueStr;

@end