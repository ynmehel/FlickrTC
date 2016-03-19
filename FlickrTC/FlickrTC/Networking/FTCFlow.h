//
//  FTCFlow.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTCSearchResponse.h"

typedef void(^FTCFlowFetchPartyCompletion)(FTCSearchResponse *response, NSError *error);

@interface FTCFlow : NSObject

- (void)fetchPartyPhotosWithCompletion:(FTCFlowFetchPartyCompletion)completion;

@end
