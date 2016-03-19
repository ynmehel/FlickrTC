//
//  FTCPhotos.h
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTCPhotos : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *photo;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, assign) double perpage;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
