//
//  SDNetworkService.m
//  SDDouYu
//
//  Created by shendong on 16/8/26.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDNetworkService.h"
#import <AFNetworking/AFNetworking.h>
#import "AFNetworking.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SDConstant.h"

NSString *const sssssHTTPGetAllFunInfomaitons = @"v1/getHotRoom/2?aid=ios&client_sys=ios&time=1463474820&auth=30f1016666d26c86da81ba7697b9ac30";

@implementation SDNetworkService

+ (instancetype)shared{
    static SDNetworkService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SDNetworkService new];
    });
    return instance;
}

- (RACSignal *)requestFromNetWork:(NSString *)urlKey params:(NSDictionary *)params{
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://capi.douyucdn.cn/api"]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", nil];
    [manager GET:sssssHTTPGetAllFunInfomaitons parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            [subject sendError:[NSError errorWithDomain:SDBasicService code:1 userInfo:nil]];
            return ;
        };
        [subject sendNext:responseObject];
        [subject sendCompleted];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [subject sendNext:error];
    }];
    return subject;
}


@end
