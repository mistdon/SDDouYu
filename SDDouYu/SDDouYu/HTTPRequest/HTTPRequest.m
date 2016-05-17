//
//  HTTPRequest.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "HTTPRequest.h"


NSString *const  HTTPCheckUpdate = @"http://capi.douyucdn.cn/api/ios_app/check_update"; 
NSString *const HTTPGetRecommendGameList = @"http://capi.douyucdn.cn/api/app_api/get_app_list?devid=2295CB6B-D6B5-4A7D-AC7B-ED31DAC63205&sign=5cd99ec3c8d3391ca42e93ac97ab17d2&time=1462945493&type=ios";

NSString *const  HTTPGetListDataWhoArebeautiful = @"http://capi.douyucdn.cn/api/v1/getVerticalRoom?aid=ios&client_sys=ios&limit=20&offset=0&time=1463021220&auth=e3cb7d07d0d8d785172a1469ab6a362f";
NSString *const  HTTPGetBrandCastInfo = @"http://capi.douyucdn.cn/api/v1/get_index_ad?aid=ios&cate_id=IOS&client_sys=ios&place=1&time=1463023560&auth=c7443ca8f8669de0056720d91059eeff";

NSString *const HTTPGetUserInfomation = @"http://capi.douyucdn.cn/api/v1/login?aid=ios&client_sys=ios&password=79eb562eff8c1781f60369b0684a6d81&time=1463023560&type=md5&username=%E7%B3%99%E6%B1%89%E5%AD%90Todo&auth=3a521b053c7e8958aaea5131f5b3df2d";


NSString *const HTTPGetUserLevelInfomation = @"http://capi.douyucdn.cn/api/v1/getExpRule?aid=ios&client_sys=ios&time=1463023560&auth=dafbf01c007974905e4dfc049ce03ba8";

NSString *const HTTPGetDouYuHornorInfomation = @"http://capi.douyucdn.cn/api/v1/gethonorimg?aid=ios&client_sys=ios&level=2&time=1463023560&auth=7aeb66b8e8c845d2fbc596d7c46f871e";

NSString *const HTTPGetDouYuColumnTitle = @"http://capi.douyucdn.cn/api/v1/getColumnTitle?aid=ios&client_sys=ios&time=1463023560&auth=9ce8474d5d5414a2e6870ead8e3850fe";

NSString *const HTTPGetDouYuBigHot = @"http://capi.douyucdn.cn/api/v1/getCustomRoom?aid=ios&client_sys=ios&tagIds=3_19_33_1_2_5_148_181_4_29_&time=1463023560&auth=800f45888679e63ecc2bdeff47ea3ee7";

NSString *const HTTPGetDouYuHomepageBannerInfomation = @"http://capi.douyucdn.cn/api/v1/slide/6?aid=ios&client_sys=ios&time=1463029440&version=2.22&auth=504dd0550153d17787ddcf0c58ce60cf";

NSString *const HTTPGetDouYuHomepagelist = @"http://capi.douyucdn.cn/api/v1/getCustomRoom?aid=ios&client_sys=ios&tagIds=3_19_33_1_2_5_148_181_4_29_&time=1463030160&auth=e5e9482638e51ebbe264491c58802c13";

NSString *const HTTPGetAllGameInfomaitons = @"http://capi.douyucdn.cn/api/v1/getColumnDetail?aid=ios&client_sys=ios&shortName=game&time=1463377200&auth=75549cbfb9c3a43b5827928030a5585a";

NSString *const HTTPGetAllStrangeInfomaitons = @"http://capi.douyucdn.cn/api/v1/getColumnRoom/3?aid=ios&client_sys=ios&limit=20&offset=0&time=1463470500&auth=9c09f4a4ec48001e1b46af73bf2d69f4";

NSString *const HTTPGetAllFunInfomaitons = @"http://capi.douyucdn.cn/api/v1/getHotRoom/2?aid=ios&client_sys=ios&time=1463474820&auth=30f1016666d26c86da81ba7697b9ac30";
/*
NSString *const HTTPGetUserInfomation =
*/



static NSString *const kResponseMsg1 = @"msg";
static NSString *const kResponseMsg2 = @"error";

@implementation HTTPRequest

+ (void)requestWithUrl:(NSString *)urlString success:(successBlock)successHander fail:(failBlock)failHander{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.requestSerializer.timeoutInterval = 10.f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", nil] ;
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = (NSDictionary *)responseObject;
        if (result[@"error"] && [result[@"error"] integerValue] == 0) {
            if (result[@"data"]) {
                successHander(result[@"data"]);
            }else{
                //@"Download success, But no data.;
                successHander(nil);
            }
        }else{
            //NSDictionary *dictionary = @{kResponseMsg1:@"Error occures",kResponseMsg2:result[@"error"]};
            successHander(nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failHander(nil, error);
    }];
}

@end
