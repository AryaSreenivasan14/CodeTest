//
//  Geometry.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "Geometry.h"

@implementation Geometry

- (instancetype) initWithDict:(NSDictionary *)geometryDict{
    self = [super init];
    if (self) {
        self.coordinates = [[NSArray alloc] init];
        
        if ([[geometryDict objectForKey:@"coordinates"] isKindOfClass:[NSArray class]]) {
            self.coordinates = [geometryDict objectForKey:@"coordinates"];
        }
    }
    return self;
}


@end
