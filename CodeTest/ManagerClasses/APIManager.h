//
//  APIManager.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <Foundation/Foundation.h>


#define FETCH_URL @"https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"

@interface APIManager : NSObject
+ (BOOL)isNetAvailable;
+ (void)getDataFromAPI:(void (^)(NSURLResponse * _Nullable response, NSDictionary * _Nullable responseDict, NSError * _Nullable error))completion;
@end
