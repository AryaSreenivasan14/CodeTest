//
//  CodeTestUITests.m
//  CodeTestUITests
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <XCTest/XCTest.h>

@interface CodeTestUITests : XCTestCase

@end

@implementation CodeTestUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}
- (void)testTableAndMap {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    if (app.tables.cells.count>0) {
        [[app.tables.cells elementBoundByIndex:0] tap];
    }
    
    
    XCUIElement *map = [[[[[[[[[[XCUIApplication alloc] init] childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeMap].element;
    [map tap];
    
    XCUIElement *backButton = app.buttons[@"back"];
    [backButton tap];
    
}


@end
