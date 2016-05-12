//
//  SDHomeGameDetailViewController.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDRootViewController.h"
#import "SDBrandcastModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDHomeGameDetailViewController : SDRootViewController

@property (nonatomic, strong, readonly) SDBrandcastModel *liveModel;

- (instancetype)initWithLive:(SDBrandcastModel *)livemodel;

@end

NS_ASSUME_NONNULL_END
