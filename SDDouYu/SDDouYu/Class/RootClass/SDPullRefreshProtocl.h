//
//  SDPullRefreshProtocl.h
//  SDDouYu
//
//  Created by 管理员 on 16/6/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SDHeaderRefreshStyle){
    SDHeaderRefreshStyleNormal = 1,
    SDHeaderRefreshStyleAnimationImage,
    SDHeaderRefreshStyleTime
};
typedef NS_ENUM(NSInteger,SDFooterRefreshStyle){
    SDFooterRefreshStyleNormal = 1,
    SDFooterRefreshStyleAnimationImage,
    SDFooterRefreshStyleTime
};
typedef void(^SDrefreshBlock)(void);

@protocol SDPullRefreshProtocl <NSObject>

@required
/**
 *  设置顶部刷新
 *
 *  @param style 顶部刷新样式
 *  @param block 顶部刷新状态时执行的block
 */
- (void)setUpMJRefreshHeaderStyle:(SDHeaderRefreshStyle)style block:(SDrefreshBlock)block;

/**
 *  开始顶部刷新
 */
- (void)beginHeaderRefreshing;
/**
 *  结束顶部刷新
 */
- (void)endHeaderRefreshing;
/**
 *  顶部刷新状态
 *
 *  @return 是否正在顶部刷新
 */
- (BOOL)isHeaderRefreshing;

@optional
/**
 *  设置底部刷新
 *
 *  @param style 底部刷新的样式
 *  @param block 底部刷新时执行的block
 */
- (void)setUpMJRefreshFooterStyle:(SDFooterRefreshStyle)style block:(SDrefreshBlock)block;
/**
 *  结束底部刷新
 */
- (void)beginFooterRefreshing;
/**
 *  结束顶部刷新
 */
- (void)endFooterRefreshing;
/**
 *  底部刷新状态
 *
 *  @return 是否正在底部刷新
 */
- (BOOL)isFooterRefreshing;
@end
