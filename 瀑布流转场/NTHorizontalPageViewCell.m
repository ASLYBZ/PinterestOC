//
//  NTHorizontalPageViewCell.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NTHorizontalPageViewCell.h"
#import "NTTableViewCell.h"

static NSString *cellIdentify = @"cellIdentify";

@interface NTHorizontalPageViewCell ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NTHorizontalPageViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [self.contentView addSubview:self.tableView];
        [self.tableView registerClass:[NTTableViewCell class] forCellReuseIdentifier:cellIdentify];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    cell.imageView.image = nil;
    cell.textLabel.text = nil;
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:self.imageName];
    } else {
        cell.textLabel.text = @"123456789098765432123456789098765432123456789";
    }
    [cell setNeedsLayout];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIImage *image = [UIImage imageNamed:self.imageName];
        CGFloat height = image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width;
        return height;
    }
    return 64;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.y < 64) {
//        if (self.pullAction) {
//             self.pullAction(scrollView.contentOffset);
//        }
//    }
}


@end
