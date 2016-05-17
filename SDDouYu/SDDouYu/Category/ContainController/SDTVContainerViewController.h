//
//  SDTVContainerViewController.h
//  SDDouYu
//
//  Created by shendong on 16/5/16.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDTVChannel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol SDTVContainerViewProtocal <NSObject>

- (void)containerViewDidScroll:(CGFloat )offsetScale;

@end

@interface SDTVContainerViewController : UIViewController

@property (nonatomic, strong) UIViewController *parentController;

@property (nonatomic, weak) id<SDTVContainerViewProtocal> delegate;

+ (nullable instancetype)TVContainterViewControllers:(NSArray<UIViewController *> *)childs parentController:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END