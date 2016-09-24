//
//  SDHomepageViewModel.h
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDBaseLiveModel.h"

@interface SDHomepageViewModel : NSObject

@property (nonatomic, copy) NSString *tag_id;
@property (nonatomic, copy) NSString *tag_name;
@property (nonatomic, strong) NSURL *icon_url;
@property (nonatomic, copy) NSArray<__kindof SDBaseLiveModel *> *room_list;

+ (instancetype)recomendViewModelWithKeysAndValues:(NSDictionary *)dictionary;

@end
