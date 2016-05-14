//
//  SDTabBarController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTabBarController.h"
#import "SDHomepageViewController.h"
#import "SDCareViewController.h"
#import "SDRootNavigationController.h"

@interface SDTabBarController ()

@end

@implementation SDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControlle:[[SDHomepageViewController alloc] init] showTitle:NO same:YES title:@"home" barItemTitle:@"首页" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
    [self addChildViewControlle:[[SDCareViewController alloc] init] showTitle:YES same: YES title:@"Care" barItemTitle:@"关注" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
    [self addChildViewControlle:[[UIViewController alloc] init] showTitle:NO same:YES title:@"222" barItemTitle:@"three" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];

}
/**
 *  添加带有导航控制器的childViewController
 *
 *  @param viewController 将要添加的ViewController, 将为其增加导航控制器
 *  @param show           是否显示导航控制器顶部的title
 *  @param same           如果show=YES,导航控制器顶部的title是否与tabbarItem的title一致
 *  @param title          导航控制器的title
 *  @param barItemTitle   UITabBarItem的title
 *  @param image          UITabBarItem的image
 *  @param selectedImage  UITabbarItem的selectedImage
 */
- (void)addChildViewControlle:(nonnull UIViewController *)viewController showTitle:(BOOL)show same:(BOOL)same title:(nullable NSString *)title barItemTitle:(nonnull NSString *)barItemTitle image:(nonnull UIImage *)image selectedImage:(nonnull UIImage *)selectedImage{
    if (show && (title == nil || [title isEqualToString:@""])) {
        [NSException raise:@"TabBarController set excepition" format:@"The navigaitoncontroller's title cannot be nil because of you choosing show title"];
        return;
    }
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    SDRootNavigationController *nav =[[SDRootNavigationController alloc] initWithRootViewController:viewController];
    if (show) {
        if (same) {
            viewController.title = barItemTitle;
        }else{
            viewController.title = title;
            nav.tabBarItem.title = barItemTitle;
        }
    }else{
        nav.tabBarItem.title = barItemTitle;
    }
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
