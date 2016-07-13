//
//  publicApi.m
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import "publicApi.h"

@implementation publicApi {
    MBProgressHUD *mhud;
}

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

- (void)showHUD {
    mhud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    mhud.mode = MBProgressHUDModeIndeterminate;
    [mhud show:YES];
}
- (void)hidHUD {
    if (mhud != nil) {
        [mhud hide:YES];
    }
}


@end
