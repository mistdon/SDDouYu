//
//  SDTabBarController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTabBarController.h"

@interface SDTabBarController ()

@end

@implementation SDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *array = @[@"首页",@"关注"];
    for (NSInteger index = 0; index < self.viewControllers.count; index++) {
        UIViewController *vc = [self.viewControllers objectAtIndex:index];
        vc.tabBarItem.title = array[index];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
