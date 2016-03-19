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

- (void)fetchPartyPhotos {
    
    [FTCApiManager fetchMethod:kFTCApiMethodSearch tags:@[kFTCApiTagParty] page:1];
}

@end
