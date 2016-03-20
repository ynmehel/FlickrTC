//
//  FTCKeyValuePair.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTCKeyValuePair : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

+ (FTCKeyValuePair *)pairWithKey:(NSString *)key value:(NSString *)value;

@end
