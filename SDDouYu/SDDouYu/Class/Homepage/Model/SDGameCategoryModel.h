//
//  SDGameCategoryModel.h
//  SDDouYu
//
//  Created by shendong on 16/5/17.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
//"broadcast_limit" = 3;
//"cate_id" = 1;
//count = 16;
//"count_ios" = 2;
//"icon_name" = "7067a36221a5c2c7aa97f80959c024f1.jpg";
//"icon_url" = "http://staticlive.douyutv.com/upload/game_cate/7067a36221a5c2c7aa97f80959c024f1.jpg";
//"is_del" = 0;
//"is_game_cate" = 1;
//"is_relate" = 1;
//"night_rank_score" = 0;
//nums = 0;
//orderdisplay = 579;
//"pic_name" = "b7d8d989b0d0447c44f114f9f2a44da0.jpg";
//"pic_url" = "http://staticlive.douyutv.com/upload/game_cate/b7d8d989b0d0447c44f114f9f2a44da0.jpg";
//"push_home" = 1;
//"push_ios" = 1;
//"push_qqapp" = 1;
//"push_vertical_screen" = 0;
//"rank_score" = 0;
//"short_name" = wyqy;
//"tag_id" = 62;
//"tag_name" = "\U7f51\U6e38\U524d\U77bb";
//url = "/directory/game/wyqy";
@interface SDGameCategoryModel : NSObject

@property (nonatomic, copy) NSString *broadcast_limit;
@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *count_ios;
@property (nonatomic, copy) NSString *icon_name;
@property (nonatomic, copy) NSString *icon_url;
@property (nonatomic, copy) NSString *is_del;
@property (nonatomic, copy) NSString *is_game_cate;
@property (nonatomic, copy) NSString *is_relate;
@property (nonatomic, copy) NSString *night_rank_score;
@property (nonatomic, copy) NSString *nums;
@property (nonatomic, copy) NSString *orderdisplay;
@property (nonatomic, copy) NSString *pic_name;
@property (nonatomic, copy) NSString *pic_url;
@property (nonatomic, copy) NSString *push_home;
@property (nonatomic, copy) NSString *push_ios;
@property (nonatomic, copy) NSString *push_qqapp;
@property (nonatomic, copy) NSString *push_vertical_screen;
@property (nonatomic, copy) NSString *rank_score;
@property (nonatomic, copy) NSString *short_name;
@property (nonatomic, copy) NSString *tag_id;
@property (nonatomic, copy) NSString *tag_name;
@property (nonatomic, copy) NSString *url;

@end
