//
//  SDHomegameCommonCollectionViewCell.h
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDMultipleCornerView.h"

@interface SDHomegameCommonCollectionViewCell : UICollectionViewCell

- (void)configureDatas:(NSArray *)datas selected:(selectedMultipleBlock)block;

@end
