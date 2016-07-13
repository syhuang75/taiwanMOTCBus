//
//  RouteTableViewCell.h
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label_routeName;
@property (weak, nonatomic) IBOutlet UILabel *label_busRouteType;
@property (weak, nonatomic) IBOutlet UILabel *label_headsign;

@end
