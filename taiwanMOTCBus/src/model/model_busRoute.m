//
//  model_busRoute.m
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import "model_busRoute.h"

@implementation model_busRoute

- (id) initWithData:(NSDictionary *)data;
{
    if ([data objectForKey:@"RouteUID"] != [NSNull null]) {
        _model_RouteUID = [data objectForKey:@"RouteUID"];
    }
    if ([data objectForKey:@"RouteID"] != [NSNull null]) {
        _model_RouteID = [data objectForKey:@"RouteID"];
    }
    if ([data objectForKey:@"BusRouteType"] != [NSNull null]) {
        _model_BusRouteType = [data objectForKey:@"BusRouteType"];
    }
    if ([data objectForKey:@"RouteName"] != [NSNull null]) {
        NSDictionary *NameType = [data objectForKey:@"RouteName"];
        if ([NameType objectForKey:@"Zh_tw"] != [NSNull null]) {
            _model_RouteName_Zh = [NameType objectForKey:@"Zh_tw"];
        }
    }
    if ([data objectForKey:@"DepartureStopNameZh"] != [NSNull null]) {
        _model_DepartureStopNameZh = [data objectForKey:@"DepartureStopNameZh"];
    }
    if ([data objectForKey:@"DestinationStopNameZh"] != [NSNull null]) {
        _model_DestinationStopNameZh = [data objectForKey:@"DestinationStopNameZh"];
    }
    if ([data objectForKey:@"Headsign"] != [NSNull null]) {
        _model_Headsign = [data objectForKey:@"Headsign"];
    }
    if ([data objectForKey:@"UpdateTime"] != [NSNull null]) {
        _model_UpdateTime = [data objectForKey:@"UpdateTime"];
    }
    return self;
}

@end
