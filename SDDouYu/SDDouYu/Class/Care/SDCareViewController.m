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
@property (nonatomic, copy) NSMutableArray *sources;
@end

@implementation SDCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SDCustomButton *button = [[SDCustomButton alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"更多" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"douyu"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.sources = [NSMutableArray array];
    
    
    NSString *showname = nil; //假设这是显示在lable上的数据
    NSMutableArray *data = [NSMutableArray arrayWithObjects:@"shen",@"dong",@"wang",nil];
    @try {
         showname= [data objectAtIndex:3];
    } @catch (NSException *exception) {
        showname = @"shendong";
        DDLogError(@"exception = %@", exception);
    } @finally {
        DDLogDebug(@"This is some debug thing");
        DDLogInfo(@"showname = %@",showname);
    }
    
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
