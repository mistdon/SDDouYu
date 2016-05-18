//
//  SDTVNavigationView.h
//  SDDouYu
//
//  Created by shendong on 16/5/16.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SDTVNavigationViewItemClick)(NSInteger selectedIndex);


@interface SDTVNavigationView : UIScrollView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, assign) NSInteger selectedItemIndex;

@property (nonatomic, assign) CGFloat itemWidth;

@property (nonatomic, assign) CGFloat itemMargin;

+ (instancetype)TVNavigationViewWithItems:(nullable NSArray<NSString *>*)items itemSelected:(nullable SDTVNavigationViewItemClick)block;

- (void)scrollNavigaitonViewDidScroll:(CGFloat)offset;
@end

NS_ASSUME_NONNULL_END