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

@implementation FTCFlow

- (void)fetchPartyPhotosWithCompletion:(FTCFlowFetchPartyCompletion)completion {
    
    [FTCApiManager fetchMethod:kFTCApiMethodSearch tags:@[kFTCApiTagParty] page:1 completion:^(NSDictionary *data, NSError *error) {
        
        FTCSearchResponse *response;
        if (error != nil) {
            
            response = [[FTCSearchResponse alloc] initWithDictionary:data];
        }
        if (completion) {
            
            completion(response, error);
        }
    }];
}

@end
