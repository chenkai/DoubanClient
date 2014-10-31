//
//  JsonConvertHandler.m
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonConvertHandler.h"

@implementation JsonConvertHandler

- (NSDictionary *)convertJsonStrToDic:(NSData *) jsonData
{
 
    if (jsonData == nil) {
        return nil;
    }
    
    NSError *error;
    NSDictionary *jsonObjectDic= [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error: &error];
    
    return jsonObjectDic;
}

- (NSString *)convertDictionaryToJsonStr:(NSDictionary *)dictionaryValue
{
    NSString *jsonStr;
    if ([NSJSONSerialization isValidJSONObject: dictionaryValue]) {
        NSError *error;
        NSData *jsonData= [NSJSONSerialization dataWithJSONObject: dictionaryValue options:NSJSONWritingPrettyPrinted error: &error];
        jsonStr= [[NSString alloc] initWithData: jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonStr;
}

@end