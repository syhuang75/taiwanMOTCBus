//
//  networkManager.m
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import "networkManager.h"

@implementation networkManager

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

-(void)apiGetMethod:(NSString *)getUrl parameter:parameters addTokenHeader:(NSString*)addToken completion:(void (^)(id response))completion error:(void (^)(NSError *error))error
{
    NSURL *baseURL = [NSURL URLWithString:getUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [manager GET:getUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        error(err);
    }];
}

-(void)apiGetAllRoute:(NSString*)url completion:(void (^)(NSArray *returnData))completion error:(void (^)(NSError *error))error
{
    [self apiGetMethod:url parameter:nil addTokenHeader:nil completion:^(id response) {
        if ([response isKindOfClass:[NSArray class]]) {
            completion(response);
        } else {
            completion(nil);
        }
        
    } error:^(NSError *err) {
        NSLog(@"");
        error(err);
    }];
}

@end
