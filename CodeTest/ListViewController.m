//
//  ListViewController.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "ListViewController.h"
#import "APIManager.h"
#import "SVProgressHUD.h"
#import "GeoDataTableViewCell.h"
#import "MapViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataFromAPI) forControlEvents:UIControlEventValueChanged];
    [self.tableView setRefreshControl:self.refreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchDataFromAPI];
}

- (void)fetchDataFromAPI {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD show];
    [APIManager getDataFromAPI:^(NSURLResponse * _Nullable response, NSDictionary * _Nullable responseDict, NSError * _Nullable error) {
        if (!error) {
            self.geoJSONResponse = [[GeoJSONResponse alloc]initWithDictionary:responseDict];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [SVProgressHUD dismiss];
                [self.refreshControl endRefreshing];
            });
        }else {
            [self displaySingleButtonAlertWithTitle:@"Error" messge:error.localizedDescription];
        }
    }];
}

- (void)displaySingleButtonAlertWithTitle:(NSString *)title messge:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

#pragma mark - Table View Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.geoJSONResponse.features.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeoDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GeoDataTableViewCell" forIndexPath:indexPath];
    [cell setUpCell:self.geoJSONResponse.features[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedFeature = self.geoJSONResponse.features[indexPath.row];
    [self performSegueWithIdentifier:@"ListToMapVCSegue" sender:self];
}

#pragma mark - Control Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ListToMapVCSegue"]) {
        Features *features = self.selectedFeature;
        MapViewController *destViewController = segue.destinationViewController;
        destViewController.passedFeatures = features;
        
    }
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end

