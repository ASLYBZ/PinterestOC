//
//  PlayVC.m
//  瀑布流转场
//
//  Created by 王卫亮 on 16/11/11.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "PlayVC.h"

@interface PlayVC ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
{
    
    __weak IBOutlet UIView *player;
    
    __weak IBOutlet UIButton *minimizeButton;
    __weak IBOutlet UITableView *tableView;
}


@property (nonatomic, strong) NSURL *link;

@end

@implementation PlayVC

- (NSURL *)link {
    if (_link == nil) {
        _link = [NSURL URLWithString:@"http://mexonis.com/video.json"];
    }
    return _link;
}


//  "http://mexonis.com/video.json"
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}













@end
