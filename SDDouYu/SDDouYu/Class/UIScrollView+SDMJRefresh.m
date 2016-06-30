//
//  UIScrollView+SDMJRefresh.m
//  SDDouYu
//
//  Created by 管理员 on 16/6/23.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "UIScrollView+SDMJRefresh.h"
#import "MJRefresh.h"

@implementation UIScrollView (SDMJRefresh)
- (void)setUpMJRefreshHeaderStyle:(SDHeaderRefreshStyle)style block:(SDrefreshBlock)block{
    if (style == SDHeaderRefreshStyleNormal) {
        MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            block();
        }];
        self.mj_header = normalHeader;
    }
}
- (void)setUpMJRefreshFooterStyle:(SDFooterRefreshStyle)style block:(SDrefreshBlock)block{
    if (style == SDFooterRefreshStyleNormal) {
        MJRefreshAutoNormalFooter *normalFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            block();
        }];
        self.mj_footer = normalFooter;
    }
}
- (void)beginHeaderRefreshing{
    DDLogInfo(@"开始顶部刷新");
    [self.mj_header beginRefreshing];
}
- (void)endHeaderRefreshing{
    DDLogInfo(@"结束顶部刷新");
    [self.mj_header endRefreshing];
}
- (BOOL)isHeaderRefreshing{
    return [self.mj_header isRefreshing];
}
- (void)beginFooterRefreshing{
    DDLogInfo(@"开始底部刷新");
    [self.mj_footer beginRefreshing];
}
- (void)endFooterRefreshing{
    DDLogInfo(@"结束底部刷新");
    [self.mj_footer endRefreshing];
}
- (BOOL)isFooterRefreshing{
    return [self.mj_footer isRefreshing];
}
@end
