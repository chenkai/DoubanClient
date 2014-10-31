//
//  ErrorMessage.h
//  DoubanClient
//
//  Created by chenkai on 14/10/23.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

@interface  ErrorMessage : NSObject

@property (atomic,readwrite) NSString * Msg;
@property (atomic,readwrite) NSString * Code;
@property (atomic,readwrite) NSString * Request;

@end
