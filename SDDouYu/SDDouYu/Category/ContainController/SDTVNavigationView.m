//
//  SDTVNavigationView.m
//  SDDouYu
//
//  Created by shendong on 16/5/16.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTVNavigationView.h"

@interface SDTVNavigationView()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIButton *selectedItem;
@property (nonatomic, strong) UIView *BottomLine;

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
        self.BottomLine = [[UIView alloc] init];
        self.BottomLine.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.BottomLine];
    }
    return self;
}
- (void)setItems:(NSArray *)items{
    _items = items;
    for (NSInteger index = 0; index < items.count; index++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:items[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        __weak typeof(self)weakself = self;
        [button bk_addEventHandler:^(id sender) {
            NSLog(@"sender = %@",items[index]);
            [UIView animateWithDuration:0.2 animations:^{
                CGRect frame = weakself.BottomLine.frame;
                frame = CGRectMake(frame.size.width * index, frame.origin.y, frame.size.width, frame.size.height);
                weakself.BottomLine.frame = frame;;
            }];
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
        button.frame = CGRectMake(itemX, 0, self.itemWidth, SDTVNavigationViewItemHeight);
    }
    NSLog(@"size = %@",NSStringFromCGRect(CGRectMake(0, SDTVNavigationViewItemHeight - 3, self.frame.size.width/self.items.count, 3)));
    self.BottomLine.frame = CGRectMake(0, SDTVNavigationViewItemHeight - 3, self.frame.size.width/self.items.count, 3);
    [self bringSubviewToFront:self.BottomLine];
    self.contentSize = CGSizeMake(self.itemWidth * self.buttons.count + self.itemWidth * 2, SDTVNavigationViewItemHeight);
}

@end
