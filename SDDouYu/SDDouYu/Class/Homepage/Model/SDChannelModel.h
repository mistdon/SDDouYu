//
//  SDChannelModel.h
//  SDDouYu
//
//  Created by Allen on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDBaseLiveModel.h"
@interface SDChannelModel : NSObject

@property (nonatomic, copy) NSString *tag_id;
@property (nonatomic, copy) NSString *tag_name;
@property (nonatomic, strong) NSURL *icon_url;
@property (nonatomic, copy) NSArray<__kindof SDBaseLiveBeautyModel *> *room_list;

+ (instancetype)recomendViewModelWithKeysAndValues:(NSDictionary *)dictionary;

@end

