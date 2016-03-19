//
//  FTCPhoto.m
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FTCPhoto.h"

NSString *const kFTCPhotoSecret = @"secret";
NSString *const kFTCPhotoOwner = @"owner";
NSString *const kFTCPhotoFarm = @"farm";
NSString *const kFTCPhotoId = @"id";
NSString *const kFTCPhotoServer = @"server";
NSString *const kFTCPhotoTitle = @"title";
NSString *const kFTCPhotoIsfriend = @"isfriend";
NSString *const kFTCPhotoIsfamily = @"isfamily";
NSString *const kFTCPhotoIspublic = @"ispublic";

@interface FTCPhoto ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FTCPhoto

@synthesize secret = _secret;
@synthesize owner = _owner;
@synthesize farm = _farm;
@synthesize photoIdentifier = _photoIdentifier;
@synthesize server = _server;
@synthesize title = _title;
@synthesize isfriend = _isfriend;
@synthesize isfamily = _isfamily;
@synthesize ispublic = _ispublic;


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
            self.secret = [self objectOrNilForKey:kFTCPhotoSecret fromDictionary:dict];
            self.owner = [self objectOrNilForKey:kFTCPhotoOwner fromDictionary:dict];
            self.farm = [[self objectOrNilForKey:kFTCPhotoFarm fromDictionary:dict] doubleValue];
            self.photoIdentifier = [self objectOrNilForKey:kFTCPhotoId fromDictionary:dict];
            self.server = [self objectOrNilForKey:kFTCPhotoServer fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFTCPhotoTitle fromDictionary:dict];
            self.isfriend = [[self objectOrNilForKey:kFTCPhotoIsfriend fromDictionary:dict] doubleValue];
            self.isfamily = [[self objectOrNilForKey:kFTCPhotoIsfamily fromDictionary:dict] doubleValue];
            self.ispublic = [[self objectOrNilForKey:kFTCPhotoIspublic fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.secret forKey:kFTCPhotoSecret];
    [mutableDict setValue:self.owner forKey:kFTCPhotoOwner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.farm] forKey:kFTCPhotoFarm];
    [mutableDict setValue:self.photoIdentifier forKey:kFTCPhotoId];
    [mutableDict setValue:self.server forKey:kFTCPhotoServer];
    [mutableDict setValue:self.title forKey:kFTCPhotoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfriend] forKey:kFTCPhotoIsfriend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfamily] forKey:kFTCPhotoIsfamily];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ispublic] forKey:kFTCPhotoIspublic];

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

    self.secret = [aDecoder decodeObjectForKey:kFTCPhotoSecret];
    self.owner = [aDecoder decodeObjectForKey:kFTCPhotoOwner];
    self.farm = [aDecoder decodeDoubleForKey:kFTCPhotoFarm];
    self.photoIdentifier = [aDecoder decodeObjectForKey:kFTCPhotoId];
    self.server = [aDecoder decodeObjectForKey:kFTCPhotoServer];
    self.title = [aDecoder decodeObjectForKey:kFTCPhotoTitle];
    self.isfriend = [aDecoder decodeDoubleForKey:kFTCPhotoIsfriend];
    self.isfamily = [aDecoder decodeDoubleForKey:kFTCPhotoIsfamily];
    self.ispublic = [aDecoder decodeDoubleForKey:kFTCPhotoIspublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_secret forKey:kFTCPhotoSecret];
    [aCoder encodeObject:_owner forKey:kFTCPhotoOwner];
    [aCoder encodeDouble:_farm forKey:kFTCPhotoFarm];
    [aCoder encodeObject:_photoIdentifier forKey:kFTCPhotoId];
    [aCoder encodeObject:_server forKey:kFTCPhotoServer];
    [aCoder encodeObject:_title forKey:kFTCPhotoTitle];
    [aCoder encodeDouble:_isfriend forKey:kFTCPhotoIsfriend];
    [aCoder encodeDouble:_isfamily forKey:kFTCPhotoIsfamily];
    [aCoder encodeDouble:_ispublic forKey:kFTCPhotoIspublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    FTCPhoto *copy = [[FTCPhoto alloc] init];
    
    if (copy) {

        copy.secret = [self.secret copyWithZone:zone];
        copy.owner = [self.owner copyWithZone:zone];
        copy.farm = self.farm;
        copy.photoIdentifier = [self.photoIdentifier copyWithZone:zone];
        copy.server = [self.server copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.isfriend = self.isfriend;
        copy.isfamily = self.isfamily;
        copy.ispublic = self.ispublic;
    }
    
    return copy;
}


@end
