//
//  SCMultipleCornerView.h
//  SDDouYu
//
//  Created by Allen on 16/5/15.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const SDMultipleCornerViewImageIdentifier;
FOUNDATION_EXPORT NSString *const SDMultipleCornerViewTitleIdentifier;
@interface SDCornerView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLable;

- (void)setImage:(NSURL *)url text:(NSString *)text;
- (void)setLocalImage:(UIImage *)url text:(NSString *)text;
@end


@interface SDMultipleCornerViewCell : UICollectionViewCell;

@property (nonatomic, strong) SDCornerView *cornerView;

@end

typedef void(^selectedMultipleBlock)(id object);
@interface SDMultipleCornerView : UIView

@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic) CGSize itemSize; //default is CGSizeZero;

- (void)setDatas:(NSArray *)datas selected:(selectedMultipleBlock)selectedComplander;

@end
