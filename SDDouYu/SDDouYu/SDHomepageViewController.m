//
//  SDHomepageViewController.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageViewController.h"
#import "SDHomepageTableViewCell.h"
#import "SDHomepageViewModel.h"
#import "SDHomeGameDetailViewController.h"
#import "SDHomepageHeaderView.h"
#import "SDHomepageDataSource.h"

static NSString *const cellIdentifier = @"cellIdentifier";
static CGFloat const kTableViewHeaderViewHeight = 200;

@interface SDHomepageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;


@end

@implementation SDHomepageViewController{
    NSArray *titles;
}
- (NSMutableArray *)data{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
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
    [self.tableView registerNib:[UINib nibWithNibName:@"SDHomepageTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
//    [self.view addSubview:self.tableView];
    [self ConfigureNavigationBarButtonItems];
    [HTTPRequest requestWithUrl:HTTPGetDouYuHomepagelist success:^(id successObject) {
        if (successObject) {
            for (NSDictionary *info in (NSArray *)successObject) {
                SDHomepageViewModel *model = [SDHomepageViewModel recomendViewModelWithKeysAndValues:info];
                [self.data addObject:model];
            }
            [self.tableView reloadData];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SDHomepageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (self.data.count > 0) {
        [cell configureHomepageCell:self.data[indexPath.row] more:^(NSString *title) {
            NSLog(@"title = %@",title);
        } selected:^(SDBrandcastModel *model) {
            NSLog(@"nickname = %@",model.nickname);
            SDHomeGameDetailViewController *live = [[SDHomeGameDetailViewController alloc] initWithLive:model];
            [self.navigationController pushViewController: live animated:YES];
        }];
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SDHomepageHeaderView *header = [[SDHomepageHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kTableViewHeaderViewHeight)];
    [HTTPRequest requestWithUrl:HTTPGetDouYuHomepageBannerInfomation success:^(id successObject) {
        [header configureBannerViews:successObject selectAction:^(id object) {
            ;
        }];;
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kTableViewHeaderViewHeight;
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
