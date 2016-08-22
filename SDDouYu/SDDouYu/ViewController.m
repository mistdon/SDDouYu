//
//  ViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDIndicatorView.h"
#import "SDIndicatorCategoryDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 500) style:UITableViewStylePlain];
    tableview.indicatorDelegate = self;
    [self.view addSubview:tableview];
    [tableview setIndicatorState:SDIndicatorStateInitial];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableview setIndicatorState:SDIndicatorStateNormal];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableview setIndicatorState:SDIndicatorStateEmpty];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableview setIndicatorState:SDIndicatorStateError];
    });
}
- (void)emptyIndicatorViewTapped:(id)sender{
    NSLog(@"%s",__FUNCTION__);
}

- (void)errorIndicatorViewTapped:(id)sender{
    NSLog(@"%s",__FUNCTION__);
}
@end
