
//
//  SDHomeFunViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomeFunViewController.h"
#import "SDTableViewCellTypeTwo.h"
#import "SDHomeGameDetailViewController.h"
#import "SDMultipleCornerView.h"

static NSString *const kFunCellIdentifier = @"kFunCellIdentifier";

@interface SDHomeFunViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SDHomeFunViewController
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[SDTableViewCellTypeTwo class] forCellReuseIdentifier:kFunCellIdentifier];
    }
    return _tableview;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.tableview];
    
    SDMultipleCornerView *cornerView = [[SDMultipleCornerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    cornerView.itemSize = CGSizeMake(50, 50);
    cornerView.flowlayout.minimumInteritemSpacing = 0;
    cornerView.flowlayout.minimumLineSpacing = 0;
    self.tableview.tableHeaderView = cornerView;
    [self.view addSubview:self.tableview];
    
    
    [HTTPRequest requestWithUrl:HTTPGetAllFunInfomaitons success:^(id successObject) {
        if (successObject) {
            for (NSDictionary *info in (NSArray *)successObject) {
                SDChannelSubModel *model = [SDChannelSubModel recomendViewModelWithKeysAndValues:info];
                [self.dataArray addObject:model];
            }
            //            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableview reloadData];
        };;
    } fail:^(id failObject, NSError *error) {
        ;
    }];
}
#pragma mark - UICollectionViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SDTableViewCellTypeTwo *cellTwo = [tableView dequeueReusableCellWithIdentifier:kFunCellIdentifier];
    [cellTwo configureChannelCell:self.dataArray[indexPath.row] more:^(NSString *title) {
        NSLog(@"title = %@",title);;
    } selected:^(SDBaseLiveModel *model) {
        NSLog(@"nickname = %@",model.nickname);
        SDHomeGameDetailViewController *live = [[SDHomeGameDetailViewController alloc] initWithLive:model];
        live.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController: live animated:YES];
    }];
    return cellTwo;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_WIDTH;
}

@end
