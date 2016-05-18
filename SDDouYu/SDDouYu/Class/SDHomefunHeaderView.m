//
//  SDHomefunHeaderView.m
//  SDDouYu
//
//  Created by shendong on 16/5/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomefunHeaderView.h"
#import "SDMultipleCornerView.h"

@interface SDHomefunHeaderView ()<SDMultipleCornerViewDelegate>

@property (nonatomic, strong) SDMultipleCornerView *cornerView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation SDHomefunHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s,%@",__FUNCTION__,NSStringFromCGRect(frame));
        _cornerView                = [[SDMultipleCornerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 15)];
        _cornerView.collectionView.pagingEnabled = YES;
        _cornerView.collectionView.showsHorizontalScrollIndicator = NO;
        _cornerView.delegate = self;
        [_cornerView setItemSize:CGSizeMake(SCREEN_WIDTH/4, (frame.size.height-15)/2)];
        _pageControl               = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-15, frame.size.width, 15)];
        _pageControl.numberOfPages = 2;
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
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
- (void)sdmultipleCornerViewDidScroll:(NSInteger)index{
    self.pageControl.currentPage = index;
}
@end
