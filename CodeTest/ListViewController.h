//
//  ListViewController.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <UIKit/UIKit.h>
#import "GeoJSONResponse.h"
#import "Features.h"

@interface ListViewController : UIViewController
@property (strong, nonatomic) GeoJSONResponse *geoJSONResponse;
@property (strong, nonatomic) Features *selectedFeature;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end
