//
//  FTCFTCBaseModel.h
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FTCPhotos;

@interface FTCBaseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) FTCPhotos *photos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
