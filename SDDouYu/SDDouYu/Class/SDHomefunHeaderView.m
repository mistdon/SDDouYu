//
//  SDHomefunHeaderView.m
//  SDDouYu
//
//  Created by shendong on 16/5/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomefunHeaderView.h"
#import "SDMultipleCornerView.h"

@interface SDHomefunHeaderView ()

@property (nonatomic, strong) SDMultipleCornerView *cornerView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation SDHomefunHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _cornerView                = [[SDMultipleCornerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 10)];
        _pageControl               = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-10, frame.size.width, 10)];
        _pageControl.numberOfPages = 2;
        [self addSubview:_cornerView];
        [self addSubview:_pageControl];
    }
    return self;
}
- (void)bindDataWithModel:(NSArray *)model selected:(void (^)(id))selectedBlock{
    [self.cornerView setDatas:model selected:^(id object) {
        selectedBlock(object);
    }];
}

@end
