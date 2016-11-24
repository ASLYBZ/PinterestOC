//
//  NTWaterfallViewCell.h
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/23.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTTransitionProtocol.h"

@interface NTWaterfallViewCell : UICollectionViewCell <NTTansitionWaterfallGridViewProtocol>

@property (nonatomic, strong) NSString *iamgeName;
@property (nonatomic, strong) UIImageView *imageViewContent;


@end
