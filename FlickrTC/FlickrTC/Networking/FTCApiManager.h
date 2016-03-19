//
//  FTCApiManager.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 19/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTCApiManager : NSObject

+ (void)fetchMethod:(NSString *)method tags:(NSArray<NSString *> *)tags page:(NSUInteger)page;
+ (void)testCall;

@end
