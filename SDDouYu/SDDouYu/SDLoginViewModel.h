//
//  SDLoginViewModel.h
//  SDDouYu
//
//  Created by shendong on 16/7/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACCommand;
@interface SDLoginViewModel : NSObject
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy, readonly) NSString *nicknamePlaceholder;
@property (nonatomic,copy, readonly) NSString *passwordPlaceholder;
@property (nonatomic,strong) RACSignal *loginSignal;
@property (nonatomic,strong) RACCommand *loginCommand;
@end
