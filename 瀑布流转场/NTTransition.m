//
//  NTTransition.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/11.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTTransition.h"
#import "NTTransitionProtocol.h"
#import "UICollectionView+Extension.h"
#import "NTHorizontalPageViewController.h"

#define kWindowW [UIScreen mainScreen].bounds.size.width


static float animationDuration = 0.35;


@interface NTTransition ()

@property (nonatomic, assign) float animationScale;

@end

@implementation NTTransition

- (float)animationScale {
    if (_animationScale == 0) {
        _animationScale = kWindowW / (kWindowW*0.5-5.0);
    }
    return _animationScale;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *fromViewController = (UIViewController<NTTransitionProtocol, NTHorizontalPageViewControllerProtocol> *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController<NTTransitionProtocol> *toViewController = (UIViewController<NTTransitionProtocol> *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    
    UIView *containerView = [transitionContext containerView];
    
    if (_presenting) {
        UIView *toView = toViewController.view;
        [containerView addSubview:toView];
        toView.hidden = YES;
        
        UICollectionView *waterFallView = [toViewController transitionCollectionView];
        UICollectionView *pageView = [fromViewController transitionCollectionView];
        [waterFallView layoutIfNeeded];
        NSIndexPath *indexPath = [pageView fromPageIndexPath];
        
        UICollectionViewCell <NTTansitionWaterfallGridViewProtocol> *gridView = (UICollectionViewCell <NTTansitionWaterfallGridViewProtocol> *)[waterFallView cellForItemAtIndexPath:indexPath];
        CGPoint leftUpperPoint = [gridView convertPoint:CGPointZero toView:toViewController.view];
        
        UIView *snapShot = [gridView snapShotForTransition];
        snapShot.transform = CGAffineTransformMakeScale(self.animationScale, self.animationScale);
        
        CGFloat pullOffsetY = [fromViewController pageViewCellScrollViewContentOffset].y;
        CGFloat offsetY = fromViewController.navigationController.isNavigationBarHidden ? 0.0 : 64.0;
        
        CGRect frame = snapShot.frame;
        frame.origin = CGPointMake(0, -pullOffsetY + offsetY);
        snapShot.frame = frame;
        [containerView addSubview:snapShot];
        
        toView.hidden = NO;
        toView.alpha = 0;
        toView.transform = snapShot.transform;
        toView.frame = CGRectMake(-(leftUpperPoint.x * self.animationScale),  -((leftUpperPoint.y-offsetY) * self.animationScale+pullOffsetY+offsetY), toView.frame.size.width, toView.frame.size.height);
        
        UIView *whiteViewContainer = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        whiteViewContainer.backgroundColor = [UIColor whiteColor];
        [containerView addSubview:snapShot];
        [containerView insertSubview:whiteViewContainer belowSubview:toView];
        [UIView animateWithDuration:animationDuration animations:^{
            snapShot.transform = CGAffineTransformIdentity;
            snapShot.frame = CGRectMake(leftUpperPoint.x, leftUpperPoint.y, snapShot.frame.size.width, snapShot.frame.size.height);
            
            toView.transform = CGAffineTransformIdentity;
            toView.frame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
            toView.alpha = 1;
            
        } completion:^(BOOL finished) {
            if (finished) {
                [snapShot removeFromSuperview];
                [whiteViewContainer removeFromSuperview];
                [transitionContext completeTransition:YES];
            }
        }];
    } else {
        UIView *fromView = fromViewController.view;
        UIView *toVIew = toViewController.view;
        
        UICollectionView *waterFallView = [fromViewController transitionCollectionView];
        UICollectionView *pageView = [toViewController transitionCollectionView];
        [containerView addSubview:fromView];
        [containerView addSubview:toVIew];
        
        NSIndexPath *indexPath = [pageView toIndexPath];
        UICollectionViewCell <NTTansitionWaterfallGridViewProtocol> *gridView = (UICollectionViewCell <NTTansitionWaterfallGridViewProtocol> *)[waterFallView cellForItemAtIndexPath:indexPath];
        
        CGPoint leftUpperPoint = [gridView convertPoint:CGPointZero toView:nil];
        pageView.hidden = YES;
        [pageView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        CGFloat offsetY = fromViewController.navigationController.isNavigationBarHidden ? 0.0 : 64.0;
        CGFloat offsetStatuBar = fromViewController.navigationController.isNavigationBarHidden ? 0.0 : 20.0;
        UIView *snapShot = [gridView snapShotForTransition];
        [containerView addSubview:snapShot];
        CGRect frame = snapShot.frame;
        frame.origin = leftUpperPoint;
        snapShot.frame = frame;
        
        [UIView animateWithDuration:animationDuration animations:^{
            snapShot.transform = CGAffineTransformMakeScale(self.animationScale, self.animationScale);
            CGRect frame = snapShot.frame;
            frame = CGRectMake(0, offsetY, snapShot.frame.size.width, snapShot.frame.size.height);
            snapShot.frame = frame;
            NSLog(@"%@", NSStringFromCGRect(snapShot.frame));
            fromView.alpha = 0;
            fromView.transform = snapShot.transform;
            fromView.frame = CGRectMake(-(leftUpperPoint.x) * self.animationScale, -(leftUpperPoint.y-offsetStatuBar) * self.animationScale+offsetStatuBar, fromView.frame.size.width, fromView.frame.size.height);
            
        } completion:^(BOOL finished) {
            if (finished) {
                [snapShot removeFromSuperview];
                pageView.hidden = NO;
                fromView.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:YES];
            }
        }];

        
    }
}

@end
