//
//  SDBaseLiveModel+Extension.m
//  SDDouYu
//
//  Created by shendong on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDBaseLiveModel+Extension.h"

@implementation SDBaseLiveModel (Extension)

- (NSDictionary *)detailsForShow{
    return @{SDBrandcastModelUrl:self.vertical_src,
             SDBrandcastModelNickName: self.nickname,
             SDBrandcastModelOnline: self.online};
}

@end
