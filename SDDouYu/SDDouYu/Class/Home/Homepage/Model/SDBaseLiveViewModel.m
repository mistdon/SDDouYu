//
//  SDBaseLiveViewModel.m
//  SDDouYu
//
//  Created by shendong on 16/8/29.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDBaseLiveViewModel.h"
#import "SDNetworkService.h"
#import "MJExtension.h"
#import "SDBaseLiveModel.h"


@implementation SDBaseLiveViewModel
- (RACSignal *)requestBaseLiveModel:(NSString *)urlKey params:(NSDictionary *)params{
    return  [[[[[SDNetworkService shared]requestFromNetWork:urlKey params:params] filter:^BOOL(id value) {
        return [value isKindOfClass:[NSDictionary class]];
    }] map:^id(id value) {
        return value[@"data"];
    }]map:^id(NSArray *value) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:value.count];
        [value enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SDBaseLiveModel *model = [SDBaseLiveModel mj_objectWithKeyValues:obj];
            [array addObject:model];
        }];
        return array;
    }];
}
@end
