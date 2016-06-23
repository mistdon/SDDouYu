//
//  SDRootViewController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDRootViewController.h"
#import "MJRefresh.h"

CGFloat const SDUIViewControllerChannelViewHeight   = 44;
CGFloat const SDUIViewControllerNavigationBarHeight = 64;
CGFloat const SDUIViewControllerTabBarHeight        = 49;


@interface SDRootViewController ()

@end

@implementation SDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor                 = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _haveSubViewsCanBehaveRefresh = NO;
    // Do any additional setup after loading the view.
    
    for (UIView *view in self.view.subviews) {
        if ([view isMemberOfClass:[UIScrollView class]] ||
            [view isMemberOfClass:[UITableView class]] ||
            [view isMemberOfClass:[UICollectionView class]]||
            [view isMemberOfClass:[UIWebView class]]) {
            _haveSubViewsCanBehaveRefresh = YES;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)ConfigureNavigationBarButtonItems{
    //do something is subclass
}

@end
