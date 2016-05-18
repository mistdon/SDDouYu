//
//  SDCollectionViewCellTypeTwo.h
//  
//
//  Created by shendong on 16/5/14.
//
//

#import <UIKit/UIKit.h>


@class SDBaseLiveModel;
@class SDGameCategoryModel;

@interface SDCollectionViewCellTypeTwo : UICollectionViewCell

- (void)configureDetails:(NSDictionary *)dictionary;

- (void)bindDataWithModel:(SDBaseLiveModel *)basemodel;

- (void)bindDataWithGameCategoryModel:(SDGameCategoryModel *)basemodel;

@end
