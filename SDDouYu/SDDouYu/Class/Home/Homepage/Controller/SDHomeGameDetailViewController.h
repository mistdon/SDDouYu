//
//  SDHomeGameDetailViewController.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDRootViewController.h"
#import "SDBaseLiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDHomeGameDetailViewController : SDRootViewController

@property (nonatomic, strong, readonly) SDBaseLiveModel *liveModel;

- (instancetype)initWithLive:(SDBaseLiveModel *)livemodel;

@end

NS_ASSUME_NONNULL_END
