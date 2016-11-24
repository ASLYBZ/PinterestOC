//
//  PlayVC.h
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/11.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(int, stateOfVC) {
    minimized,
    fullScreen,
    hidden
};

@protocol PlayerVCDelegate <NSObject>

- (void)didMinimize;
- (void)didmaximize;
- (void)swipeToMinimize:(CGFloat)translation theToState:(stateOfVC)toState;
- (void)didEndedSwipe:(stateOfVC)toState;


@end

@interface PlayVC : UIViewController

@property (nonatomic, weak) id <PlayerVCDelegate> delegate;

@end
