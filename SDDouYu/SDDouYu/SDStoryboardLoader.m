//
//  SDStoryboardLoader.m
//  SDDouYu
//
//  Created by shendong on 16/8/26.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDStoryboardLoader.h"
#import <objc/runtime.h>
@implementation SDStoryboardLoader

+ (UIViewController *)sd_viewController:(NSString *)controllerClassName inStoryboard:(NSString *)storyboardName arguments:(NSDictionary *)args{
    NSString *viewControllerName = [NSString stringWithFormat:@"SD%@ViewController",controllerClassName];
    return [self viewController:viewControllerName inStoryboard:storyboardName arguments:args];
}
+ (UIViewController *)viewController:(NSString *)controllerClassName inStoryboard:(NSString *)storyboardName arguments:(NSDictionary *)args{
    NSCParameterAssert(controllerClassName!=nil);
    NSCParameterAssert(storyboardName != nil);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    assert(storyboard != nil);
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:controllerClassName];
    assert(viewController!=nil);
    
    if (args && [args count] > 0) {
        unsigned int propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList([viewController class], &propertyCount);
        for (int index = 0; index <  propertyCount; index++) {
            objc_property_t propety = *(properties + index);
            const char *propertyName = property_getName(propety);
            NSString *propertyNames = [NSString stringWithUTF8String:propertyName];
            if (args[propertyNames]) {
                [viewController setValue:args[propertyNames] forKey:propertyNames];
            }
        }
    }
    
    return viewController;
}

@end
