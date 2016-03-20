//
//  FTCPhotoListingCollectionViewCell.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCPhotoListingCollectionViewCell.h"

@interface FTCPhotoListingCollectionViewCell()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation FTCPhotoListingCollectionViewCell

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.frame];
    }
    return self;
}

- (void)populateWithPhoto:(FTCPhoto *)photo {
 
}

- (void)didMoveToSuperview {
    
    self.imageView.frame = self.contentView.bounds;
}
@end
