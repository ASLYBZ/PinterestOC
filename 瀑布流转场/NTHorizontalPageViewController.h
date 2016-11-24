//
//  NTHorizontalPageViewController.h
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionView+Extension.h"
#import "NTTransitionProtocol.h"

@interface NTHorizontalPageViewController : UICollectionViewController  <NTTransitionProtocol, NTHorizontalPageViewControllerProtocol>

@property (nonatomic, strong) NSArray *imageNameList;

@property (nonatomic, strong) UICollectionView *collectionV;

- (instancetype)initWithCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout currentIndexPath:(NSIndexPath *)indexPath;

@end
