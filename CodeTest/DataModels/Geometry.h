//
//  Geometry.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <Foundation/Foundation.h>

@interface Geometry : NSObject
@property (strong, nonatomic) NSArray *coordinates;
- (instancetype) initWithDict:(NSDictionary *)geometryDict;

@end

