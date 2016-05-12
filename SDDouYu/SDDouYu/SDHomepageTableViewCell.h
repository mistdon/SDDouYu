//
//  SDHomepageTableViewCell.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDHomepageViewModel.h"

typedef void(^moreHandler) (NSString * title);
typedef void(^selectedOneBrandcast)(SDBrandcastModel * model);

static NSString *const SDHomePageCellHeaderImage = @"homePageCellHeaderImage";
static NSString *const SDHomePageCellHeaderTitle = @"homePageCellHeaderTitle";
static CGFloat const SDHomePageCellEdgeSet       = 10;

@interface SDHomepageTableViewCell : UITableViewCell

- (void)configureHomepageCell:(SDHomepageViewModel *)viewmodel more:(moreHandler) moreCompletion selected:(selectedOneBrandcast)selectedOneCompletion;

@end
