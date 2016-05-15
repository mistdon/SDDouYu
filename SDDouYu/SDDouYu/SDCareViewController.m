//
//  SDCareViewController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDCareViewController.h"
#import "SDCustomButton.h"

@interface SDCareViewController ()

@end

@implementation SDCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SDCustomButton *button = [[SDCustomButton alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"更多" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"douyu"] forState:UIControlStateNormal];
    [self.view addSubview:button];
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
