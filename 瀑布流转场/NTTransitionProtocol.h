//
//  WLTransitionProtocol.h
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NTTransitionProtocol <NSObject>

@optional

/**
 *  获取需要变换的CollectionView
 *
 *  @return 目标变换CollectionView
 */
- (UICollectionView *)transitionCollectionView;

@end



@protocol NTTansitionWaterfallGridViewProtocol <NSObject>

/**
 *  获取需要缩放的快照View
 *
 *  @return 目标快照
 */
- (UIView *)snapShotForTransition;

@end


@protocol NTWaterFallViewControllerProtocol <NSObject>

/**
 *  当详情页面进行左右滑动之后，需要回调告诉父视图控制器
 *
 *  @param pageIndex 某一页码
 */
- (void)viewWillAppearWithPageIndex:(NSInteger)pageIndex;

@end

@protocol NTHorizontalPageViewControllerProtocol <NSObject>

/**
 *  获取横向滚动ScrollView的ContentOffset
 *
 *  @return 目标ContentOffset
 */
- (CGPoint)pageViewCellScrollViewContentOffset;

@end

