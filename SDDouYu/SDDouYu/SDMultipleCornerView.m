//
//  SCMultipleCornerView.m
//  SDDouYu
//
//  Created by Allen on 16/5/15.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDMultipleCornerView.h"

#pragma mark - SDCornerView -
static CGFloat const kCornerViewScale = 0.8;


//上面是图片,下面是文字,图片高度占总高度的比例是kCornerViewScale,图片垂直居中正方形分布
@interface SDCornerView ()


@end
@implementation SDCornerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initWithDefaults];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initWithDefaults];
    }
    return self;
}
- (void)initWithDefaults{
    self.backgroundColor         = [UIColor whiteColor];
    self.imageView               = [[UIImageView alloc] init];
    self.textLable               = [[UILabel alloc] init];
    self.imageView.contentMode   = UIViewContentModeScaleAspectFit;
    self.textLable.textAlignment = NSTextAlignmentCenter;
    self.textLable.textColor     = [UIColor blackColor];
    self.textLable.font          = [UIFont systemFontOfSize:15];
    [self addSubview:self.imageView];
    [self addSubview:self.textLable];
}
- (void)layoutSubviews{
    self.imageView.layer.cornerRadius = (self.frame.size.height * kCornerViewScale) / 2;
    self.imageView.clipsToBounds = YES;
    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self);
        make.height.mas_equalTo(self.frame.size.height * (1 - kCornerViewScale));
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        CGSize size = CGSizeMake(self.frame.size.height * kCornerViewScale, self.frame.size.height *  kCornerViewScale);
        make.size.mas_equalTo(size);
    }];
}
- (void)setImage:(NSURL *)url text:(NSString *)text{
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"douyu"]];
    self.textLable.text = text;
}
- (void)setLocalImage:(UIImage *)url text:(NSString *)text{
    self.imageView.image = url;
    self.textLable.text = text;
}

@end

#pragma mark - SDMultipleCornerViewCell -
@implementation SDMultipleCornerViewCell


- (void)awakeFromNib{
    self.cornerView = [[SDCornerView alloc] init];
    [self.contentView addSubview:self.cornerView];
}
- (void)layoutSubviews{
    [self.cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.top.equalTo(self);
    }];
}
@end

#pragma mark - SDMultipleCornerView -
static NSString *const KMultipleCornerViewCellIdentifier = @"KMultipleCornerViewCellIdentifier";

@interface SDMultipleCornerView ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) UICollectionView *collectionView;
@end
@implementation SDMultipleCornerView

- (NSMutableArray *)data{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initWithSubCollectionView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initWithSubCollectionView];
    }
    return self;
}
- (void)initWithSubCollectionView{
    UICollectionViewLayout *layout           = [[UICollectionViewLayout alloc] init];
    self.collectionView                      = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
//    self.collectionView.collectionViewLayout = layout;
    self.collectionView.delegate             = self;
    self.collectionView.dataSource           = self;
    [self.collectionView registerClass:[SDMultipleCornerViewCell class] forCellWithReuseIdentifier:KMultipleCornerViewCellIdentifier];
    [self addSubview:self.collectionView];
}
- (void)layoutSubviews{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.top.equalTo(self);;
    }];
}
#pragma mark - UICollectionView delagate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDMultipleCornerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KMultipleCornerViewCellIdentifier forIndexPath:indexPath];
    [cell.cornerView setLocalImage:[UIImage imageNamed:@"douyu"] text:@"shendong"];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}
- (void)setDatas:(NSArray *)datas{
    [self.data removeAllObjects];
    [self.data addObjectsFromArray:datas];
    [self.collectionView reloadData];
}
@end


