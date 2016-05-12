//
//  SDBrandcastModel.h
//  DouYu
//
//  Created by shendong on 16/5/12.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
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
@interface SDBrandcastModel : NSObject

@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, copy) NSString *child_id;
@property (nonatomic, copy) NSString *isVertical;
@property (nonatomic, copy) NSString *nickname;  //昵称
@property (nonatomic, copy) NSString *online;   //在线人数
@property (nonatomic, copy) NSString *owner_uid;
@property (nonatomic, copy) NSString *ranktype;
@property (nonatomic, copy) NSString *room_id; //房间id
@property (nonatomic, copy) NSString *room_name; //房间名称
@property (nonatomic, copy) NSString *room_src;
@property (nonatomic, copy) NSString *show_status;  //直播状态: 1:正在直播, 0: 离线
@property (nonatomic, copy) NSString *show_time;
@property (nonatomic, copy) NSString *specific_catalog;
@property (nonatomic, copy) NSString *specific_status;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *vertical_src;
@property (nonatomic, copy) NSString *vod_quality;

@end
