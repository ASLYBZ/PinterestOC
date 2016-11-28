//
//  NTHorizontalPageViewController.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTHorizontalPageViewController.h"

#import "NTHorizontalPageViewCell.h"


static NSString *horizontalPageViewCellIdentify = @"horizontalPageViewCellIdentify";

@interface NTHorizontalPageViewController ()

@property (nonatomic, assign) CGPoint pullOffset;

@end

@implementation NTHorizontalPageViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pullOffset = CGPointZero;
}

- (instancetype)initWithCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout currentIndexPath:(NSIndexPath *)indexPath {
    if (self = [super initWithCollectionViewLayout:collectionViewFlowLayout]) {
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerClass:[NTHorizontalPageViewCell class] forCellWithReuseIdentifier:horizontalPageViewCellIdentify];
        [self.collectionView setToIndexPath:indexPath];
        [self.collectionView performBatchUpdates:^{
            [self.collectionView reloadData];
        } completion:^(BOOL finished) {
            if (finished) {
                [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            }
        }];
    }
    return self;
}






#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.imageNameList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NTHorizontalPageViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:horizontalPageViewCellIdentify forIndexPath:indexPath];
    collectionCell.imageName = self.imageNameList[indexPath.row];
//    collectionCell
    NSLog(@"indexPath.row---->%ld    imageName---------->%@", (long)indexPath.row, self.imageNameList[indexPath.row]);
    __weak typeof(self) weakSelf = self;
    collectionCell.pullAction = ^(CGPoint offset) {
        weakSelf.pullOffset = offset;
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [collectionCell setNeedsDisplay];
    return collectionCell;

}

- (UICollectionView *)transitionCollectionView {
    return self.collectionView;
}

- (CGPoint)pageViewCellScrollViewContentOffset {
    return self.pullOffset;
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
