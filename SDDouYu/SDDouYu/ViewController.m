//
//  ViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "ViewController.h"
#import "SDMultipleCornerView.h"
#import "SDBannerView.h"
#import "SDTVContainerViewController.h"
#import "SDHomefunHeaderView.h"
#import "SDGameCategoryModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *lable = [[UILabel alloc] init];
    lable.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    lable.text = @"1100";
    
    
    SDHomefunHeaderView *cornerView = [[SDHomefunHeaderView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 150)];
//    self.tableview.tableHeaderView  = cornerView;
//    [self.view addSubview:self.tableview];
    [self.view addSubview:cornerView];
    [HTTPRequest requestWithUrl:HTTPGetAllGameInfomaitons success:^(id successObject) {
        //        NSLog(@"succes =%@",successObject);
        NSArray *array1 = [SDGameCategoryModel mj_objectArrayWithKeyValuesArray:(NSArray *)successObject];
        NSMutableArray *headerData = [NSMutableArray array];
        for (SDGameCategoryModel *model in array1) {
            [headerData addObject:model];
            if (headerData.count > 12) {
                break;
            }
        }
        [cornerView bindDataWithModel:headerData selected:^(id object) {
            SDGameCategoryModel *model = (SDGameCategoryModel *)object;
            NSLog(@"object = %@",model.tag_name);
        }];
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    
    
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    SDTVChannel *channel = [[SDTVChannel alloc] init];
//    channel.tv_name = @"推荐";
//    SDTVChannel *channel1 = [[SDTVChannel alloc] init];
//    channel1.tv_name = @"游戏";
//    SDTVChannel *channel2 = [[SDTVChannel alloc] init];
//    channel2.tv_name = @"娱乐";
//    SDTVChannel *channel3 = [[SDTVChannel alloc] init];
//    channel3.tv_name = @"qipa";
//    NSArray *arr = @[channel, channel1, channel2, channel3];
//    NSMutableArray *mu = [NSMutableArray arrayWithCapacity:arr.count];
//    for (SDTVChannel *temp in arr) {
//        UITableViewController *vc = [[UITableViewController alloc] init];
//        vc.title = temp.tv_name;
//        vc.view.backgroundColor = [UIColor redColor];
//        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
//        lable.text = temp.tv_name;
//        lable.backgroundColor = [UIColor redColor];
//        [vc.view addSubview:lable];
//        [mu addObject:vc];
//    }
//    
//    SDTVContainerViewController *container = [SDTVContainerViewController TVContainterViewControllers:mu parentController:self];
//
    
    
    
    
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    tableview.delegate = self;
//    [self.view addSubview:tableview];
//    
//    SDBannerView *banner = [[SDBannerView alloc] initWithFrame:CGRectMake(0, 100, 375, 200)];
//    [banner setDatasource:@[[UIImage imageNamed:@"douyu"],[UIImage imageNamed:@"douyu"],[UIImage imageNamed:@"douyu"],[UIImage imageNamed:@"douyu"],[UIImage imageNamed:@"douyu"],[UIImage imageNamed:@"douyu"]]];
//    banner.pageType = PageControlPositionDownRight;
////    [self.view addSubview:banner];
//    tableview.tableHeaderView = banner;
    
//    SDCornerView *corner = [[SDCornerView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
//    [corner setLocalImage:[UIImage imageNamed:@"douyu"] text:@"shedn"];
////    [self.view addSubview:corner];
//
//    NSMutableArray *array = [NSMutableArray array];
//    for (NSInteger index = 0; index<30; index++) {
//        [array addObject:[NSString stringWithFormat:@"index = %lu",index]];
//    }
//    
//    SDMultipleCornerView *mu = [[SDMultipleCornerView alloc] initWithFrame:CGRectMake(0, 150, 375, 100)];
//    [mu setDatas:array selected:^(id object) {
//        NSLog(@"object = %@",object);
//    }];
//    mu.itemSize = CGSizeMake(50, 50);
//    [self.view addSubview:mu];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 150;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
