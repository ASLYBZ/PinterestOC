//
//  NavVC.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/11.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NavVC.h"
#import "PlayVC.h"

#define kWindowsW [UIScreen mainScreen].bounds.size.width
#define kWindowsH [UIScreen mainScreen].bounds.size.height

@interface NavVC ()

@property (nonatomic, strong) PlayVC *playVC;
@property (nonatomic, assign) CGPoint hiddenOrigin;
@property (nonatomic, assign) CGPoint minimizedOrigin;
@property (nonatomic, assign) CGPoint fullScreenOrigin;
@property (nonatomic, strong) UIView *statusView;


@end

@implementation NavVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.hiddenOrigin = CGPointMake(kWindowsW, kWindowsH * 9/32 - 10);
    self.minimizedOrigin = CGPointMake(kWindowsW * 0.5 - 10, kWindowsH * 9/32 - 10);
    self.fullScreenOrigin = CGPointMake(0, 0);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIView *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self.statusView];
    [wind addSubview:self.playVC.view];
}

- (PlayVC *)playVC {
    if (self.playVC == nil) {
        PlayVC *playVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PlayVC"];
        _playVC = playVC;
        playVC.view.frame = CGRectMake(self.hiddenOrigin.x, self.hiddenOrigin.y, kWindowsW, kWindowsH);
//        playVC.delegate = self;
    }
    return _playVC;
}

- (UIView *)statusView {
    if (self.statusView == nil) {
        _statusView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].statusBarFrame];
        _statusView.backgroundColor = [UIColor blackColor];
        _statusView.alpha = 0.5;
    }
    return _statusView;
}

- (void)animatePlayView:(stateOfVC)toState {
    switch (toState) {
        case fullScreen: {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                
                CGRect frame = self.playVC.view.frame;
                frame.origin = self.fullScreenOrigin;
                self.playVC.view.frame = frame;
            } completion:^(BOOL finished) {
                
            } ];
            break;
        }
            
        case minimized: {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.playVC.view.frame;
                frame.origin = self.minimizedOrigin;
                self.playVC.view.frame = frame;
            }];
            break;
        }
            
        case hidden: {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.playVC.view.frame;
                frame.origin = self.hiddenOrigin;
                self.playVC.view.frame = frame;
            }];
        }
        default:
            break;
    }
}

- (CGPoint)positionDuringSwipe:(CGFloat)scaleFactor {
    CGFloat width = kWindowsW * 0.5 * scaleFactor;
    CGFloat height = width * 9 / 16;
    CGFloat x = (kWindowsW - 10) * scaleFactor - width;
    CGFloat y = (kWindowsH - 10) * scaleFactor - height;
    return CGPointMake(x, y);
 }































@end
