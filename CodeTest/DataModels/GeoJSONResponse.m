//
//  GeoJSONResponse.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "GeoJSONResponse.h"
#import "Features.h"


@implementation GeoJSONResponse
- (instancetype) initWithDictionary:(NSDictionary *)responseDict {
    
    self = [super init];
    if (self) {
        self.type       = @"";
        self.metadata   = @"";
        self.features   = [[NSMutableArray alloc]init];
        
        if ([[responseDict objectForKey:@"type"] isKindOfClass:[NSString class]]) {
            self.type = [responseDict objectForKey:@"type"];
        }
        if ([[responseDict objectForKey:@"metadata"] isKindOfClass:[NSString class]]) {
            self.metadata = [responseDict objectForKey:@"metadata"];
        }
        if ([[responseDict objectForKey:@"features"] isKindOfClass:[NSArray class]]) {
            
            for (int i=0; i<[[responseDict objectForKey:@"features"] count]; i++) {
                Features *tempFeaturesIndexObjects = [[Features alloc]initWithDict:[[responseDict objectForKey:@"features"] objectAtIndex:i]];
                [self.features addObject:tempFeaturesIndexObjects];
            }
        }
    }
    return self;
}

@end
