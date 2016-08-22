//
//  SDIndicatorLoadingView.m
//  SDDouYu
//
//  Created by shendong on 16/8/22.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDIndicatorLoadingView.h"

@implementation SDIndicatorLoadingView

+ (instancetype)instanceXIBView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}

@end
