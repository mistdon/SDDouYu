//
//  SDHomepageTableViewCell.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageTableViewCell.h"
#import "SDHomepageContentCollectionViewCell.h"
#import "SDBaseLiveModel+Extension.h"

static NSString *const collectionViewCellIdentifier = @"collectionViewCellIdentifier";



@interface SDHomepageTableViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *headerLeftButton;
@property (weak, nonatomic) IBOutlet UICollectionView *colletionView;
@property (nonatomic, copy) NSMutableArray<__kindof SDBaseLiveBeautyModel *> *details;
@property (nonatomic, copy) moreHandler more;
@property (nonatomic, copy) selectedBeautyBrandcast selectedOneBrandcast;

@end
@implementation SDHomepageTableViewCell
{
    NSString *_tagName;
}
- (NSMutableArray *)details{
    if (!_details) {
        _details = [NSMutableArray array];
    }
    return _details;
}
- (void)awakeFromNib {
    // Initialization code
    UICollectionViewFlowLayout *layout      = [[UICollectionViewFlowLayout alloc] init];
    self.colletionView.collectionViewLayout      = layout;
    self.colletionView.dataSource                = self;
    self.colletionView.delegate                  = self;
    self.colletionView.scrollEnabled             = NO;
    self.headerLeftButton.userInteractionEnabled = NO;
    [self.colletionView registerNib:[UINib nibWithNibName:@"SDHomepageContentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark flowlayout
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDHomepageContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    SDBaseLiveModel *model = self.details[indexPath.row];
    [cell configureDetails:[model detailsForShow]];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(SDHomePageCellEdgeSet, SDHomePageCellEdgeSet, SDHomePageCellEdgeSet, SDHomePageCellEdgeSet);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.details.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH - SDHomePageCellEdgeSet * 3)/2, (SCREEN_WIDTH - SDHomePageCellEdgeSet * 3)/2);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedOneBrandcast(self.details[indexPath.row]);
}
- (IBAction)moreActionButtonClicked:(UIButton *)sender {
    self.more(_tagName);
}
#pragma public method
- (void)configureBaseLiveCell:(NSArray<__kindof SDBaseLiveBeautyModel *> *)model more:(moreHandler)moreCompletion selected:(selectedBeautyBrandcast)selectedOneCompletion{
//    [self.headerLeftButton.imageView sd_setImageWithURL:model.icon_url placeholderImage:[UIImage imageNamed:@"icon_honor3"]];
//    [self.headerLeftButton setTitle:viewmodel.tag_name forState:UIControlStateNormal];
    [self.details addObjectsFromArray:model];
    _more = moreCompletion;
    _tagName = @"颜值";
    _selectedOneBrandcast =selectedOneCompletion ;
    [self.colletionView reloadData];
    
}
@end
