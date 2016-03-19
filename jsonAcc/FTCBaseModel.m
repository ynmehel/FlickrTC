//
//  FTCFTCBaseModel.m
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FTCFTCBaseModel.h"
#import "FTCPhotos.h"


NSString *const kFTCFTCBaseModelStat = @"stat";
NSString *const kFTCFTCBaseModelPhotos = @"photos";


@interface FTCBaseModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FTCBaseModel

@synthesize stat = _stat;
@synthesize photos = _photos;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.stat = [self objectOrNilForKey:kFTCFTCBaseModelStat fromDictionary:dict];
            self.photos = [FTCPhotos modelObjectWithDictionary:[dict objectForKey:kFTCFTCBaseModelPhotos]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kFTCFTCBaseModelStat];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kFTCFTCBaseModelPhotos];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.stat = [aDecoder decodeObjectForKey:kFTCFTCBaseModelStat];
    self.photos = [aDecoder decodeObjectForKey:kFTCFTCBaseModelPhotos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kFTCFTCBaseModelStat];
    [aCoder encodeObject:_photos forKey:kFTCFTCBaseModelPhotos];
}

- (id)copyWithZone:(NSZone *)zone
{
    FTCFTCBaseModel *copy = [[FTCFTCBaseModel alloc] init];
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.photos = [self.photos copyWithZone:zone];
    }
    
    return copy;
}


@end
