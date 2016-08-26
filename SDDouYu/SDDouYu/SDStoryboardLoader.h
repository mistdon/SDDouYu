//
//  SDStoryboardLoader.h
//  SDDouYu
//
//  Created by shendong on 16/8/26.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>


#define SDViewController(className, storyboardName, args) [SDStoryboardLoader sd_viewController:className inStoryboard:storyboardName arguments:args]

@interface SDStoryboardLoader : NSObject
+ (UIViewController *)viewController:(NSString *)controllerClassName inStoryboard:(NSString *)storyboardName arguments:(NSDictionary *)args;
+ (UIViewController *)sd_viewController:(NSString *)controllerClassName inStoryboard:(NSString *)storyboardName arguments:(NSDictionary *)args;

@end
