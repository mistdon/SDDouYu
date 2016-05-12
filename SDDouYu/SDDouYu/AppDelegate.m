//
//  AppDelegate.m
//  SDDouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//在didfinish前获取,保证launchimage加载后及时显示
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions{
    [HTTPRequest requestWithUrl:HTTPGetBrandCastInfo success:^(id successObject) {
        NSArray *infos = (NSArray *)successObject;
        if (infos.count == 0) {
            return ;
        }else if (infos.count == 1){
            NSDictionary *object = infos[0];
            [self showBrandcastInfomationImageView:object[@"url"] timeinterval:[object[@"showtime"] doubleValue]];
        }
        //todo  当有多条广告图时的处理方式
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

/**
 *  展示首页
 */
- (void)showBrandcastInfomationImageView:(NSString *)imageurl timeinterval:(NSTimeInterval)time{
    UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [imageview sd_setImageWithURL:[NSURL URLWithString:imageurl]];
    [[UIApplication sharedApplication].keyWindow addSubview:imageview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imageview removeFromSuperview];
    });
}
@end
