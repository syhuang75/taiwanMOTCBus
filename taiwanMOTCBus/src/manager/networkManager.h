//
//  networkManager.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface networkManager : NSObject
+ (instancetype)sharedInstance;

-(void)apiGetAllRoute:(NSString*)url completion:(void (^)(NSArray *returnData))completion error:(void (^)(NSError *error))error;

@end
