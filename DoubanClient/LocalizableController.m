//
//  LocalizableController.m
//  DoubanClient
//
//  Created by chenkai on 14/10/29.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalizableController.h"

@implementation LocalizableController

static NSBundle *bundle= nil;
NSString * saveKeyName= @"userLanguage";

- (NSBundle *)currentBundle
{
    return bundle;
}

- (void)initUserLanguage
{
    NSUserDefaults *defaultSetting = [NSUserDefaults standardUserDefaults];
    NSString *currentLanguage= [defaultSetting valueForKey: saveKeyName];
    
    if (self.isUsedSystemToChangeLanguage) {
          currentLanguage =[self getSystemLanguageConfigValue: defaultSetting];
    }else
    {
       if ([currentLanguage length] == 0) {
           currentLanguage =[self getSystemLanguageConfigValue: defaultSetting];
      }
        
    }
    
    //get resources file path
    NSString *filePath= [[NSBundle mainBundle] pathForResource: currentLanguage ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath: filePath];
}

- (NSString *) getSystemLanguageConfigValue:(NSUserDefaults *) defaultSetting
{
    // get system languange value
    NSArray *languangeArray = [defaultSetting objectForKey: @"AppleLanguages"];
    NSString *currentSystemLanguage = [languangeArray objectAtIndex: 0];
    NSString *currentLanguage = currentSystemLanguage;
    
    [defaultSetting setValue: currentSystemLanguage forKey: saveKeyName];
    [defaultSetting synchronize];
    return currentLanguage;
}

- (NSString *)currentUserLanguage
{
    NSUserDefaults *defaultSetting = [NSUserDefaults standardUserDefaults];
    NSString *currentLanguage = [defaultSetting valueForKey: saveKeyName];
    return  currentLanguage;
}

- (void)setUserLanguage:(NSString *)language
{
    NSUserDefaults *defaultSetting = [NSUserDefaults standardUserDefaults];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource: language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath: filePath];
    
    [defaultSetting setValue: language forKey: saveKeyName];
    [defaultSetting synchronize];
}

- (NSString *) getSystemLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *language = [languages objectAtIndex:0];
    NSLog ( @"%@" , language);
    
    
    return language;
}

@end



#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define LocalizedString(key) [[LocalizableController bundle] localizedStringForKey:(key) value:@"" table:nil]

