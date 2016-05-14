//
//  SDHomeGameDetailViewController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomeGameDetailViewController.h"

@interface SDHomeGameDetailViewController ()

@end

@implementation SDHomeGameDetailViewController

- (instancetype)init{
    return [self initWithLive:[SDBaseLiveModel new]];
}
- (instancetype)initWithLive:(SDBaseLiveModel *)livemodel{
    if (self = [super init]) {
        _liveModel = livemodel;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"nickname =%@",self.liveModel.nickname);
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
