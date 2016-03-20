//
//  FTCPhotoDetailViewController.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCPhotoDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

static CGFloat const kIBMPhotoDetailImageHeight = 100.0;

@interface FTCPhotoDetailViewController () <UITableViewDataSource>

@property (strong, nonatomic) FTCFlow *flow;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation FTCPhotoDetailViewController

- (instancetype)initWithFlow:(FTCFlow *)flow {
    
    self = [super init];
    if (self) {
        
        _flow = flow;
        _imageView = [[UIImageView alloc] initWithImage:nil];
        _tableView = [[UITableView alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.allowsSelection = NO;
    
    [self.imageView setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kIBMPhotoDetailImageHeight)];
    [self.tableView setFrame:CGRectMake(0, kIBMPhotoDetailImageHeight, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - kIBMPhotoDetailImageHeight)];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.tableView];
    
    [self.imageView setImageWithURL:self.flow.selectedPhoto.urlForZSizedImage placeholderImage:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
#warning missing implementation
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

#warning missing implementation
    return nil;
}

@end
