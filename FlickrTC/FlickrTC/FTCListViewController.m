//
//  FTCListViewController.m
//  FlickrTC
//
//  Created by Yunus Nedim Mehel on 19/03/2016.
//  Copyright © 2016 Yunus Nedim Mehel. All rights reserved.
//

#import "FTCListViewController.h"
#import "FTCFlow.h"
#import "FTCPhotoListingCollectionViewCell.h"

static NSString * const kFTCListReuseIdentifier = @"com.ftc.reuseID";

@interface FTCListViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) FTCFlow *flow;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation FTCListViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _flow = [[FTCFlow alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[FTCPhotoListingCollectionViewCell class] forCellWithReuseIdentifier:kFTCListReuseIdentifier];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    self.collectionView.frame = self.view.bounds;
    self.collectionView.frame = CGRectMake(20, 100, 300, 400);
    
    [self.collectionView setBackgroundColor:[UIColor purpleColor]];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.flow fetchPartyPhotosWithCompletion:^(FTCSearchResponse *response, NSError *error) {
       
        [self.collectionView reloadData];
    }];
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.flow.photos.count;;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FTCPhotoListingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFTCListReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

@end
