//
//  FTCKeyValuePair.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCKeyValuePair.h"

@implementation FTCKeyValuePair

+ (FTCKeyValuePair *)pairWithKey:(NSString *)key value:(NSString *)value {
    
    FTCKeyValuePair *pair = [[FTCKeyValuePair alloc] init];
    pair.key = key;
    pair.value = value;
    return pair;
}

@end
