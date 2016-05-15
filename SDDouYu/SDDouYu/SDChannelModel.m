//
//  SDChannelModel.m
//  SDDouYu
//
//  Created by Allen on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDChannelModel.h"

@implementation SDChannelModel

+ (instancetype)recomendViewModelWithKeysAndValues:(NSDictionary *)dictionary{
    [SDChannelModel mj_setupObjectClassInArray:^NSDictionary *{
        return  @{
                  @"room_list":@"SDBaseLiveBeautyModel"
                  };
    }];
    SDChannelModel *model = [SDChannelModel mj_objectWithKeyValues:dictionary];
    return model;
}


@end
