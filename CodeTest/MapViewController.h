//
//  MapViewController.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Features.h"


@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) Features *passedFeatures;

@end
