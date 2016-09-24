//
//  SDHomepageContentCollectionViewCell.m
//  DouYu
//
//  Created by shendong on 16/5/11.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDHomepageContentCollectionViewCell.h"

@interface SDHomepageContentCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *nickNameLable;
@property (weak, nonatomic) IBOutlet UILabel *onLineLable;


@end

@implementation SDHomepageContentCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.cornerRadius = 10;
    self.clipsToBounds      = YES;
}
- (void)configureDetails:(NSDictionary *)dictionary{
    [self.imageView sd_setImageWithURL:dictionary[@"SDBrandcastModelUrl"] placeholderImage:[UIImage imageNamed:@"icon_honor3"]];
    [self.nickNameLable setTitle:dictionary[@"SDBrandcastModelNickName"] forState:UIControlStateNormal];
    long long onlineNum = [dictionary[@"SDBrandcastModelOnline"] longLongValue];
    self.onLineLable.text = onlineNum > 10000 ? [NSString stringWithFormat:@"%.1lf万在线",(double)onlineNum/10000] : [NSString stringWithFormat:@"%ld在线",(long)onlineNum];
}
@end
