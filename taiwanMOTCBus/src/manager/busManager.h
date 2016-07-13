//
//  busManager.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "networkManager.h"
#import "model_busRoute.h"
#import "Constant.h"

@interface busManager : NSObject
+ (instancetype)sharedInstance;

@property (strong, nonatomic) NSMutableArray *array_route;

- (void) initBusRoute;

@end
