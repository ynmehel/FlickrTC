//
//  FTCPhotoListingCollectionViewCell.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCPhotoListingCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIView+FTCAdditions.h"

static CGFloat const kFTCPhotoListingImageOffset = 3.0;

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
        
        [self.imageView setClipsToBounds:YES];
        self.imageView.frame = CGRectMake(kFTCPhotoListingImageOffset, kFTCPhotoListingImageOffset, [self.contentView ftc_width] - 2 * kFTCPhotoListingImageOffset, [self.contentView ftc_height] - 2 * kFTCPhotoListingImageOffset);
        [self.contentView addSubview:self.imageView];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.imageView setImageWithURL:photo.urlForThumbnail placeholderImage:nil];
    }
}

- (void)didMoveToSuperview {
    
    self.imageView.frame = self.contentView.bounds;
}
@end
