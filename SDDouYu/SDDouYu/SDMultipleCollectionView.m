//
//  SDMultipleCollectionView.m
//  SDDouYu
//
//  Created by Allen on 16/5/15.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDMultipleCollectionView.h"

static NSString *const KCellIdentifier = @"KCellIdentifier";

@interface SDMultipleCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *localData;
@end
@implementation SDMultipleCollectionView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
        self.collectionViewLayout = layout;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:KCellIdentifier];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCellIdentifier forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}
@end
