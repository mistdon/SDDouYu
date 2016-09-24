//
//  SDLoginViewController.m
//  SDDouYu
//
//  Created by shendong on 16/7/18.
//  Copyright © 2016年 com.sybercare.enterprise. All rights reserved.
//

#import "SDLoginViewController.h"
#import "SDLoginViewModel.h"
#import "SDNetworkService.h"

@interface SDLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic,strong) SDLoginViewModel *loginViewModel;
@end

@implementation SDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindWithViewModel];
}
- (void)bindWithViewModel{
    self.loginViewModel = [SDLoginViewModel new];
    RAC(self.loginViewModel, nickname) = self.nicknameTextField.rac_textSignal;
    RAC(self.loginViewModel, password) = self.passwordTextField.rac_textSignal;
    [self.loginViewModel.loginSignal subscribeNext:^(id x) {
        self.loginButton.enabled = [x boolValue];
    }];
    self.loginButton.rac_command = self.loginViewModel.loginCommand;
    [[[self.loginViewModel.loginCommand executionSignals] switchToLatest] subscribeNext:^(id x) {
         NSLog(@"x  = %@",x);
    }];
    [[self.loginViewModel.loginCommand errors] subscribeNext:^(id x) {
        NSLog(@"error = %@",x);
    }];
    
    [[[SDNetworkService shared] requestFromNetWork:nil params:nil] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    } error:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}
- (IBAction)dismissAction:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}
@end
