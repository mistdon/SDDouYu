//
//  SDHomegameCollectionViewCell.m
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomegameCollectionViewCell.h"
#import "SDMultipleCornerView.h"
@interface SDHomegameCollectionViewCell()

@property (nonatomic, weak) SDCornerView *cornerView;
@end
@implementation SDHomegameCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        SDCornerView *corner = [[SDCornerView alloc] initWithFrame:frame];
        _cornerView = corner;
        [self.contentView addSubview:corner];
    }
    return self;
}
- (void)layoutSubviews{
   [self.cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.and.top.bottom.equalTo(self.contentView);
   }];
}
- (void)configureHomegameCollectionViewCell:(SDGameCategoryModel *)model{
    [self.cornerView setImage:[NSURL URLWithString:model.icon_url] text:model.tag_name];
}
@end
