//
//  FTCFlow.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTCSearchResponse.h"
#import "FTCPhoto.h"
#import "FTCPhotos.h"

typedef void(^FTCFlowFetchPartyCompletion)(FTCSearchResponse *response, NSError *error);

/// Acts as a middleware for APIManager and the viewControllers, carries the models and responses. Handles most of the logic
@interface FTCFlow : NSObject

/// Array of FTCPhotos, nil until a successful fetchPartyPhotos call
@property (strong, nonatomic, readonly) NSMutableArray<FTCPhoto *> *photos;
@property (strong, nonatomic) FTCPhoto *selectedPhoto;

/// Fetches photos, tagged with "Party"
- (void)fetchPartyPhotosWithCompletion:(FTCFlowFetchPartyCompletion)completion;

@end
