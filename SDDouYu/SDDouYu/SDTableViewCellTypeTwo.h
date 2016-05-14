//
//  SDTableViewCellTypeTwo.h
//  SDDouYu
//
//  Created by shendong on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SDBaseLiveModel.h"
#import "UITableViewCell+Extension.h"

static CGFloat const SDHomePageCellEdgeSetTwo       = 10;

@interface SDTableViewCellTypeTwo : UITableViewCell

- (void)configureHomepageCell:(SDHomepageViewModel *)viewmodel more:(moreHandler) moreCompletion selected:(selectedOneBrandcast)selectedOneCompletion;

@end
