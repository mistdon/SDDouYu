//
//  SDCollectionViewCellTypeTwo.m
//  
//
//  Created by shendong on 16/5/14.
//
//

#import "SDCollectionViewCellTypeTwo.h"
#import "SDBaseLiveModel.h"
#import "SDGameCategoryModel.h"


@interface SDCollectionViewCellTypeTwo()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *accountLable;

@end
@implementation SDCollectionViewCellTypeTwo

- (void)awakeFromNib {
    // Initialization code
}
- (void)configureDetails:(NSDictionary *)dictionary{
    [self.backgroundImageView sd_setImageWithURL:dictionary[@"SDBrandcastModelUrl"] placeholderImage:[UIImage imageNamed:@"icon_hornor2"]];
    self.accountLable.text = dictionary[@"SDBrandcastModelNickName"];
    
}
- (void)bindDataWithModel:(SDBaseLiveModel *)basemodel{
    NSLog(@"s1111111");
    [self.backgroundImageView sd_setImageWithURL:basemodel.room_src placeholderImage:PLACEHOLDER_IMAGE];
    self.accountLable.text = basemodel.nickname;
}
- (void)bindDataWithGameCategoryModel:(SDGameCategoryModel *)basemodel{
//    self.backgroundImageView sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#>
}
@end
