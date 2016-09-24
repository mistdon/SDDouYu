//
//  SDBaseLiveViewModel.h
//  SDDouYu
//
//  Created by shendong on 16/8/29.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;
@interface SDBaseLiveViewModel : NSObject
- (RACSignal *)requestBaseLiveModel:(NSString *)urlKey params:(NSDictionary *)params;
@end
