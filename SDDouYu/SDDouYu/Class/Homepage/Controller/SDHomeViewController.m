//
//  SDHomeViewController.m
//  SDDouYu
//
//  Created by Allen on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomeViewController.h"
#import "SDTVContainerViewController.h"
#import "SDHomepageViewController.h"
#import "SDHomegameViewController.h"
#import "SDHomeFunViewController.h"
#import "SDHomeStrageViewController.h"

@interface SDHomeViewController ()

@end

@implementation SDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SDTVChannel *channel = [[SDTVChannel alloc] init];
    channel.tv_name = @"推荐";
    SDTVChannel *channel1 = [[SDTVChannel alloc] init];
    channel1.tv_name = @"游戏";
    SDTVChannel *channel2 = [[SDTVChannel alloc] init];
    channel2.tv_name = @"娱乐";
    SDTVChannel *channel3 = [[SDTVChannel alloc] init];
    channel3.tv_name = @"奇葩";
    NSArray *arr = @[channel, channel1, channel2, channel3];
    NSMutableArray *mu = [NSMutableArray arrayWithCapacity:arr.count];

    NSArray *classarray = @[@"SDHomepageViewController",@"SDHomegameViewController",@"SDHomeFunViewController",@"SDHomeStrageViewController"];
    
    for (NSInteger index = 0; index < classarray.count; index++) {
        UIViewController *vc = [[NSClassFromString((NSString *)classarray[index]) alloc] init];
        SDTVChannel *channel = arr[index];
        vc.title =channel.tv_name;
        [mu addObject:vc];
    }
    
    
    
    SDTVContainerViewController *container = [SDTVContainerViewController TVContainterViewControllers:mu parentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
