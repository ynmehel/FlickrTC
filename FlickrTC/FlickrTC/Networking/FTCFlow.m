//
//  FTCFlow.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCFlow.h"
#import "FTCApiManager.h"

static NSString * const kFTCApiMethodSearch = @"flickr.photos.search";
static NSString * const kFTCApiTagParty = @"party";

@interface FTCFlow()

@property (strong, nonatomic) NSMutableArray<FTCPhoto *> *photos;

@end

@implementation FTCFlow

- (void)fetchPartyPhotosWithCompletion:(FTCFlowFetchPartyCompletion)completion {
    
    [FTCApiManager fetchMethod:kFTCApiMethodSearch tags:@[kFTCApiTagParty] page:1 completion:^(NSDictionary *data, NSError *error) {
        
        FTCSearchResponse *response;
        if (error == nil) {
            
            response = [[FTCSearchResponse alloc] initWithDictionary:data];
            [self appendPhotos:response.photos.photo];
        }
        if (completion) {
            
            completion(response, error);
        }
    }];
}

- (void)appendPhotos:(NSArray<FTCPhoto *> *)photos {
    
    if (!self.photos) {
        
        self.photos = [NSMutableArray array];
    }
    [self.photos addObjectsFromArray:photos];
}

@end
