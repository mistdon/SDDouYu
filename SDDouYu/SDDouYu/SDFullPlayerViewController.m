//
//  SDFullPlayerViewController.m
//  SDDouYu
//
//  Created by shendong on 16/9/23.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDFullPlayerViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface SDFullPlayerViewController ()

@property (nonatomic, strong) id<IJKMediaPlayback> player;
@property (nonatomic, strong) UIView *PlayerView;
@end

@implementation SDFullPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.liveUrl = [NSURL URLWithString:@"http:\/\/hdl3a.douyucdn.cn\/live/209225rhw54sEpcR.flv?wsAuth=9038982f5d95521ae28d66a905737ed0&token=app-ios-0-209225-17be86b126c997d43c8e5b605bda339a&logo=0&expire=0&did=ED961303222942ABBEF0C6A3D90EFD44"];
    
//    self.liveUrl = [NSURL URLWithString:@"http://pull99.a8.com/live/1474624802437931.flv?ikHost=ws&ikOp=1&CodecInfo=8192"];
//    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:self.liveUrl withOptions:[IJKFFOptions optionsByDefault]];
    [[self.player view] setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [[self.player view] setFrame:self.view.bounds];
    [self.player setScalingMode:IJKMPMovieScalingModeFill];
    [self.player setShouldAutoplay:YES];
    self.view.autoresizesSubviews = YES;
    [self.view addSubview:[self.player view]];
    
    
    /*
     viewWillAppear : prepareToPlay
     viewWillDisappear :  shutdown
     
     */
    
    
    
    //1. 获取room里面的信息
    /*
      V1
         room
        http://capi.douyucdn.cn/api/v1/room/209225?aid=ios&client_sys=ios&ne=1&support_pwd=1&time=1474626240&auth=36cab0145d3405d974b0dab2346a2250
        
        根据返回的信息中拼接live.url
     
     
     
     rtmp_url
     */
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.player prepareToPlay];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.player shutdown];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"frame = %@", NSStringFromCGRect([self.player view].frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
