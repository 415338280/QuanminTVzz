//
//  RegisteredVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/12/3.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "RegisteredVC.h"

@interface RegisteredVC ()
//获取验证码
@property (weak, nonatomic) IBOutlet UIButton *getcode;
@property (weak, nonatomic) IBOutlet UITextField *phonenumber;
@property (weak, nonatomic) IBOutlet UITextField *verifyNumber;

@end

@implementation RegisteredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ZXFactory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}
- (IBAction)Formessageauthenticationcode:(UIButton *)sender {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phonenumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        NSLog(@"%@", error ? error : @"发送成功");
    }];

}

- (IBAction)Verifypassword:(id)sender {
    [SMSSDK commitVerificationCode:_verifyNumber.text phoneNumber:_phonenumber.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        NSLog(@"%@",error ? error : @"验证成功");
    }];
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
