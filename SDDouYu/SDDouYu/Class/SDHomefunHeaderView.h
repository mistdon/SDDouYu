//
//  SDHomefunHeaderView.h
//  SDDouYu
//
//  Created by shendong on 16/5/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDHomefunHeaderView : UIView

- (void)bindDataWithModel:(NSArray *)model selected:(void(^)(id object))selectedBlock;

@end
