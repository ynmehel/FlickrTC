//
//  FTCViewCustomizer.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCViewCustomizer.h"

@implementation FTCViewCustomizer

+ (void)applyStyle:(FTCLabelStyle)style onLabel:(UILabel *)label {
    
    switch (style) {
        case FTCLabelStylePhotoDescription:
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:12 weight:10];
            label.numberOfLines = 3;
            break;
            
        case FTCLabelStylePhotoTags:
            label.font = [UIFont italicSystemFontOfSize:12];
            label.textColor = [UIColor lightGrayColor];
            label.numberOfLines = 3;
            break;
            
        case FTCLabelStylePhotoDetailKey:
            label.textColor = [UIColor colorWithRed:0 green:0.7 blue:0.9 alpha:1];
            label.numberOfLines = 1;
            break;
            
        case FTCLabelStylePhotoDetailValue:
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 1;
            break;
            
        default:
            label.textColor = [UIColor whiteColor];
            break;
    }
}

@end
