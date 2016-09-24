//
//  AppDelegate.m
//  SDDouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "AppDelegate.h"
#import "SDTabBarController.h"


//以下为测试文件，待删除
#import "ViewController.h"
#import "SDHomepageViewController.h"
#import "SDHomeFunViewController.h"
#import "SDHomeStrageViewController.h"
#import "CocoaLumberjack.h"
#import "SDLoginViewController.h"
#import "SDStoryboardLoader.h"
//static const DDLogLevel ddLogLevel = DDLogLevelVerbose;; //定义日志级别



#import "SDTool.h"
static NSString *const KGame_overwatch_icon_url = @"http://staticlive.douyutv.com//upload//game_cate//b659618441aa7051b9133ea77e50e30a.jpg";//守望先锋
static NSString *const KGame_WOW_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/a82a55473bd57ed1448eb95ba8571c50.jpg";//英雄联盟
static NSString *const KGame_How_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/193a80abb5f5c386c3b472ef2d42f680.jpg";//守望先锋
static NSString *const KGame_Dota2_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/bfe845a28fef8106cf645ed3b83aa375.jpg";//Dota2
static NSString *const KGame_CF_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/8d905023da11ddee5401440f0b7de9db.jpg";//穿越火线
static NSString *const KGame_SC_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/ac320c4f88e8615d4a84e851d1891971.jpg";//星际争霸
static NSString *const KGame_FTG_icon_url = @"http:\/\/staticlive.douyutv.com\/upload\/game_cate\/eeb5b0bef7a64ae39011e5be2bedf405.jpg";//格斗游戏
//static NSString *const KGame_overwatch_icon_url = @"http://staticlive.douyutv.com//upload//game_cate//b659618441aa7051b9133ea77e50e30a.jpg";//守望先锋


@interface AppDelegate ()

@end

@implementation AppDelegate

//在didfinish前获取,保证launchimage加载后及时显示
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions{
    
//    
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
    NSLog(@"home = %@",NSHomeDirectory());
    //延迟一秒执行,保证获取广告图即时显示出来
    BOOL test = NO;
    if (test) {
        sleep(1);
        NSInteger ok = 0;;
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
    
        if(ok){
           self.window.rootViewController = [[SDTabBarController alloc] init];
        }else{
            self.window.rootViewController = [ViewController new];
        }
        [self.window makeKeyAndVisible];
    }

    [self settingCocoaLumerJackLog]; //日志系统
    [self ConfigureLogInfomation];
    
    return YES;
}
#pragma mark - private mehtods -

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

/**
 *  设置日志输出系统
 */

- (void)settingCocoaLumerJackLog{
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    //File logger
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.maximumFileSize = 7;
    [DDLog addLogger:fileLogger];
}
/**
 *  定义打印日志
 */

- (void)ConfigureLogInfomation{
    [DDLog addLogger:[DDASLLogger sharedInstance]];  //apple system logs
    [DDLog addLogger:[DDTTYLogger sharedInstance]];  //Xcode console
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 *24; //24 hour rolling
    [DDLog addLogger:fileLogger];
}
@end
