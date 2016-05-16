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

@interface SDTVContainerViewController : UIViewController

@property (nonatomic, strong) UIViewController *parentController;

+ (nullable instancetype)TVContainterViewControllers:(nonnull NSArray<UIViewController *> *)childs parentController:(nonnull UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END