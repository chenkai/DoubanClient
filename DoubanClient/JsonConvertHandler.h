//
//  JsonConvertHandler.h
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

@interface JsonConvertHandler : NSObject

- (NSDictionary *) convertJsonStrToDic:(NSData *) jsonData;

- (NSString *) convertDictionaryToJsonStr:(NSDictionary *) dictionaryValue;

@end