//
//  APIManager.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "APIManager.h"
#import "AFNetworking.h"
#import "Reachability.h"

@implementation APIManager
+ (BOOL)isNetAvailable {
    BOOL available=NO;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)              available = NO;     //No internet
    else if (status == ReachableViaWiFi)    available = YES;    //WiFi
    else if (status == ReachableViaWWAN)    available = YES;    //3G
    return available;
}

+ (void)getDataFromAPI:(void (^)(NSURLResponse * _Nullable response, NSDictionary * _Nullable responseDict, NSError * _Nullable error))completion {
    if (![APIManager isNetAvailable]) {
        NSMutableDictionary* errorDetails = [NSMutableDictionary dictionary];
        [errorDetails setValue:@"Service Unavailable. Please check your internet connectivity." forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:@"Service Unavailable" code:503 userInfo:errorDetails];
        completion(nil, nil, error);
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:FETCH_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response, NSDictionary *responseDict, NSError *error) {
        if (!error) {
            completion(response, responseDict, error);
        } else {
            completion(response, responseDict, error);
        }
    }];
    [dataTask resume];
}

@end
