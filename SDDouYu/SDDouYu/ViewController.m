//
//  ViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *headerB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [self.view addSubview:headerB];
    UIButton *callButton = [[UIButton alloc] init];
    callButton.layer.cornerRadius = 3;
    callButton.layer.masksToBounds = YES;
    callButton.backgroundColor = [UIColor greenColor];
    [callButton setTitle:@"Call" forState:UIControlStateNormal];
    [headerB addSubview:callButton];
    [callButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerB.mas_left).with.offset(10);
        make.top.equalTo(headerB.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    
    UIButton *listButton = [[UIButton alloc] init];
    listButton.layer.cornerRadius = 3;
    listButton.layer.masksToBounds = YES;
    listButton.backgroundColor = [UIColor redColor];
    [headerB addSubview:listButton];
    [listButton setTitle:@"List" forState:UIControlStateNormal];
    [listButton addTarget:self action:@selector(list) forControlEvents:UIControlEventTouchUpInside];
    [listButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerB.mas_right).with.offset(-10);
        make.top.equalTo(headerB.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    
//    self.view.backgroundColor = [UIColor lightTextColor];
//    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 500) style:UITableViewStylePlain];
//    tableview.indicatorDelegate = self;
//    [self.view addSubview:tableview];
//    [tableview setIndicatorState:SDIndicatorStateInitial];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [tableview setIndicatorState:SDIndicatorStateNormal];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [tableview setIndicatorState:SDIndicatorStateEmpty];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [tableview setIndicatorState:SDIndicatorStateError];
//    });
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
