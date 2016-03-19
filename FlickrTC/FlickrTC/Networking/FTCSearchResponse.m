//
//  FTCSearchResponse.m
//
//  Created by Yunus Nedim Mehel on 20/03/2016

#import "FTCSearchResponse.h"
#import "FTCPhotos.h"

NSString *const kFTCSearchResponseKeyStat = @"stat";
NSString *const kFTCSearchResponseKeyPhotos = @"photos";

@interface FTCSearchResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FTCSearchResponse

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
            self.stat = [self objectOrNilForKey:kFTCSearchResponseKeyStat fromDictionary:dict];
            self.photos = [FTCPhotos modelObjectWithDictionary:[dict objectForKey:kFTCSearchResponseKeyPhotos]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kFTCSearchResponseKeyStat];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kFTCSearchResponseKeyPhotos];

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

    self.stat = [aDecoder decodeObjectForKey:kFTCSearchResponseKeyStat];
    self.photos = [aDecoder decodeObjectForKey:kFTCSearchResponseKeyPhotos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kFTCSearchResponseKeyStat];
    [aCoder encodeObject:_photos forKey:kFTCSearchResponseKeyPhotos];
}

- (id)copyWithZone:(NSZone *)zone
{
    FTCSearchResponse *copy = [[FTCSearchResponse alloc] init];
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.photos = [self.photos copyWithZone:zone];
    }
    
    return copy;
}


@end
