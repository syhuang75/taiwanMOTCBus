//
//  busManager.m
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import "busManager.h"

@implementation busManager
+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

- (id)init
{
    
    self = [super init];
    if (self) {
        _array_route = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) initBusRoute {
    NSString *method1 = @"/v1/Bus/Route/Thb";
    NSString *url = [NSString stringWithFormat:@"%@%@", baseUrl, method1];
    [[networkManager sharedInstance] apiGetAllRoute:url completion:^(NSArray *returnData) {
        NSLog(@"");
        [self initBusModels: returnData];
        
    } error:^(NSError *error) {
        NSLog(@"");
    }];
    
}

- (void) initBusModels:(NSArray*)returnData {
    for (int i = 0; i < [returnData count]; i++) {
        NSDictionary *dic = returnData[i];
        model_busRoute *route = [[model_busRoute alloc] initWithData:dic];
        BOOL isExist = NO;
        for (int j = 0; j < [_array_route count]; j++) {
            model_busRoute *testRoute = _array_route[j];
            if ([route.model_RouteName_Zh isEqualToString:testRoute.model_RouteName_Zh]) {
                isExist = YES;
            }
        }
        if (isExist == NO) {
            //customize +
            if ([route.model_RouteName_Zh isEqualToString:@"9069"]) {
                [_array_route insertObject:route atIndex:0];
            } else {
                [_array_route addObject:route];
            }
            //customize -
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kUPDATEMAINVIEW object:nil];
}


@end
