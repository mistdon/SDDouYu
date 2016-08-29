//
//  SDNetworkService.h
//  SDDouYu
//
//  Created by shendong on 16/8/26.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignall;

@interface SDNetworkService : NSObject

+ (instancetype)shared; //

- (RACSignal *)requestFromNetWork:(NSString *)urlKey params:(NSDictionary *)params;

- (RACSignal *)requestBaseLiveModel:(NSString *)urlKey params:(NSDictionary *)params;

@end
