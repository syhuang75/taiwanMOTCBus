//
//  model_busRoute.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model_busRoute : NSObject
@property (strong, nonatomic) NSString *model_RouteUID;
@property (strong, nonatomic) NSString *model_RouteID;
@property (strong, nonatomic) NSString *model_BusRouteType;
@property (strong, nonatomic) NSString *model_RouteName_Zh;
@property (strong, nonatomic) NSString *model_DepartureStopNameZh;
@property (strong, nonatomic) NSString *model_DestinationStopNameZh;
@property (strong, nonatomic) NSString *model_Headsign;
@property (strong, nonatomic) NSString *model_UpdateTime;

- (id) initWithData:(NSDictionary *)data;

@end
