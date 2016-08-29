//
//  ViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDIndicatorView.h"
#import "SDNetworkService.h"
#import "SDNetworkServiceConsts.h"
#import "SDBaseLiveModel.h"
#import "SDBaseLiveViewModel.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[[SDNetworkService shared] requestFromNetWork:SD_me_RemindInfo params:nil] subscribeNext:^(NSDictionary  *result) {
//        NSLog(@"x = %@",result);
//    }];
    
   SDBaseLiveViewModel *viewModel =  [SDBaseLiveViewModel new];
    [[viewModel requestBaseLiveModel:SD_me_RemindInfo params:nil] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }];
}
- (void)call {
    NSLog(@"%s",__FUNCTION__);
}
- (void)list{
    NSLog(@"%s",__FUNCTION__);
}
- (void)emptyIndicatorViewTapped:(id)sender{
    NSLog(@"%s",__FUNCTION__);
}

- (void)errorIndicatorViewTapped:(id)sender{
    NSLog(@"%s",__FUNCTION__);
}
@end
