//
//  Features.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "Features.h"

@implementation Features
- (instancetype) initWithDict:(NSDictionary *)featuresDict {
    
    self = [super init];
    if (self) {
        self.type = @"";
        self.properties = [[NSDictionary alloc]init];
        self.geometry = [[NSDictionary alloc]init];
        
        if ([[featuresDict objectForKey:@"type"] isKindOfClass:[NSString class]]) {
            self.type = [featuresDict objectForKey:@"type"];
        }
        if ([[featuresDict objectForKey:@"properties"] isKindOfClass:[NSDictionary class]]) {
            self.properties = [featuresDict objectForKey:@"properties"];
        }
        if ([[featuresDict objectForKey:@"geometry"] isKindOfClass:[NSDictionary class]]) {
            self.geometry = [featuresDict objectForKey:@"geometry"];
        }
    }
    return self;
}

@end
