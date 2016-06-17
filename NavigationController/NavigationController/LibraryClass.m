//
//  LibraryClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved. 
//

#import "LibraryClass.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPClient.h"

@interface LibraryClass ()

@property (strong, nonatomic) HTTPClient *httpClient;



@end


@implementation LibraryClass


//싱글톤
+ (instancetype)sharedInstance
{
    static LibraryClass *_sharedInstance = nil;

    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryClass alloc] init];
 
    });
    
    return _sharedInstance;
}

-(instancetype)init
{
    if(self = [super init])
    {
        _httpClient = [[HTTPClient alloc]initWithBaseURL];
        _pushModel = [[PushModel alloc]init];
    }
    
    return self;
}


-(void)requestMainInformationWithParameter:(id)parameter
                           success:(void (^)(id results))success
                           failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/main" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestUserInformationWithParameter:(id)parameter
                           success:(void (^)(id results))success
                           failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/memberInfo" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestStoreInformationWithParameter:(id)parameter
                            success:(void (^)(id results))success
                            failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/brand" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestLogInWithParameter:(id)parameter
                         success:(void (^)(id results))success
                         failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/accountSignin" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}
-(void)requestLogOutWithParameter:(id)parameter
                            success:(void (^)(id results))success
                            failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/accountSignOut" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestRegisterAlbumCodeWithParameter:(id)parameter
                      success:(void (^)(id results))success
                      failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/pointAlbum" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestRegisterCardNumWithParameter:(id)parameter
                   success:(void (^)(id results))success
                   failure:(void (^)(NSError *error))failure
{
    [self.httpClient PUTWithUrlString:@"/api/v1/cardSet" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestChangeCardPwWithParameter:(id)parameter
                    success:(void (^)(id results))success
                    failure:(void (^)(NSError *error))failure
{
    [self.httpClient PATCHWithUrlString:@"/api/v1/cardPassword" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)requestReportCardLossWithParameter:(id)parameter
                      success:(void (^)(id results))success
                      failure:(void (^)(NSError *error))failure
{
    [self.httpClient PATCHWithUrlString:@"/api/v1/cardLoss" parameters:parameter success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions
{
    [self.pushModel registerDeviceTokenWithLaunchOptions:launchOptions];
}

-(void)saveDeviceToken:(NSData *)devicdeToken
{
    [self.pushModel saveDeviceToken:devicdeToken];
}

-(NSString *)getDeviceToken
{
    NSString *tokenNum = [self.pushModel getDeviceToken];
    return tokenNum;
}

-(void)setPayload:(NSDictionary *)userInfo
{
    [self.pushModel setPayload:userInfo];
}



@end
