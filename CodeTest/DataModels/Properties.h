//
//  Properties.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <Foundation/Foundation.h>

@interface Properties : NSObject
@property (strong, nonatomic) NSString *place;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *magnitude;
- (instancetype) initWithDict:(NSDictionary *)propertiesDict;

@end
