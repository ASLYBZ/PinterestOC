//
//  UICollectionView+Extension.h
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Extension)
/**
 *  设置某一indexPath，用于记录
 *
 *  @param indexPath 目标indexPath
 */
- (void)setToIndexPath:(NSIndexPath *)indexPath;

/**
 *  获取上述方法某一indexPath，把记录起来的拿回来用
 *
 *  @return 返回记录的indexPath
 */
- (NSIndexPath *)toIndexPath;

- (NSIndexPath *)fromPageIndexPath;


@end
