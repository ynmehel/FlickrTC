//
//  FTCApiManager.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 19/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCApiManager.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const kFTCApiBaseUrl = @"https://api.flickr.com/services/rest/";
static NSString * const kFTCApiKeyFlickrApiKey = @"4b7a2099de35cc59935bddaafc6ee7be";
static NSString * const kFTCApiKeyFlickrApiSig = @"f807d8f57a9c98199f2db6b975b8b3a8";
static NSString * const kFTCApiKeyMethod = @"?method=%@";
static NSString * const kFTCApiKeyHttpParamKey = @"&api_key=%@";

@implementation FTCApiManager

+ (void)fetchMethod:(NSString *)method tags:(NSArray<NSString *> *)tags page:(NSUInteger)page
{
    NSMutableString *urlString = [kFTCApiBaseUrl mutableCopy];
    [urlString appendFormat:kFTCApiKeyMethod, method];
    [urlString appendFormat:kFTCApiKeyHttpParamKey, kFTCApiKeyFlickrApiKey];
    if (tags.count > 0) {
        
        [urlString appendString:@"&tags="];
        [urlString appendString:tags.firstObject];
        
        for (int i = 1; i < tags.count; i ++) {
            
            [urlString appendString:@"%2C+"];
            [urlString appendString:tags[i]];
            
        }
    }
    [urlString appendString:@"&format=json&nojsoncallback=1"];
    [urlString appendFormat:@"&api_sig=%@", kFTCApiKeyFlickrApiSig];
    [urlString appendFormat:@"&page=%lu", (unsigned long)page];
    
    NSLog(@"FTCApiManager sending request: %@", urlString);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

+ (void)testCall {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4b7a2099de35cc59935bddaafc6ee7be&tags=party&format=json&nojsoncallback=1&api_sig=f807d8f57a9c98199f2db6b975b8b3a8" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
