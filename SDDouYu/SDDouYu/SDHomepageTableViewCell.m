//
//  SDHomepageTableViewCell.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageTableViewCell.h"
#import "SDHomepageContentCollectionViewCell.h"
#import "SDBrandcastModel+Extension.h"

static NSString *const collectionViewCellIdentifier = @"collectionViewCellIdentifier";



@interface SDHomepageTableViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *headerLeftButton;
@property (weak, nonatomic) IBOutlet UICollectionView *colletionView;
@property (nonatomic, copy) NSMutableArray<__kindof SDBrandcastModel *> *details;
@property (nonatomic, copy) moreHandler more;
@property (nonatomic, copy) selectedOneBrandcast selectedOneBrandcast;

@end
@implementation SDHomepageTableViewCell
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
    // Initialization code
    UICollectionViewFlowLayout *layout      = [[UICollectionViewFlowLayout alloc] init];
    self.colletionView.collectionViewLayout = layout;
    self.colletionView.dataSource           = self;
    self.colletionView.delegate             = self;
    self.colletionView.scrollEnabled        = NO;
    [self.colletionView registerNib:[UINib nibWithNibName:@"SDHomepageContentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark flowlayout
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SDHomepageContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    SDBrandcastModel *model = self.details[indexPath.row];
    [cell configureDetails:[model readyForDetailsShow]];
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
//    NSLog(@"点击了 %@,indexpath = %lu",self.infos[SDHomePageCellHeaderTitle],indexPath.row);
//    self.more()
    
    self.selectedOneBrandcast(self.details[indexPath.row]);
}
- (IBAction)moreActionButtonClicked:(UIButton *)sender {
    self.more(_homeViewmodel.tag_name);
}
#pragma public method
- (void)configureHomepageCell:(SDHomepageViewModel *)viewmodel more:(moreHandler)moreCompletion selected:(selectedOneBrandcast)selectedOneCompletion{
    [self.headerLeftButton.imageView sd_setImageWithURL:[NSURL URLWithString:viewmodel.icon_url] placeholderImage:[UIImage imageNamed:@"icon_honor3"]];
    [self.headerLeftButton setTitle:viewmodel.tag_name forState:UIControlStateNormal];
    [self.details addObjectsFromArray:viewmodel.room_list];
    _homeViewmodel = viewmodel;
    _more = moreCompletion;
    _selectedOneBrandcast = selectedOneCompletion;
    [self.colletionView reloadData];
    
}
@end
