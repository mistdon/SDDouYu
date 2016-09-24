//
//  SDHomepageViewModel.m
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageViewModel.h"

@implementation SDHomepageViewModel

+ (instancetype)recomendViewModelWithKeysAndValues:(NSDictionary *)dictionary{
    [SDHomepageViewModel mj_setupObjectClassInArray:^NSDictionary *{
        return  @{
                  @"room_list":@"SDBaseLiveModel"
                  };
    }];
    SDHomepageViewModel *model = [SDHomepageViewModel mj_objectWithKeyValues:dictionary];
    return model;
}

@end
