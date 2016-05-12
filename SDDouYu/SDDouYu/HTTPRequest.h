//
//  HTTPRequest.h
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id successObject);
typedef void(^failBlock) (id failObject, NSError *error);



//暂时这样处理，todo: 将网络请求封装在自己的静态库中

FOUNDATION_EXPORT NSString *const HTTPCheckUpdate; //检查更新
FOUNDATION_EXPORT NSString *const HTTPGetRecommendGameList;
/**
 *  获取颜值列表
 */
FOUNDATION_EXPORT NSString *const HTTPGetListDataWhoArebeautiful;  //获取

/**
 *  获取首页广告信息
 */
FOUNDATION_EXPORT NSString *const HTTPGetBrandCastInfo;

/**
 *  获取用户的登录信息
 */
FOUNDATION_EXPORT NSString *const HTTPGetUserInfomation;

/**
 *  获取斗鱼的等级信息(每一个level信息内含有对应的icon),等级从level1到level 61
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuLevelInfomation;

/**
 *  获取斗鱼荣誉信息,内含三个荣誉等级的icon
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuHornorInfomation;

/**
 *  获取斗鱼首页中并列展示的title,展示在推荐后面。比如目前是游戏,娱乐,奇葩
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuColumnTitle;

/**
 *  获取斗鱼首页中最热下面的主播信息
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuBigHot;

/**
 *  获取斗鱼首页轮播广告信息
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuHomepageBannerInfomation;

/**
 *  获取首页推荐的所有内容
 */
FOUNDATION_EXPORT NSString *const HTTPGetDouYuHomepagelist;

@interface HTTPRequest : NSObject

+ (void)requestWithUrl:(NSString *)urlString success:(successBlock)successHander fail:(failBlock)failHander;
@end
