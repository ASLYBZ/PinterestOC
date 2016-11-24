//
//  NTWaterfallViewController.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/10.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTWaterfallViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "NavigationControllerDelegate.h"
#import "NTWaterfallViewCell.h"
#import "NTHorizontalPageViewController.h"
#import "UICollectionView+Extension.h"

#define GetWindowsFrameWidth [UIScreen mainScreen].bounds.size.width
#define GetWindowsFrameHeight [UIScreen mainScreen].bounds.size.height


@interface NTWaterfallViewController ()<CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) NSMutableArray *imageNameList;

@property (nonatomic, strong) NavigationControllerDelegate *delegateHolder;

@end

@implementation NTWaterfallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegateHolder = [[NavigationControllerDelegate alloc] init];
    self.navigationController.delegate = self.delegateHolder;
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.imageNameList = [NSMutableArray array];
    for (int i = 0; i < 14; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        [self.imageNameList addObject:imageName];
    }
    
    self.collectionView.frame = [UIScreen mainScreen].bounds;
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    
    [self.collectionView setCollectionViewLayout:layout animated:YES];
    [self.collectionView registerClass:[NTWaterfallViewCell class] forCellWithReuseIdentifier:@"waterCell"];
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = [UIImage imageNamed:self.imageNameList[indexPath.row]];
    CGFloat imageHeight = image.size.height * (GetWindowsFrameWidth * 0.5 - 5.0) / image.size.width;
    return  CGSizeMake((GetWindowsFrameWidth * 0.5 - 5.0), imageHeight);
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NTWaterfallViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"waterCell" forIndexPath:indexPath];
    cell.iamgeName = self.imageNameList[indexPath.row];
    
    [cell setNeedsLayout];
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageNameList.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NTHorizontalPageViewController *pageVC = [[NTHorizontalPageViewController alloc] initWithCollectionViewFlowLayout:[self pageViewControllerLayout] currentIndexPath:indexPath];
    pageVC.imageNameList = self.imageNameList;
    [collectionView setToIndexPath:indexPath];
    [self.navigationController pushViewController:pageVC animated:YES];

}

- (UICollectionViewFlowLayout *)pageViewControllerLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
//    CGSize size = self.navigationController.isNavigationBarHidden ?
    
    flowLayout.itemSize =  CGSizeMake(GetWindowsFrameWidth, GetWindowsFrameHeight);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return flowLayout;
}

// 回调
- (void)viewWillAppearWithPageIndex:(NSInteger)pageIndex {
    UICollectionViewScrollPosition position = UICollectionViewScrollPositionCenteredVertically & UICollectionViewScrollPositionCenteredHorizontally;
    
    UIImage *image = [UIImage imageNamed:self.imageNameList[pageIndex]];
    CGFloat imageHeight = image.size.height * (GetWindowsFrameWidth * 0.5 - 5.0) / image.size.width;
    if (imageHeight > 400) {
        position = UICollectionViewScrollPositionTop;
    }
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:pageIndex inSection:0];
    [self.collectionView setToIndexPath:currentIndexPath];
    if (pageIndex < 2) {
        [self.collectionView setContentOffset:CGPointZero animated:NO];
    } else {
        [self.collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition:position animated:NO];
    }
}


- (UICollectionView *)transitionCollectionView {
    return self.collectionView;
}




















@end
