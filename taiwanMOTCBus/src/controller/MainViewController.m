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
    _array_show = [[NSMutableArray alloc] init];
    [[busManager sharedInstance] initBusRoute];
}

- (void)setView {
    UIGestureRecognizer *tapper;
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];

}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)updateMainView {
    _array_show = [[NSMutableArray alloc] initWithArray:[busManager sharedInstance].array_route];
    [_tableView_route reloadData];
    [[publicApi sharedInstance] hidHUD];

}

#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array_show count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier;
    CellIdentifier = @"RouteTableViewCell";
    RouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[RouteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    model_busRoute *busRoute = _array_show[indexPath.row];
    cell.label_routeName.text = busRoute.model_RouteName_Zh;
    cell.label_busRouteType.text = busRoute.model_BusRouteType;
    cell.label_headsign.text = busRoute.model_Headsign;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_searchBar_filter resignFirstResponder];

}

#pragma mark - UISearchBar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"searchText : %@", searchText);
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    [[publicApi sharedInstance] showHUD];
    if ([searchText isEqualToString:@""]) {
        _array_show = [[NSMutableArray alloc] initWithArray:[busManager sharedInstance].array_route];
    } else {
        for (int i = 0; i < [[busManager sharedInstance].array_route count]; i++) {
            model_busRoute *busRoute = [busManager sharedInstance].array_route[i];
            if ([busRoute.model_RouteName_Zh containsString:searchText]) {
                [temp addObject:busRoute];
            }
        }
        [_array_show removeAllObjects];
        _array_show = temp;
    }
    [_tableView_route reloadData];
    [[publicApi sharedInstance] hidHUD];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
     [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
@end
