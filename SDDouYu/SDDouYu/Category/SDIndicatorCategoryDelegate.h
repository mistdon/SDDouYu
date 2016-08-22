//
//  SDIndicatorCategoryDelegate.h
//  SDDouYu
//
//  Created by shendong on 16/8/22.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SDIndicatorCategoryDelegate <NSObject>

@optional

- (void)emptyIndicatorViewTapped:(id)sender;

- (void)errorIndicatorViewTapped:(id)sender;

@end
