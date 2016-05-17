//
//  UIImageView+Corner.m
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "UIImageView+Corner.h"

@implementation UIImageView (Corner)

- (void)setImageViewCorner:(NSURL *)url placeholderImage:(UIImage *)image{
    __weak __typeof(self)weakself = self;
    [self sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil || error != nil) {
            return ;
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            @autoreleasepool {
                UIImage *clipedImage = [image hyb_clipToSize:weakself.bounds.size cornerRadius:weakself.bounds.size.width/2 backgroundColor:[UIColor whiteColor] isEqualScale:YES];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakself.image = clipedImage;
                });
            }
        });
    }];
}

@end
