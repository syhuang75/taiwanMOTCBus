//
//  publicApi.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface publicApi : NSObject
+ (instancetype)sharedInstance;
- (void)showHUD;
- (void)hidHUD;

@end
