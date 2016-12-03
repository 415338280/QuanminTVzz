//
//  registerVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "registerVC.h"

#import "RegisteredVC.h"

@interface registerVC ()

@property (weak, nonatomic) IBOutlet UITextField *userCount;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
//隐藏密码
@property (weak, nonatomic) IBOutlet UIButton *hidePassWord;
//登录
@property (weak, nonatomic) IBOutlet UIButton *enter;
//忘记密码
@property (weak, nonatomic) IBOutlet UIButton *forget;

@end

@implementation registerVC
#pragma mark ----- 懒加载



#pragma  mark ----- life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    // 注册按钮
    UIButton* but = [UIButton buttonWithType:UIButtonTypeSystem];
    [but setTitle:@"注册" forState:UIControlStateNormal];
    but.layer.borderColor = [UIColor redColor].CGColor;
    but.layer.borderWidth = 2;
    but.layer.cornerRadius = 18;
    but.tintColor = [UIColor redColor];
    CGFloat higt = USHigt * 55 / 1135;
    CGFloat widh = USWidh * 120 / 640;
    but.frame = CGRectMake(0, 0, widh, higt);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:but];
    [ZXFactory addGobackItemToVC:self];
  
    // 关联点击事件
    [but bk_addEventHandler:^(id sender) {
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        RegisteredVC* vc = [sb instantiateViewControllerWithIdentifier:@"RegisteredVC"];
        vc.title = @"手机注册";
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
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
