//
//  GeoJSONResponse.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <Foundation/Foundation.h>


@interface GeoJSONResponse : NSObject
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *metadata;
@property (strong, nonatomic) NSMutableArray *features;
- (instancetype) initWithDictionary:(NSDictionary *)responseDict;

@end

