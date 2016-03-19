//
//  FTCPhotos.m
//
//  Created by Yunus Nedim Mehel on 20/03/2016
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FTCPhotos.h"
#import "FTCPhoto.h"

NSString *const kFTCPhotosPhoto = @"photo";
NSString *const kFTCPhotosPages = @"pages";
NSString *const kFTCPhotosPerpage = @"perpage";
NSString *const kFTCPhotosTotal = @"total";
NSString *const kFTCPhotosPage = @"page";

@interface FTCPhotos ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FTCPhotos

@synthesize photo = _photo;
@synthesize pages = _pages;
@synthesize perpage = _perpage;
@synthesize total = _total;
@synthesize page = _page;


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
    NSObject *receivedFTCPhoto = [dict objectForKey:kFTCPhotosPhoto];
    NSMutableArray *parsedFTCPhoto = [NSMutableArray array];
    if ([receivedFTCPhoto isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFTCPhoto) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFTCPhoto addObject:[FTCPhoto modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFTCPhoto isKindOfClass:[NSDictionary class]]) {
       [parsedFTCPhoto addObject:[FTCPhoto modelObjectWithDictionary:(NSDictionary *)receivedFTCPhoto]];
    }

    self.photo = [NSArray arrayWithArray:parsedFTCPhoto];
            self.pages = [self objectOrNilForKey:kFTCPhotosPages fromDictionary:dict];
            self.perpage = [[self objectOrNilForKey:kFTCPhotosPerpage fromDictionary:dict] doubleValue];
            self.total = [self objectOrNilForKey:kFTCPhotosTotal fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kFTCPhotosPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPhoto = [NSMutableArray array];
    for (NSObject *subArrayObject in self.photo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPhoto addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPhoto addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPhoto] forKey:kFTCPhotosPhoto];
    [mutableDict setValue:self.pages forKey:kFTCPhotosPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.perpage] forKey:kFTCPhotosPerpage];
    [mutableDict setValue:self.total forKey:kFTCPhotosTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kFTCPhotosPage];

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

    self.photo = [aDecoder decodeObjectForKey:kFTCPhotosPhoto];
    self.pages = [aDecoder decodeObjectForKey:kFTCPhotosPages];
    self.perpage = [aDecoder decodeDoubleForKey:kFTCPhotosPerpage];
    self.total = [aDecoder decodeObjectForKey:kFTCPhotosTotal];
    self.page = [aDecoder decodeDoubleForKey:kFTCPhotosPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_photo forKey:kFTCPhotosPhoto];
    [aCoder encodeObject:_pages forKey:kFTCPhotosPages];
    [aCoder encodeDouble:_perpage forKey:kFTCPhotosPerpage];
    [aCoder encodeObject:_total forKey:kFTCPhotosTotal];
    [aCoder encodeDouble:_page forKey:kFTCPhotosPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    FTCPhotos *copy = [[FTCPhotos alloc] init];
    
    if (copy) {

        copy.photo = [self.photo copyWithZone:zone];
        copy.pages = [self.pages copyWithZone:zone];
        copy.perpage = self.perpage;
        copy.total = [self.total copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end
