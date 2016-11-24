//
//  NTTableViewCell.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTTableViewCell.h"

@implementation NTTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImageView *imageV = self.imageView;
    imageV.frame = CGRectZero;
    if (imageV.image != nil) {
        CGFloat imageHeight = self.imageView.image.size.height*[UIScreen mainScreen].bounds.size.width/self.imageView.image.size.width;
        self.imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, imageHeight);
    }
}

@end
