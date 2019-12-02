//
//  Properties.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "Properties.h"

@implementation Properties

- (instancetype) initWithDict:(NSDictionary *)propertiesDict {
    self = [super init];
    if (self) {
        self.place = @"";
        self.type = @"";
        self.time = @"";
        self.magnitude = @"";
        
        if ([[propertiesDict objectForKey:@"place"] isKindOfClass:[NSString class]]) {
            self.place = [propertiesDict objectForKey:@"place"];
        }
        if ([[propertiesDict objectForKey:@"type"] isKindOfClass:[NSString class]]) {
            self.type = [propertiesDict objectForKey:@"type"];
        }
        if ([[propertiesDict objectForKey:@"time"] isKindOfClass:[NSNumber class]]) {
            self.time = [[propertiesDict objectForKey:@"time"] stringValue];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self.time longLongValue]/1000];
            if (date!=nil) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"dd MMM yyyy"];
                NSString *dateString = [formatter stringFromDate:date];
                self.time = dateString;
            }
            
        }
        if ([[propertiesDict objectForKey:@"mag"] isKindOfClass:[NSNumber class]]) {
            self.magnitude = [[propertiesDict objectForKey:@"mag"] stringValue];
        }
    }
    return self;
}

@end
