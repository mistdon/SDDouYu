//
//  SDRootViewController.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>


FOUNDATION_EXPORT CGFloat const SDUIViewControllerChannelViewHeight;
FOUNDATION_EXPORT CGFloat const SDUIViewControllerNavigationBarHeight;
FOUNDATION_EXPORT CGFloat const SDUIViewControllerTabBarHeight;

@interface SDRootViewController : UIViewController

@property (nonatomic, readonly, assign) BOOL haveSubViewsCanBehaveRefresh;

- (void)ConfigureNavigationBarButtonItems;

@end
