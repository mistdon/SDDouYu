//
//  SDBaseLiveModel.h
//  SDDouYu
//
//  Created by shendong on 16/5/14.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>


//*******************颜值************
// "room_id": "492150",
// "room_src": "http:\/\/staticlive.douyutv.com\/upload\/appCovers\/492150\/20160514\/54859d77bf4950007a10e82f35d753d6_small.jpg",
// "vertical_src": "http:\/\/staticlive.douyutv.com\/upload\/appCovers\/492150\/20160514\/54859d77bf4950007a10e82f35d753d6_big.jpg",
// "isVertical": 1,
// "cate_id": "201",
// "room_name": "\u515c\u8c46 \u7eaf\u6c61\u7f8e\u5c11\u5973\u7684\u7a9d\uff01",
// "show_status": "1",
// "subject": "",
// "show_time": "1463200820",
// "owner_uid": "27364041",
// "specific_catalog": "doudouliang",
// "specific_status": "1",
// "vod_quality": "0",
// "nickname": "\u515c\u8c46\u9753Youlina",
// "online": 64958,
// "child_id": "0",
// "ranktype": 0,
// "game_name": "\u989c\u503c

//******************* 其他 ****************
//"cate_id" = 201;
//"child_id" = 0;
//isVertical = 1;
//nickname = "\U5927\U738b\U4eac\U5915";
//online = 15491;
//"owner_uid" = 15568616;
//ranktype = 0;
//"room_id" = 431179;
//"room_name" = "\U7ec3\U5b8c\U5c31\U64a4...";
//"room_src" = "http://staticlive.douyutv.com/upload/appCovers/431179/20160510/08fc0b106219e468df7621591718224e_small.jpg";
//"show_status" = 1;
//"show_time" = 1463018044;
//"specific_catalog" = "";
//"specific_status" = 1;
//subject = "";
//"vertical_src" = "http://staticlive.douyutv.com/upload/appCovers/431179/20160510/08fc0b106219e468df7621591718224e_big.jpg";
//"vod_quality" = 0;

NS_ASSUME_NONNULL_BEGIN

@interface SDBaseLiveModel : NSObject

@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, copy) NSString *child_id;
@property (nonatomic, copy) NSString *isVertical;
@property (nonatomic, copy) NSString *nickname;  //昵称
@property (nonatomic, copy) NSString *online;   //在线人数
@property (nonatomic, copy) NSString *owner_uid;
@property (nonatomic, copy) NSString *ranktype;
@property (nonatomic, copy) NSString *room_id; //房间id
@property (nonatomic, copy) NSString *room_name; //房间名称
@property (nonatomic, strong) NSURL *room_src;
@property (nonatomic, copy) NSString *show_status;  //直播状态: 1:正在直播, 0: 离线
@property (nonatomic, copy) NSString *show_time;
@property (nonatomic, copy) NSString *specific_catalog;
@property (nonatomic, copy) NSString *specific_status;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSURL *vertical_src;
@property (nonatomic, copy) NSString *vod_quality;

- (void)sayYouName;

@end

@interface SDBaseLiveBeautyModel: SDBaseLiveModel

@property (nonatomic, copy) NSString *game_name;

@end


NS_ASSUME_NONNULL_END