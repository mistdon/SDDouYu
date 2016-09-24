//
//  SDBaseLiveModel+Extension.h
//  SDDouYu
//
//  Created by shendong on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//


#import "SDBaseLiveModel.h"

static NSString *const SDBrandcastModelUrl = @"SDBrandcastModelUrl";
static NSString *const SDBrandcastModelNickName = @"SDBrandcastModelNickName";
static NSString *const SDBrandcastModelOnline = @"SDBrandcastModelOnline";

@interface SDBaseLiveModel (Extension)

- (NSDictionary *)detailsForShow;

@end
