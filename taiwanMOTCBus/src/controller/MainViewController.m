//
//  MainViewController.m
//  taiwanMOTCBus
//
//  Created by baron on 2016/7/13.
//  Copyright © 2016年 baron. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateMainView) name:kUPDATEMAINVIEW object:nil];
    [self setData];
    [self setView];
    [[publicApi sharedInstance] showHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setData {
    [[busManager sharedInstance] initBusRoute];
}

- (void)setView {
    
}

- (void)updateMainView {
    [_tableView_route reloadData];
    [[publicApi sharedInstance] hidHUD];

}

#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[busManager sharedInstance].array_route count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier;
    CellIdentifier = @"RouteTableViewCell";
    RouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[RouteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    model_busRoute *busRoute = [busManager sharedInstance].array_route[indexPath.row];
    cell.label_routeName.text = busRoute.model_RouteName_Zh;
    cell.label_busRouteType.text = busRoute.model_BusRouteType;
    cell.label_headsign.text = busRoute.model_Headsign;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
