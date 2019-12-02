//
//  Features.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <Foundation/Foundation.h>

@interface Features : NSObject
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSDictionary *properties;
@property (strong, nonatomic) NSDictionary *geometry;
- (instancetype) initWithDict:(NSDictionary *)featuresDict;
@end

