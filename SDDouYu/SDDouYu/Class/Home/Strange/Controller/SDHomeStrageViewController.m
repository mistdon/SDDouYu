//
//  SDHomeStrageViewController.m
//  
//
//  Created by shendong on 16/5/17.
//
//

#import "SDHomeStrageViewController.h"
#import "SDCollectionViewCellTypeTwo.h"
#import "SDBaseLiveModel.h"
#import "UIScrollView+SDMJRefresh.h"
#import "SDGameCategoryModel.h"
static NSString *const kHpmepagecellIdentifier = @"kHpmepagecellIdentifier";


@interface SDHomeStrageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<__kindof SDBaseLiveModel *> *datasArray;    //全部游戏

@end

@implementation SDHomeStrageViewController
- (NSMutableArray *)datasArray{
    if (!_datasArray) {
        _datasArray = [NSMutableArray array];
    }
    return _datasArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumInteritemSpacing     = 1;
    flow.minimumLineSpacing          = 1;
    UICollectionView *collection     = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SDUIViewControllerNavigationBarHeight - SDUIViewControllerTabBarHeight  - SDUIViewControllerChannelViewHeight) collectionViewLayout:flow];
    collection.dataSource            = self;
    collection.delegate              = self;
    collection.backgroundColor       = [UIColor whiteColor];
    self.collectionView = collection;
    [self.view addSubview:collection];
    [collection registerNib:[UINib nibWithNibName:@"SDCollectionViewCellTypeTwo" bundle:nil] forCellWithReuseIdentifier:kHpmepagecellIdentifier];
    
    [self sd_setupRefreshControl];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HTTPRequest requestWithUrl:HTTPGetAllStrangeInfomaitons success:^(id successObject) {
        NSArray *array1 = [SDBaseLiveModel mj_objectArrayWithKeyValuesArray:(NSArray *)successObject];
        [self.datasArray addObjectsFromArray:array1];
        [self.collectionView reloadData];
        [self.collectionView endHeaderRefreshing];
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    
    
}
- (void)sd_setupRefreshControl{
    __weak typeof(self)weakself = self;
    [self.collectionView setUpMJRefreshHeaderStyle:SDHeaderRefreshStyleNormal block:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_main_async_safe(^{
                [weakself.collectionView endHeaderRefreshing];
            });
        });
    }];
    [self.collectionView setUpMJRefreshFooterStyle:SDFooterRefreshStyleNormal block:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_main_async_safe(^{
                [weakself.collectionView endFooterRefreshing];
            });
        });;
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datasArray.count ;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDCollectionViewCellTypeTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHpmepagecellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    [cell bindDataWithModel:self.datasArray[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH - 6)/2, (SCREEN_WIDTH-6)/2);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
