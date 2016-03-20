//
//  FTCPhotoListingCollectionViewCell.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCPhotoListingCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface FTCPhotoListingCollectionViewCell()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation FTCPhotoListingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.frame];
    }
    return self;
}

- (void)populateWithPhoto:(FTCPhoto *)photo {
 
    if (photo.url_t) {
        
        self.imageView.frame = self.contentView.bounds;
        [self.contentView addSubview:self.imageView];
        
        [self.imageView setImageWithURL:photo.urlForThumbnail placeholderImage:nil];
    }
}

- (void)didMoveToSuperview {
    
    self.imageView.frame = self.contentView.bounds;
}
@end
