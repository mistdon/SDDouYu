//
//  SDTVNavigationView.m
//  SDDouYu
//
//  Created by shendong on 16/5/16.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTVNavigationView.h"

//static CGFloat const kMargin = 10;
//static CGFloat const kItemWidth = 50;
static CGFloat const kItemHeight = 50;

@interface SDTVNavigationView()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIButton *selectedItem;

@property (nonatomic, copy) SDTVNavigationViewItemClick clickedBlcok;

@end
@implementation SDTVNavigationView
+ (instancetype)TVNavigationViewWithItems:(nullable NSArray<NSString *> *)items itemSelected:(nullable SDTVNavigationViewItemClick)block{
    SDTVNavigationView *navigaitonView = [[SDTVNavigationView alloc] init];
    navigaitonView.buttons             = [NSMutableArray arrayWithCapacity:items.count];
    navigaitonView.clickedBlcok        = block;
    navigaitonView.items               = items;
    navigaitonView.scrollsToTop        = NO;
    return navigaitonView;
}
- (instancetype)init{
    if (self = [super init]) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator   = NO;
        self.backgroundColor                = [UIColor whiteColor];
    }
    return self;
}
- (void)setItems:(NSArray *)items{
    _items = items;
    for (NSInteger index = 0; index < items.count; index++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:items[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor greenColor];
        [button bk_addEventHandler:^(id sender) {
            NSLog(@"sender = %@",sender);
        } forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self addSubview:button];
        button.tag = index;
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger index = 0; index < self.buttons.count; index++) {
        UIButton *button = [self.buttons objectAtIndex:index];
        CGFloat itemX = self.itemMargin + self.itemWidth * index;
        button.frame = CGRectMake(itemX, 0, self.itemWidth, kItemHeight);
    }
    self.contentSize = CGSizeMake(self.itemWidth * self.buttons.count + self.itemWidth * 2, kItemHeight);
}

@end
