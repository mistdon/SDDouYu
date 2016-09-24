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
#import "SDHomeViewController.h"
#import "YYFPSLabel.h"
#import "Masonry.h"

@interface SDTabBarController ()
@property (nonatomic,strong) YYFPSLabel *fpslabel;
@end

@implementation SDTabBarController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.selectedIndex = 3;
    
    self.fpslabel                 = [[YYFPSLabel alloc] init];
    self.fpslabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.fpslabel];
    [self.fpslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(5);
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
//    [self addChildViewControlle:[[SDHomeViewController alloc] init] showTitle:NO same:YES title:@"home" barItemTitle:@"首页" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
//    [self addChildViewControlle:[[SDCareViewController alloc] init] showTitle:YES same: YES title:@"Care" barItemTitle:@"关注" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
//    [self addChildViewControlle:[[UIViewController alloc] init] showTitle:NO same:YES title:@"222" barItemTitle:@"three" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
//    UIViewController *meVC  =[[UIStoryboard storyboardWithName:@"Me" bundle:nil] instantiateInitialViewController];
//    meVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"icon_mine"] selectedImage:[UIImage imageNamed:@"icon_mine_selected"]];
//    [self addChildViewController:meVC];
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
