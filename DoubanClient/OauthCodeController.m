//
//  OauthCodeController.m
//  DoubanClient
//
//  Created by chenkai on 14/10/24.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OauthCodeController.h"
#import "OauthCodeView.h"
#import "Config.h"
#import "OauthAccess.h"
#import "DoubanAccessTokenInfo.h"
#import "UserBoardcastController.h"
#import "FileManagerHandler.h"

@implementation OauthCodeController

- (id) init {
    if (self) {
        self.oauthcAccess = [[OauthAccess alloc] init];
        self.dataRequestHandler = [[DataRequestHandler alloc] init];
        self.jsonConvertHandler = [[JsonConvertHandler alloc] init];
        self.fileManageHandler = [[FileManagerHandler alloc] init];
    }
    return self;
}

- (void) loadView {
    [super loadView];
    
    OauthCodeView *codeView = [[OauthCodeView alloc] init];
    codeView.alpha= 0.5;
    codeView.backgroundColor= [UIColor greenColor];
    
    codeView.oauthWebView.delegate=self;
    self.view=codeView;

}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"start load");
    NSLog(webView.request.URL.absoluteString);

}

- (DoubanAccessTokenInfo *) convertJsonDicToObject: (NSDictionary *) jsonDic {
    NSString *argumentKey;
    DoubanAccessTokenInfo *donbanAccessTokenInfo = [[DoubanAccessTokenInfo alloc] init];
    for (argumentKey in jsonDic.keyEnumerator) {
      
        if ([argumentKey isEqualToString: @"access_token"]) {
            donbanAccessTokenInfo.accessToken = jsonDic[argumentKey];
        }
        
        if ([argumentKey isEqualToString: @"douban_user_name"]) {
            donbanAccessTokenInfo.doubanUserName = jsonDic[argumentKey];
        }
        
        if ([argumentKey isEqualToString:@"douban_user_id"]) {
            donbanAccessTokenInfo.doubanUserId = jsonDic[argumentKey];
        }
        
        if ([argumentKey isEqualToString:@"expires_in"]) {
            donbanAccessTokenInfo.expiresDateInSecond = jsonDic[argumentKey];
        }
        
        if ([argumentKey isEqualToString: @"refresh_token"]) {
            donbanAccessTokenInfo.refreshToken = jsonDic[argumentKey];
        }
        
    }
    
    return (donbanAccessTokenInfo);
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finish load: %@",webView.request.URL);
    
    if ([webView.request.URL.absoluteString hasPrefix: DouBan_Oauth_CallBackHost]) {
        NSString *codeRequestUrlStr= webView.request.URL.absoluteString;
        NSArray *spiltUrlCharArray = [codeRequestUrlStr componentsSeparatedByString:@"?"];
        
        if([spiltUrlCharArray count] >=2)
        {
            NSArray *spiltWithQuortArray= [spiltUrlCharArray[1] componentsSeparatedByString:@"="];
            if ( [spiltWithQuortArray count] >=2) {
                NSString *oautchCodeStr= spiltWithQuortArray[1];
                if ([oautchCodeStr length] > 0) {
                    
                    //get accesstoken argument url
                    NSString *accessTokenArgumentUrl = [self.oauthcAccess getAuthorizationToken: oautchCodeStr];
                    NSData *argumentData = [accessTokenArgumentUrl dataUsingEncoding: NSUTF8StringEncoding allowLossyConversion:YES];
                    
                    //get accesstoken basic url
                    NSMutableString *accessTokenBasicUrl = [[NSMutableString alloc] initWithString: DouBan_Oauth_Host];
                    [accessTokenBasicUrl appendFormat:@"%@", self.oauthcAccess.oauthTokenUrl];
                    
                    //data request accesstoken with sync
                    NSData *responseData=  [self.dataRequestHandler dataRequestWithSync: POST RequestUrl:accessTokenBasicUrl RequestArguemnts:argumentData];
                    
                    NSDictionary *jsonValueDic =  [self.jsonConvertHandler convertJsonStrToDic: responseData];
                    if (jsonValueDic!=nil) {
                        DoubanAccessTokenInfo *accessTokenInfo = [self convertJsonDicToObject: jsonValueDic];
                        if([accessTokenInfo.accessToken length] > 0)
                        {
                            [self saveAccessTokenCodeToLocal: jsonValueDic];
                            UserBoardcastController *boardCastController= [[UserBoardcastController alloc] init];
                            [self.navigationController pushViewController: boardCastController animated:YES];
                        }
                    }
                    
                }
            }
        }
    }
}

- (void)saveAccessTokenCodeToLocal:(NSDictionary *)jsonData {
    NSString * jsonStr= [self.jsonConvertHandler convertDictionaryToJsonStr: jsonData];
    if ([jsonStr length] > 0) {
        BOOL *dirCreated=  [self.fileManageHandler createDirectoryByFileName: DocumentDir directoryName:@"/Douban"];
        if (dirCreated) {
            NSString *filePath=[self.fileManageHandler getFileDirByFileCatalog: DocumentDir];
            [filePath stringByAppendingString:@"/Douban"];
            [filePath stringByAppendingString:@"/AccessToken"];
            BOOL *fileCreated= [self.fileManageHandler createFileByFileName:DocumentDir filePath:filePath];
        
            if (fileCreated) {
                [self.fileManageHandler writeContentToFile:jsonStr saveFilePath: filePath];
                NSLog(@"accesstoken is writed to local file .");
            }
        }
    }
}

@end