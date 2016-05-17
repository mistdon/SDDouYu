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

static NSString *const kcellIdentifier = @"kcellIdentifier";


@interface SDHomeStrageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datasArray;    //全部游戏

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
    UICollectionView *collection     = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    collection.dataSource            = self;
    collection.delegate              = self;
    collection.backgroundColor       = [UIColor whiteColor];
    self.collectionView = collection;
//    [self.view addSubview:collection];
    [collection registerClass:[SDCollectionViewCellTypeTwo class] forCellWithReuseIdentifier:kcellIdentifier];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HTTPRequest requestWithUrl:HTTPGetAllGameInfomaitons success:^(id successObject) {
        NSLog(@"succes =%@",successObject);
        NSArray *array1 = [SDBaseLiveBeautyModel mj_objectArrayWithKeyValuesArray:(NSArray *)successObject];
        [self.datasArray addObjectsFromArray:array1];
        [self.collectionView reloadData];
    } fail:^(id failObject, NSError *error) {
        ;
    }];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datasArray.count ;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDCollectionViewCellTypeTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
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
