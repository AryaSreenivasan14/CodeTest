//
//  MapViewController.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "MapViewController.h"
#import "Properties.h"
#import "Geometry.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Properties *property  = [[Properties alloc]initWithDict:self.passedFeatures.properties];
    Geometry *geometry = [[Geometry alloc] initWithDict:self.passedFeatures.geometry];
    
    if (geometry.coordinates.count>=2) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([geometry.coordinates[1] doubleValue], [geometry.coordinates[0] doubleValue]);
        self.mapView.centerCoordinate = coordinate;
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = coordinate;
        point.title = property.place;
        point.subtitle = [NSString stringWithFormat:@"%@ Magniture = %@",property.type,property.magnitude];
        
        [self.mapView addAnnotation:point];
    }
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
