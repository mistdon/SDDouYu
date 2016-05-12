//
//  SDBrandcastModel+Extension.h
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDBrandcastModel.h"

static NSString *const SDBrandcastModelUrl = @"SDBrandcastModelUrl";
static NSString *const SDBrandcastModelNickName = @"SDBrandcastModelNickName";
static NSString *const SDBrandcastModelOnline = @"SDBrandcastModelOnline";

@interface SDBrandcastModel (Extension)
- (NSDictionary *)readyForDetailsShow;
@end
