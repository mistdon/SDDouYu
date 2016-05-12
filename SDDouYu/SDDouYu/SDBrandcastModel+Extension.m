//
//  SDBrandcastModel+Extension.m
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDBrandcastModel+Extension.h"

@implementation SDBrandcastModel (Extension)

- (NSDictionary *)readyForDetailsShow{
    return @{SDBrandcastModelUrl : self.vertical_src,
             SDBrandcastModelNickName: self.nickname,
             SDBrandcastModelOnline: self.online};
}

@end
