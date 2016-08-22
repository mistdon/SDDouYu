//
//  UIView+SDIndicatorView.h
//  SDDouYu
//
//  Created by shendong on 16/8/22.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDIndicatorCategoryDelegate.h"

typedef NS_ENUM(NSInteger, SDIndicatorState){
    SDIndicatorStateStateNone,
    SDIndicatorStateInitial,
    SDIndicatorStateEmpty,
    SDIndicatorStateError,
    SDIndicatorStateNormal,
};
@interface UIView (SDIndicatorView)

@property (nonatomic, strong) UIView *initialLoadingIndicatorView;
@property (nonatomic, strong) UIView *emptyIndicatorView;
@property (nonatomic, strong) UIView *errorIndicatorView;
@property (nonatomic, assign) SDIndicatorState indicatorState;
@property (nonatomic, weak) id<SDIndicatorCategoryDelegate> indicatorDelegate;

@end
