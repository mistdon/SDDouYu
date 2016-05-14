//
//  SDHomepageViewController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageViewController.h"

#import "SDHomepageTableViewCell.h"
#import "SDTableViewCellTypeTwo.h"

#import "SDHomepageViewModel.h"
#import "SDHomeGameDetailViewController.h"
#import "SDHomepageHeaderView.h"
#import "SDHomepageDataSource.h"

static NSString *const cellIdentifierOne = @"cellIdentifierOne";
static NSString *const cellIdentifierTwo = @"cellIdentifierTwo";
static CGFloat const kTableViewHeaderViewHeight = 200;

@interface SDHomepageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArrayOne;
@property (nonatomic, strong) NSMutableArray *dataArrayTwo;


@end

@implementation SDHomepageViewController{
    NSArray *titles;
}
- (NSMutableArray *)dataArrayOne{
    if (!_dataArrayOne) {
        _dataArrayOne = [NSMutableArray array];
    }
    return _dataArrayOne;
}
- (NSMutableArray *)dataArrayTwo{
    if (!_dataArrayTwo) {
        _dataArrayTwo = [NSMutableArray array];
    }
    return _dataArrayTwo;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView            = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.backgroundColor =[UIColor whiteColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    titles = @[@"颜值",@"最热",@"DOTA2",@"主机游戏",@"穿越火线",@"英雄联盟",@"炉石传说",@"魔兽世界",@"守望先锋",@"王者荣耀",@"星际争霸",@"格斗游戏"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SDHomepageTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifierOne];
    [self.tableView registerNib:[UINib nibWithNibName:@"SDTableViewCellTypeTwo" bundle:nil] forCellReuseIdentifier:cellIdentifierTwo];
    
    SDHomepageHeaderView *header = [[SDHomepageHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kTableViewHeaderViewHeight)];
    
    //颜值系列
    [HTTPRequest requestWithUrl:HTTPGetListDataWhoArebeautiful success:^(id successObject) {
        if (successObject) {
            for (NSDictionary *info in (NSArray *)successObject) {
                SDHomepageViewModel *model = [SDHomepageViewModel recomendViewModelWithKeysAndValues:info];
                [self.dataArrayOne addObject:model];
            }
//            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        };;
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    
    
    //为何在此处设置tableHeaderView, 可Google: 如何让tableHeaderView和Cell一起/不一起滚动
    self.tableView.tableHeaderView = header;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self ConfigureNavigationBarButtonItems];
    //其他七八项
    [HTTPRequest requestWithUrl:HTTPGetDouYuHomepagelist success:^(id successObject) {
        if (successObject) {
            for (NSDictionary *info in (NSArray *)successObject) {
                SDHomepageViewModel *model = [SDHomepageViewModel recomendViewModelWithKeysAndValues:info];
                [self.dataArrayTwo addObject:model];
            }
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
        };
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    
}
- (void)ConfigureNavigationBarButtonItems{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button setImage:[UIImage imageNamed:@"temp"] forState:UIControlStateNormal];
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *scanItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mine"] style:UIBarButtonItemStyleDone target:self action:@selector(scanAction:)];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    UIBarButtonItem *liveHistoryItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStyleDone target:self action:@selector(checkWatchHistory:)];
    self.navigationItem.leftBarButtonItem = home;
    self.navigationItem.rightBarButtonItems = @[scanItem, searchItem, liveHistoryItem];
}
#pragma mark - UICollectionViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 1 ? self.dataArrayTwo.count : 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SDHomepageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (self.dataArrayOne.count > 0) {
            [cell configureHomepageCell:self.dataArrayOne[indexPath.row] more:^(NSString *title) {
                NSLog(@"title = %@",title);
            } selected:^(SDBaseLiveModel *model) {
                NSLog(@"nickname = %@",model.nickname);
                SDHomeGameDetailViewController *live = [[SDHomeGameDetailViewController alloc] initWithLive:model];
                live.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController: live animated:YES];
            }];
        }
        return cell;
    }else{
        SDTableViewCellTypeTwo *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (self.dataArrayTwo.count > 0) {
            [cell configureHomepageCell:self.dataArrayTwo[indexPath.row] more:^(NSString *title) {
                NSLog(@"title = %@",title);
            } selected:^(SDBaseLiveModel *model) {
                NSLog(@"nickname = %@",model.nickname);
                SDHomeGameDetailViewController *live = [[SDHomeGameDetailViewController alloc] initWithLive:model];
                live.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController: live animated:YES];
            }];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_WIDTH + 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private mehtod -
- (void)homepageRefreshAction:(UIBarButtonItem *)sender{
    NSLog(@"主页刷新");
}
- (void)checkWatchHistory:(UIBarButtonItem *)sender{
    NSLog(@"扫描二维码");
}
- (void)scanAction:(UIBarButtonItem *)sender{
    NSLog(@"搜索主播");
}
- (void)searchAction:(UIBarButtonItem *)sender{
    NSLog(@"查看观看历史");
}
@end
