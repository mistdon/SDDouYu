//
//  SDHomepageHeaderView.m
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageHeaderView.h"
#import "SDBannerView.h"
#import "SDMultipleCornerView.h"

static CGFloat const kHeaderViewScale = 0.6;

@interface SDHomepageHeaderView()

@property (nonatomic, strong) SDBannerView *bannerView;
@property (nonatomic, strong) SDMultipleCornerView *downstairsView;
@end
@implementation SDHomepageHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor                      = [UIColor whiteColor];
        _bannerView                               = [[SDBannerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * kHeaderViewScale)];
        NSLog(@"size = %@",NSStringFromCGRect(CGRectMake(0, 0, frame.size.width, frame.size.height * kHeaderViewScale)));
        _bannerView.pageType                      = PageControlPositionDownRight;
        _bannerView.pageIndicatorTintColor        = [UIColor lightGrayColor];
        _bannerView.currentPageIndicatorTintColor = [UIColor orangeColor];
        _downstairsView = [[SDMultipleCornerView alloc] initWithFrame:CGRectMake(0, frame.size.height * kHeaderViewScale, frame.size.width, frame.size.height * (1 - kHeaderViewScale))];
        _downstairsView.itemSize = CGSizeMake(frame.size.height*(1- kHeaderViewScale), frame.size.height*(1- kHeaderViewScale));
        [self addSubview:_bannerView];
        [self addSubview:_downstairsView];
    }
    return self;
}
- (void)configureBannerViews:(NSArray *)resources selectAction:(selectedItemBlock)completion{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *info in resources) {
        if (info &&  info[@"pic_url"]) {
            [array addObject:info[@"pic_url"]];
        }
    }
    //todo
    self.bannerView.datasource = array;
    [self.bannerView setCurrentIndexDidTap:^(NSInteger currentIndex) {
        completion(resources[currentIndex]);
    }];
}
- (void)configureGames:(NSArray *)games selected:(selectedMultipleBlock)selectedHander{
    [self.downstairsView setDatas:games selected:^(id object) {
        selectedHander(object);
    }];
}

@end
