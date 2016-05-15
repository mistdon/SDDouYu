//
//  SDHomepageTableViewCell.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITableViewCell+Extension.h"
#import "SDBaseLiveModel.h"

typedef void(^selectedBeautyBrandcast)(SDBaseLiveBeautyModel * model);
static NSString *const SDHomePageCellHeaderImage = @"homePageCellHeaderImage";
static NSString *const SDHomePageCellHeaderTitle = @"homePageCellHeaderTitle";
static CGFloat const SDHomePageCellEdgeSet       = 10;

@interface SDHomepageTableViewCell : UITableViewCell

- (void)configureBaseLiveCell:(NSArray<__kindof SDBaseLiveBeautyModel *> *)model more:(moreHandler) moreCompletion selected:(selectedBeautyBrandcast)selectedOneCompletion;

@end
