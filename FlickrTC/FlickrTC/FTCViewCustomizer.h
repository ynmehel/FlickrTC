//
//  FTCViewCustomizer.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FTCLabelStyle) {
    
    FTCLabelStylePhotoDetail = 0,
    FTCLabelStylePhotoDescription,
    FTCLabelStylePhotoTags,
};

@interface FTCViewCustomizer : NSObject

+ (void)applyStyle:(FTCLabelStyle)style onLabel:(UILabel *)label;

@end
