//
//  SDTableViewCellTypeTwo.m
//  SDDouYu
//
//  Created by shendong on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTableViewCellTypeTwo.h"
#import "SDCollectionViewCellTypeTwo.h"

static NSString *const collectionViewCellIdentifierTwo = @"collectionViewCellIdentifierTwo";

@interface SDTableViewCellTypeTwo ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionVIew;
@property (nonatomic, copy) NSMutableArray<__kindof SDBaseLiveModel *> *details;
@property (nonatomic, copy) moreHandler more;
@property (nonatomic, copy) selectedOneBrandcast selectedOneBrandcast;

@end

@implementation SDTableViewCellTypeTwo
{
    SDHomepageViewModel *_homeViewmodel;
}
- (NSMutableArray *)details{
    if (!_details) {
        _details = [NSMutableArray array];
    }
    return _details;
}

- (void)awakeFromNib {
    UICollectionViewFlowLayout *layout      = [[UICollectionViewFlowLayout alloc] init];
    self.collectionVIew.collectionViewLayout = layout;
    self.collectionVIew.dataSource           = self;
    self.collectionVIew.delegate             = self;
    self.collectionVIew.scrollEnabled        = NO;
    [self.collectionVIew registerNib:[UINib nibWithNibName:@"SDCollectionViewCellTypeTwo" bundle:nil] forCellWithReuseIdentifier:collectionViewCellIdentifierTwo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark flowlayout
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDCollectionViewCellTypeTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifierTwo forIndexPath:indexPath];
//    SDBrandcastModel *model = self.details[indexPath.row];
//    [cell configureDetails:[model readyForDetailsShow]];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(SDHomePageCellEdgeSetTwo, SDHomePageCellEdgeSetTwo, SDHomePageCellEdgeSetTwo, SDHomePageCellEdgeSetTwo);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.details.count;
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH - SDHomePageCellEdgeSetTwo * 3)/2, (SCREEN_WIDTH - SDHomePageCellEdgeSetTwo * 3)/2);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"点击了 %@,indexpath = %lu",self.infos[SDHomePageCellHeaderTitle],indexPath.row);
    //    self.more()
    
//    self.selectedOneBrandcast(self.details[indexPath.row]);
}
- (IBAction)moreActionButtonClicked:(UIButton *)sender {
//    self.more(_homeViewmodel.tag_name);
}
#pragma public method
- (void)configureHomepageCell:(SDHomepageViewModel *)viewmodel more:(moreHandler)moreCompletion selected:(selectedOneBrandcast)selectedOneCompletion{
//    [self.headerLeftButton.imageView sd_setImageWithURL:[NSURL URLWithString:viewmodel.icon_url] placeholderImage:[UIImage imageNamed:@"icon_honor3"]];
//    [self.headerLeftButton setTitle:viewmodel.tag_name forState:UIControlStateNormal];
    [self.details addObjectsFromArray:viewmodel.room_list];
    _homeViewmodel = viewmodel;
    _more = moreCompletion;
    _selectedOneBrandcast = selectedOneCompletion;
    [self.collectionVIew reloadData];
    
}

@end
