//
//  NTWaterfallViewCell.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTWaterfallViewCell.h"

@implementation NTWaterfallViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageViewContent = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:self.imageViewContent];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageViewContent.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.imageViewContent.image = [UIImage imageNamed:self.iamgeName];
}

- (UIView *)snapShotForTransition {
    UIImageView *snapShotView = [[UIImageView alloc] initWithImage:self.imageViewContent.image];
    snapShotView.frame = self.imageViewContent.frame;
    return snapShotView;
}




@end
