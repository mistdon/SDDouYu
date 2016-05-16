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
    SDHomepageViewController *home = [[SDHomepageViewController alloc] init];
    home.title = channel.tv_name;
    [mu addObject:home];
    for (NSInteger index1 = 0;index1 < arr.count; index1++) {
        SDTVChannel *temp = arr[index1];
        if (index1 > 0) {
            UIViewController *vc = [[UIViewController alloc] init];
            vc.title = temp.tv_name;
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
            lable.text = temp.tv_name;
            lable.backgroundColor = [UIColor redColor];
            [vc.view addSubview:lable];
            [mu addObject:vc];
        }
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
