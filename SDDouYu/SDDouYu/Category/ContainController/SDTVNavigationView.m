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
            [weakself itemClick:button];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self addSubview:button];
        button.tag = index;
    }
}
- (void)itemClick:(UIButton *)sender{
    if ([sender isEqual:self.selectedItem]) return;
    self.selectedItem.selected = NO;
    sender.selected = YES;
    if (self.clickedBlcok) {
        self.clickedBlcok(sender.tag);
    }
//    CGFloat offsetX = sender.center.x - self.center.x;
//    if (offsetX < 0) {
//        self.contentOffset = CGPointMake(0, 0);
////        [self setContentOffset:CGPointMake(0, 0) animated:YES];
//    }else if (offsetX > (self.contentSize.width - self.bounds.size.width)){
//        self.contentOffset = CGPointMake(self.contentSize.width - self.bounds.size.width, 0);
//    }else{
//        self.contentOffset = CGPointMake(offsetX, 0);
////        [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
//    }
    self.selectedItem = sender;
    __weak typeof(self)weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakself.BottomLine.center = CGPointMake(sender.center.x, weakself.BottomLine.center.y);;
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger index = 0; index < self.buttons.count; index++) {
        UIButton *button = [self.buttons objectAtIndex:index];
        CGFloat itemX = self.itemMargin + self.itemWidth * index;
        button.frame = CGRectMake(itemX, 0, self.itemWidth, SDTVNavigationViewItemHeight);
    }
    self.BottomLine.frame = CGRectMake(0, SDTVNavigationViewItemHeight - 3, self.frame.size.width/self.items.count, 3);
    [self bringSubviewToFront:self.BottomLine];
    self.contentSize = CGSizeMake(self.itemWidth * self.buttons.count + self.itemWidth * 2, SDTVNavigationViewItemHeight);
}
- (void)setContentOffset:(CGPoint)contentOffset{
    [UIView animateWithDuration:0.25f animations:^{
        [super setContentOffset:contentOffset];
    }];
}
- (void)scrollNavigaitonViewDidScroll:(CGFloat)offset{
//    NSLog(@"offset = %lf",offset);
    if (offset * SCREEN_WIDTH < SCREEN_WIDTH/4 || offset * SCREEN_WIDTH > (SCREEN_WIDTH * 3 /4 )) {
        return;
    }
    
    self.BottomLine.center = CGPointMake(offset * SCREEN_WIDTH, self.BottomLine.center.y);

}
- (void)setSelectedItemIndex:(NSInteger)selectedItemIndex{
    _selectedItemIndex = selectedItemIndex;
    UIButton *item = self.buttons[selectedItemIndex];
    [self itemClick:item];
}
@end
