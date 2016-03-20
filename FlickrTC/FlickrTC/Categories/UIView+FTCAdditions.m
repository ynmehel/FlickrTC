//
//  UIView+FTCAdditions.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "UIView+FTCAdditions.h"

@implementation UIView (FTCAdditions)

- (CGFloat)ftc_bottom {
    
    return CGRectGetHeight(self.frame) + CGRectGetMinY(self.frame);
}

- (CGFloat)ftc_width {
    
    return CGRectGetWidth(self.frame);
}

@end
