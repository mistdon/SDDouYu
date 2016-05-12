//
//  SDHomepageHeaderView.h
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedItemBlock)(id object);

@interface SDHomepageHeaderView : UIView

- (void)configureBannerViews:(NSArray *)resources selectAction:(selectedItemBlock)completion;

@end
