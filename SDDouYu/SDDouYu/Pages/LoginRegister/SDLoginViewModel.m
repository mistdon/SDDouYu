//
//  SDLoginViewModel.m
//  SDDouYu
//
//  Created by shendong on 16/7/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDLoginViewModel.h"

@implementation SDLoginViewModel

- (RACSignal *)loginSignal{
    return [[RACSignal combineLatest:@[RACObserve(self, nickname), RACObserve(self, password)] reduce:^id(NSString *name, NSString *word){
        return @([self validNickname:name] && [self validPassword:word]);
    }] distinctUntilChanged];
}
- (RACCommand *)loginCommand{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc] initWithEnabled:self.loginSignal signalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                [subscriber sendNext:@"登录的信息"];
//                [subscriber sendCompleted];
                [subscriber sendError:[NSError errorWithDomain:@"SDDouYu" code:1001 userInfo:nil]];
                return nil;
            }];
        }];
    }
    return _loginCommand;
}

- (BOOL)validNickname:(NSString *)nickname{
    return nickname.length > 0;
}
- (BOOL)validPassword:(NSString *)password{
    return password.length > 0;
}
@end
