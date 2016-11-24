//
//  NavigationControllerDelegate.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/11.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NTTransitionProtocol.h"
#import "NTTransition.h"

@interface NavigationControllerDelegate ()



@end


@implementation NavigationControllerDelegate


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    
    UIViewController<NTTransitionProtocol> *fromVCConfromA = (UIViewController<NTTransitionProtocol> *)fromVC;
    UIViewController<NTTransitionProtocol, NTWaterFallViewControllerProtocol> *fromVCConfromB = (UIViewController<NTTransitionProtocol, NTWaterFallViewControllerProtocol> *)fromVC;
    UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *fromVCConfromC = (UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *)fromVC;
    
    UIViewController<NTTransitionProtocol> *toVCConfromA = (UIViewController<NTTransitionProtocol> *)toVC;
    UIViewController<NTTransitionProtocol, NTWaterFallViewControllerProtocol> *toVCConfromB = (UIViewController<NTTransitionProtocol, NTWaterFallViewControllerProtocol> *)toVC;
    UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *toVCConfromC = (UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *)toVC;
    
    if((fromVCConfromA != nil)&&(toVCConfromA != nil)&&(
                                                        (fromVCConfromB != nil && toVCConfromC != nil)||(fromVCConfromC != nil && toVCConfromB != nil))){
        NTTransition *transition = [[NTTransition alloc] init];
        transition.presenting = operation == UINavigationControllerOperationPop;
        
        return transition;
    }else{
        return nil;
    }
}


@end
