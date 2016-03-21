//
//  FTCPhotoDetailViewController.h
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCFlow.h"
#import "FTCFlow.h"

@interface FTCPhotoDetailViewController : UIViewController

/// Creates an instance of FTCPhotoDetailViewController with the given flow. Flow holds the photos and selected photo, nothing else is needed for the photo details
- (instancetype)initWithFlow:(FTCFlow *)flow;

@end
