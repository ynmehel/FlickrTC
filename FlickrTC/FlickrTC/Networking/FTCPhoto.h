//
//  FTCPhoto.h
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTCKeyValuePair.h"

@interface FTCPhoto : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, assign) double farm;
@property (nonatomic, strong) NSString *photoIdentifier;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url_m;
@property (nonatomic, strong) NSString *url_t;
@property (nonatomic, strong) NSString *url_z;
@property (nonatomic, strong) NSString *photoDescription;
@property (nonatomic, strong) NSString *uploadDate;
@property (nonatomic, strong) NSString *dateTaken;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *lastUpdate;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double isfriend;
@property (nonatomic, assign) double isfamily;
@property (nonatomic, assign) double ispublic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
- (NSURL *)urlForThumbnail;
- (NSURL *)urlForZSizedImage;

/// Returns an array of Key-Value pairs to be included on the details page
- (NSArray<FTCKeyValuePair *> *)detailsToShow;

@end
