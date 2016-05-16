//
//  SDCollectionViewCellTypeTwo.m
//  
//
//  Created by shendong on 16/5/14.
//
//

#import "SDCollectionViewCellTypeTwo.h"
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
@end
