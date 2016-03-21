//
//  FTCApiManager.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 19/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FTCApiManagerCompletion)(NSDictionary *data, NSError *error);

@interface FTCApiManager : NSObject

/// Fetches the method and appends tags & pages if provided
+ (void)fetchMethod:(NSString *)method
               tags:(NSArray<NSString *> *)tags
               page:(NSUInteger)page
         completion:(FTCApiManagerCompletion)competion;

@end
