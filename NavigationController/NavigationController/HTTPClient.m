//
//  HTTPClient.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

-(instancetype)initWithBaseURL
{
    if(self = [super initWithBaseURL:[NSURL URLWithString:@"https://pointapibeta.smtown.com"]])
    {
        
    }
    
    return self;
    
}

-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure
{
    [self GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {

        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
            LogRed(@"error : %@", error);
        }
        
    }];
}

-(void)POSTWithUrlString:(NSString *)urlString parameters:(id)parameters
                 success:(void (^)(id results))success
                 failure:(void (^)(NSError *error))failure
{
    [self POST:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
            LogRed(@"error : %@", error);
        }
            
    }];
}


@end