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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
