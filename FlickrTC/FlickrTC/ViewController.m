//
//  ViewController.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 19/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "ViewController.h"
#import "FTCFlow.h"

@interface ViewController ()

@property (strong, nonatomic) FTCFlow *flow;
@end

@implementation ViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _flow = [[FTCFlow alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.flow fetchPartyPhotosWithCompletion:^(FTCSearchResponse *response, NSError *error) {
        
    }];
}

@end
