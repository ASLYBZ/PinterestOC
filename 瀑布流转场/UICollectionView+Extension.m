//
//  UICollectionView+Extension.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "UICollectionView+Extension.h"
#import <objc/runtime.h>

static NSString * const kIndexPathPointer = @"kIndexPathPointer";
@implementation UICollectionView (Extension)

- (void)setToIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, &kIndexPathPointer, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)toIndexPath {
    NSInteger index = self.contentOffset.x / self.frame.size.width;
    
    NSIndexPath *indexPath = objc_getAssociatedObject(self, &kIndexPathPointer);
    if (index > 0) {
        return [NSIndexPath indexPathForRow:index inSection:0];
    } else if (indexPath) {
        return indexPath;
    } else {
        return [NSIndexPath indexPathForRow:0 inSection:0];
    }
}

- (NSIndexPath *)fromPageIndexPath {
    int index = (int)(self.contentOffset.x/self.frame.size.width);
    return [NSIndexPath indexPathForRow:index inSection:0];
}


@end
