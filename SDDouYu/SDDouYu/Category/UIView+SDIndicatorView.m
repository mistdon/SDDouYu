//
//  UIView+SDIndicatorView.m
//  SDDouYu
//
//  Created by shendong on 16/8/22.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "UIView+SDIndicatorView.h"
#import <objc/runtime.h>
#import "Masonry.h"
#import "BlocksKit+UIKit.h"
#import "SDIndicatorLoadingView.h"

static const void *initialLoadingIndicatorViewKey = &initialLoadingIndicatorViewKey;
static const void *emptyIndicatorViewKey          = &emptyIndicatorViewKey;
static const void *errorIndicatorViewKey          = &errorIndicatorViewKey;
static const void *stateKey                       = &stateKey;
static const void *delegateKey                    = &delegateKey;
static const void* errorSubjectKey                = &errorSubjectKey;

@implementation UIView (SDIndicatorView)

@dynamic initialLoadingIndicatorView;
@dynamic emptyIndicatorView;
@dynamic errorIndicatorView;
@dynamic indicatorState;
@dynamic indicatorDelegate;
#pragma setters and getters
- (void)setInitialLoadingIndicatorView:(UIView *)initialLoadingIndicatorView{
    objc_setAssociatedObject(self, initialLoadingIndicatorViewKey, initialLoadingIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setEmptyIndicatorView:(UIView *)emptyIndicatorView{
    objc_setAssociatedObject(self, emptyIndicatorViewKey, emptyIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setErrorIndicatorView:(UIView *)errorIndicatorView{
    objc_setAssociatedObject(self, errorIndicatorViewKey, errorIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setIndicatorDelegate:(id<SDIndicatorCategoryDelegate>)indicatorDelegate{
    objc_setAssociatedObject(self, delegateKey, indicatorDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (UIView *)initialLoadingIndicatorView{
    UIView *loadingView = objc_getAssociatedObject(self, initialLoadingIndicatorViewKey);
    if (!loadingView) {
        loadingView = [SDIndicatorLoadingView instanceXIBView];
        [self setInitialLoadingIndicatorView:loadingView];
    }
    return objc_getAssociatedObject(self, initialLoadingIndicatorViewKey);
}
- (UIView *)errorIndicatorView{
    return objc_getAssociatedObject(self, errorIndicatorViewKey);
}
- (UIView *)emptyIndicatorView{
    return objc_getAssociatedObject(self, emptyIndicatorViewKey);
}
- (SDIndicatorState)indicatorState{
    return [objc_getAssociatedObject(self, stateKey) integerValue];
}
- (id<SDIndicatorCategoryDelegate>)indicatorDelegate{
    return objc_getAssociatedObject(self, delegateKey);
}
- (void)setIndicatorState:(SDIndicatorState)indicatorState{
    if (indicatorState == self.indicatorState) return;
    objc_setAssociatedObject(self, stateKey, @(indicatorState), OBJC_ASSOCIATION_ASSIGN);
    switch (indicatorState) {
        case SDIndicatorStateInitial:
            [self initInitialLoading];
            break;
        case SDIndicatorStateEmpty:
            [self empty];
            break;
        case SDIndicatorStateError:
            [self error];
            break;
        case  SDIndicatorStateNormal:
            [self normal];
        default:
            break;
    }
}
- (void)initInitialLoading{
    [self addIndicatorViewAbove:[self initialLoadingIndicatorView] tag:0];
    [UIColor colorWithRed:1 green:1 blue:1 alpha:2];
}
- (void)addIndicatorViewAbove:(UIView *)view tag:(NSUInteger)tag{
    [self clearAllIndicatorViews];
    [self.superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    view.hidden = NO;
    self.hidden = YES;
    if (tag == 0 && self.indicatorDelegate) {
        [self.indicatorDelegate errorIndicatorViewTapped:view];
        UITapGestureRecognizer *tap = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            [self.indicatorDelegate errorIndicatorViewTapped:view];
        }];
        [view addGestureRecognizer:tap];
    }else if (tag == 2 && self.indicatorDelegate){
        UITapGestureRecognizer *tap = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            [self.indicatorDelegate emptyIndicatorViewTapped:view];
        }];
        [view addGestureRecognizer:tap];
    }
}
- (void)error{
    [self addIndicatorViewAbove:[self errorIndicatorView] tag:1];
}
- (void)empty{
    [self addIndicatorViewAbove:[self emptyIndicatorView] tag:2];
}
- (void)normal{
    [self clearAllIndicatorViews];
    self.hidden = NO;
}
- (void)clearAllIndicatorViews{
    if (self.initialLoadingIndicatorView && self.initialLoadingIndicatorView.superview) {
        [self.initialLoadingIndicatorView removeFromSuperview];
    }
    if (self.emptyIndicatorView && self.emptyIndicatorView.superview) {
        [self.emptyIndicatorView removeFromSuperview];
    }
    if (self.errorIndicatorView && self.errorIndicatorView.superview) {
        [self.errorIndicatorView removeFromSuperview];
    }
}
@end
