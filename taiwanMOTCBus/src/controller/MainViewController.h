//
//  MainViewController.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouteTableViewCell.h"
#import "busManager.h"
#import "Constant.h"
#import "model_busRoute.h"
#import "publicApi.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView_route;

@end
