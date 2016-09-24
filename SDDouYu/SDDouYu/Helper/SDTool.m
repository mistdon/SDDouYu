//
//  SDTool.m
//  SDDouYu
//
//  Created by 管理员 on 16/6/23.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDTool.h"

@implementation SDTool

+ (CGFloat)sd_getCurrentDeviceSystemVersion{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}
+ (NSString *)sd_getCurrentDeviceName{
    return [[UIDevice currentDevice] systemName];
}
@end
