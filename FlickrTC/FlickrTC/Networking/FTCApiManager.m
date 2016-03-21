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
static NSString * const kFTCApiKeyFlickrApiKey = @"bd0dc1bd9eae34fd28a4772e071cd4f8";
static NSString * const kFTCApiKeyMethod = @"?method=%@";
static NSString * const kFTCApiKeyHttpParamKey = @"&api_key=%@";
static NSString * const kFTCApiMethodPhotoInfo = @"flickr.photos.getInfo";
static NSString * const kFTCApiRequestFormat = @"&format=json&nojsoncallback=1";
static NSString * const kFTCApiRequestExtras = @"&extras=url_t%2C+url_z%2C+description%2C+date_upload%2C+date_taken%2C+owner_name%2C+last_update%2C+tags";
static NSString * const kFTCApiRequestParamTags = @"&tags=";
static NSString * const kFTCApiRequestParamPage = @"&page=%lu";

static NSString * const kFTCApiResponseStatusKey = @"stat";
static NSString * const kFTCApiResponseStatusOK = @"ok";
static NSString * const kFTCApiResponseStatusMessage = @"message";
static NSString * const kFTCApiResponseStatusCode = @"code";
static NSString * const kFTCApiResponseErrorDomain = @"com.ynm.ftc";


@implementation FTCApiManager

+ (void)fetchMethod:(NSString *)method
               tags:(NSArray<NSString *> *)tags
               page:(NSUInteger)page
         completion:(FTCApiManagerCompletion)competion
{
    NSMutableString *urlString = [kFTCApiBaseUrl mutableCopy];
    [urlString appendFormat:kFTCApiKeyMethod, method];
    [urlString appendFormat:kFTCApiKeyHttpParamKey, kFTCApiKeyFlickrApiKey];
    if (tags.count > 0) {
        
        [urlString appendString:kFTCApiRequestParamTags];
        [urlString appendString:tags.firstObject];
        
        for (int i = 1; i < tags.count; i ++) {
            
            [urlString appendString:@"%2C+"];
            [urlString appendString:tags[i]];
            
        }
    }
    [urlString appendString:kFTCApiRequestFormat];
    [urlString appendString:kFTCApiRequestExtras];
    [urlString appendFormat:kFTCApiRequestParamPage, (unsigned long)page];
    
    NSLog(@"FTCApiManager sending request: %@", urlString);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    
        if (competion) {
            
            competion(responseObject, [FTCApiManager errorWithResponseDictionary:responseObject]);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (competion) {
            
            competion(nil, error);
        }
    }];
    
}

+ (NSError *)errorWithResponseDictionary:(NSDictionary *)dictionary {
    
    NSError *error;
    if (![[dictionary objectForKey:kFTCApiResponseStatusKey] isEqualToString:kFTCApiResponseStatusOK]) {
        
        NSString *errMsg = [dictionary objectForKey:kFTCApiResponseStatusMessage] ?: NSLocalizedString(@"", nil);
        NSInteger errCode = [[dictionary objectForKey:kFTCApiResponseStatusCode] integerValue];
        
        error = [NSError errorWithDomain:kFTCApiResponseErrorDomain
                                    code:errCode
                                userInfo:@{NSLocalizedDescriptionKey:errMsg}];
    }
    
    return error;
}

@end
