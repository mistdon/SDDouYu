//
//  SDHomegameCommonCollectionViewCell.m
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomegameCommonCollectionViewCell.h"
#import "SDMultipleCornerView.h"

@interface SDHomegameCommonCollectionViewCell()

@property (nonatomic, weak) SDMultipleCornerView *view;
@end
@implementation SDHomegameCommonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        SDMultipleCornerView *corner = [[SDMultipleCornerView alloc] initWithFrame:self.bounds];
        corner.itemSize = CGSizeMake(frame.size.height - 10, frame.size.height - 10);
        _view = corner;
        [self.contentView addSubview:corner];
    }
    return self;
}

- (void)configureDatas:(NSArray *)datas selected:(selectedMultipleBlock)block{
    [self.view setDatas:datas selected:^(id object) {
        block(object);
    }];
}
@end
