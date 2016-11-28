//
//  NTNavigationController.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTNavigationController.h"
#import "NTTransitionProtocol.h"
#import "UICollectionView+Extension.h"

@interface NTNavigationController ()

@end

@implementation NTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    NSInteger childrenCount = self.viewControllers.count;
    
    UIViewController <NTTransitionProtocol, NTWaterFallViewControllerProtocol> *toViewController = (UIViewController <NTTransitionProtocol, NTWaterFallViewControllerProtocol> *)self.viewControllers[childrenCount - 2];
    UICollectionView *toView = [toViewController transitionCollectionView];
    
    UIViewController *popedViewController = self.viewControllers[childrenCount - 1];
    UICollectionView *popView  = [popedViewController valueForKey:@"collectionView"];
    NSIndexPath *indexPath = [popView fromPageIndexPath];
    [toViewController viewWillAppearWithPageIndex:indexPath.row];
    [toView setToIndexPath:indexPath];
    
    return [super popViewControllerAnimated:animated];
}



@end
