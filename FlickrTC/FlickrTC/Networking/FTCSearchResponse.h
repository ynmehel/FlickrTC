//
//  FTCSearchResponse.h
//
//  Created by Yunus Nedim Mehel on 20/03/2016

#import <Foundation/Foundation.h>

@class FTCPhotos;

@interface FTCSearchResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) FTCPhotos *photos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
