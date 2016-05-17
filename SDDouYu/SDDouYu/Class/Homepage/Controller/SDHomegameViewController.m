//
//  SDHomegameViewController.m
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomegameViewController.h"
#import "SDGameCategoryModel.h"
#import "SDMultipleCornerView.h"
#import "SDHomegameCommonCollectionViewCell.h"
#import "SDHomegameCollectionViewCell.h"
#import "SDHomegameCollectionHeaderView.h"
static NSString *const kCommoncellIdentifier   = @"kCommoncellIdentifier";
static NSString *const kcellIdentifier   = @"kcellIdentifier";
static NSString *const kHeaderIdentifier = @"kHeaderIdentifier";

@interface SDHomegameViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *commonGames; //常用游戏
@property (nonatomic, strong) NSMutableArray *allGames;    //全部游戏
@end

@implementation SDHomegameViewController
- (NSMutableArray *)commonGames{
    if (!_commonGames) {
        _commonGames = [NSMutableArray array];
    }
    return _commonGames;
}
- (NSMutableArray *)allGames{
    if (!_allGames) {
        _allGames = [NSMutableArray array];
    }
    return _allGames;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumInteritemSpacing     = 0;
    flow.minimumLineSpacing          = 0;
    UICollectionView *collection     = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    collection.dataSource            = self;
    collection.delegate              = self;
    collection.backgroundColor       = [UIColor whiteColor];
    self.collectionView = collection;
    [self.view addSubview:collection];
    [collection registerClass:[SDHomegameCollectionViewCell class] forCellWithReuseIdentifier:kcellIdentifier];
    [collection registerClass:[SDHomegameCommonCollectionViewCell class] forCellWithReuseIdentifier:kCommoncellIdentifier];
    [collection registerNib:[UINib nibWithNibName:@"SDHomegameCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HTTPRequest requestWithUrl:HTTPGetAllGameInfomaitons success:^(id successObject) {
        NSLog(@"succes =%@",successObject);
        NSArray *array1 = [SDGameCategoryModel mj_objectArrayWithKeyValuesArray:(NSArray *)successObject];
        [self.allGames addObjectsFromArray:array1];
        for (SDGameCategoryModel *model in array1) {
            [self.commonGames addObject:model];
            if (self.commonGames.count > 9) {
                break;
            }
        }
        [self.collectionView reloadData];
    } fail:^(id failObject, NSError *error) {
        ;
    }];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section == 0 ? 1 : self.allGames.count ;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SDHomegameCommonCollectionViewCell *common = [collectionView dequeueReusableCellWithReuseIdentifier:kCommoncellIdentifier forIndexPath:indexPath];
        [common configureDatas:self.commonGames selected:^(id object) {
            SDGameCategoryModel *model = (SDGameCategoryModel *)object;
            NSLog(@"object = %@",model.tag_name);
        }];
        return common;
    }else{
        SDHomegameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
        [cell configureHomegameCollectionViewCell:self.allGames[indexPath.item]];
        return cell;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (![kind isEqualToString:UICollectionElementKindSectionHeader]) return nil;
    SDHomegameCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
    header.textLable.text = indexPath.section == 0 ? @"常用" : @"全部";
    return header;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 54);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 100);
    }else{
        return CGSizeMake((SCREEN_WIDTH - 6)/3, (SCREEN_WIDTH-6)/3);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
