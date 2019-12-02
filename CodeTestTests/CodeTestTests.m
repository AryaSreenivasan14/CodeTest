//
//  CodeTestTests.m
//  CodeTestTests
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <XCTest/XCTest.h>
#import "APIManager.h"
#import "ListViewController.h"
#import "MapViewController.h"
#import "Properties.h"
#import "Geometry.h"

@interface CodeTestTests : XCTestCase
@property ListViewController *listVC;
@property MapViewController *mapVC;

@end

@implementation CodeTestTests

- (void)setUp {
    UIStoryboard* storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.listVC = (ListViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    self.mapVC = (MapViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}
- (void)testInitListTableView {
    UIView *listVCView  __attribute__((unused)) = self.listVC.view;
    XCTAssertNotNil(self.listVC.tableView);
}

- (void)testDataTask {
    XCTestExpectation *expectation = [self expectationWithDescription:@"asyncronousFetchRequest"];
    [APIManager getDataFromAPI:^(NSURLResponse * _Nullable response, NSDictionary * _Nullable responseDict, NSError * _Nullable error) {
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        if (![responseDict isKindOfClass:[NSDictionary class]]) {
            XCTFail("Invalid response dictionary");
        }
        
        if (![[responseDict objectForKey:@"features"] isKindOfClass:[NSArray class]]) {
            XCTFail("Invalid features dictionary inside main response dictionary");
        }
        
        for (int i=0; i<self.listVC.geoJSONResponse.features.count; i++) {
            Features *features = self.listVC.geoJSONResponse.features[i];
            
            Properties *property  = [[Properties alloc]initWithDict:features.properties];
            if (property.place.length==0) {
                XCTFail("Coordinate location/address not available");
            }
            
            Gerometry *geometry = [[Gerometry alloc] initWithDict:features.geometry];
            if (geometry.coordinates.count<2) {
                XCTFail("Not enough coordinate points available in coordinates array");
            }
        }
        
        
        XCTAssert(responseDict, @"responseDict nil");
        [expectation fulfill];
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

#pragma mark - MapVC Tests
- (void)testInitMapVCMapView {
    UIView *mapVCView  __attribute__((unused)) = self.mapVC.view;
    XCTAssertNotNil(self.mapVC.mapView);
}

@end
