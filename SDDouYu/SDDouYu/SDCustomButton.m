//
//  SDCustomButton.m
//  SDDouYu
//
//  Created by Allen on 16/5/15.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDCustomButton.h"

static CGFloat const kCustomScale = 0.7;

@implementation SDCustomButton
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initWithDefaults];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder: aDecoder]) {
        [self initWithDefaults];
    }
    return self;
}
- (void)initWithDefaults{
    self.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 5);
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width * kCustomScale, contentRect.size.height);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(contentRect.size.width * kCustomScale, 0, contentRect.size.width * (1 - kCustomScale), contentRect.size.height);
}

@end
