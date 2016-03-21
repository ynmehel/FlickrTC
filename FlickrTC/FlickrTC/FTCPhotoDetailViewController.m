//
//  FTCPhotoDetailViewController.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 20/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCPhotoDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIView+FTCAdditions.h"
#import "FTCViewCustomizer.h"

static NSString * const kFTCDetailReuseIdentifier = @"com.ftc.detailReuseID";

static CGFloat const kIBMPhotoDetailImageOffset = 40.0;
static CGFloat const kIBMPhotoDetailImageHeight = 200.0;
static CGFloat const kIBMPhotoDetailMultilineLabelHeight = 45.0;
static CGFloat const kIBMPhotoDetailHorizontalOffset = 10.0;

@interface FTCPhotoDetailViewController () <UITableViewDataSource>

@property (strong, nonatomic) FTCFlow *flow;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *tagsLabel;

@end

@implementation FTCPhotoDetailViewController

- (instancetype)initWithFlow:(FTCFlow *)flow {
    
    self = [super init];
    if (self) {
        
        _flow = flow;
        _imageView = [[UIImageView alloc] initWithImage:nil];
        _tableView = [[UITableView alloc] init];
        _descriptionLabel = [[UILabel alloc] init];
        _tagsLabel = [[UILabel alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = self.flow.selectedPhoto.title;
    
    // Image View
    [self.imageView setFrame:CGRectMake(kIBMPhotoDetailHorizontalOffset, kIBMPhotoDetailImageOffset, [self widthExcludingOffsets], kIBMPhotoDetailImageHeight)];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImageWithURL:self.flow.selectedPhoto.urlForZSizedImage placeholderImage:nil];
    [self.view addSubview:self.imageView];
    
    // Image description
    self.descriptionLabel.frame = CGRectMake(kIBMPhotoDetailHorizontalOffset, [self.imageView ftc_bottom], [self widthExcludingOffsets], kIBMPhotoDetailMultilineLabelHeight);
    [FTCViewCustomizer applyStyle:FTCLabelStylePhotoDescription onLabel:self.descriptionLabel];
    [self.descriptionLabel setText:self.flow.selectedPhoto.photoDescription];
    [self.descriptionLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.descriptionLabel];
    
    // Tags
    self.tagsLabel.frame = CGRectMake(kIBMPhotoDetailHorizontalOffset, [self.descriptionLabel ftc_bottom], [self widthExcludingOffsets], kIBMPhotoDetailMultilineLabelHeight);
    [FTCViewCustomizer applyStyle:FTCLabelStylePhotoTags onLabel:self.tagsLabel];
    [self.tagsLabel setText:self.flow.selectedPhoto.tags];
    [self.view addSubview:self.tagsLabel];
    
    //TableView
    self.tableView.dataSource = self;
    self.tableView.allowsSelection = NO;
    [self.tableView setFrame:CGRectMake(0, [self.tagsLabel ftc_bottom], CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - [self.tagsLabel ftc_bottom])];
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.tableView.separatorColor = self.tableView.backgroundColor;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.flow.selectedPhoto.detailsToShow.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFTCDetailReuseIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:kFTCDetailReuseIdentifier];
    }
    cell.backgroundColor = self.tableView.backgroundColor;
    [FTCViewCustomizer applyStyle:FTCLabelStylePhotoDetailKey onLabel:cell.textLabel];
    [FTCViewCustomizer applyStyle:FTCLabelStylePhotoDetailValue onLabel:cell.detailTextLabel];
    
    if (indexPath.row < self.flow.selectedPhoto.detailsToShow.count) {
        
        FTCKeyValuePair *pair = self.flow.selectedPhoto.detailsToShow[indexPath.row];
        cell.textLabel.text = pair.key;
        cell.detailTextLabel.text = pair.value;
    }
    return cell;
}

#pragma mark - 

- (CGFloat)widthExcludingOffsets {
    
    return [self.view ftc_width] - 2 * kIBMPhotoDetailHorizontalOffset;
}

@end
