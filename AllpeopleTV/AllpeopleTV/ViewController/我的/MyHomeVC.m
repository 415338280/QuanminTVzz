//
//  MyHomeVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "MyHomeVC.h"
#import "MyTableViewController.h"
#import "registerVC.h"
@interface MyHomeVC ()

@property(nonatomic) UIView* headView;
@property(nonatomic) UIImageView*  iconremid;

@property(nonatomic) UIView* remind;

@end

@implementation MyHomeVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self headView];

    
    UIStoryboard* sy  = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    MyTableViewController* myVC = [sy instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    [self addChildViewController:myVC];
    [self.view addSubview:myVC.tableView];
    [myVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.bottom.equalTo(0);
       make.top.equalTo(_headView.mas_bottom);
    }];
    
    UIView * vc = [UIView new];
    
    vc.backgroundColor = [UIColor yellowColor];
    
    myVC.tableView.tableFooterView = vc;

    [self remind];
    [self iconremid];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TopView 懒加载
// 不知道为什么这个小人会布局冲突....
-(UIImageView *)iconremid
{
    if (!_iconremid) {
        _iconremid  = [UIImageView new];
        [_iconremid setImage:[UIImage imageNamed:@"img_kaibo_75x75_@2x"]];
       
        [self.view addSubview:_iconremid];
        CGFloat widh = USWidh * 30 / 1135;
        CGFloat higt = USHigt * 32 / 1135 + 44;
        [_iconremid mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(-higt);
                make.right.equalTo(-widh);
        }];
    }
    return _iconremid;
}
-(UIView *)remind
{
    if (!_remind) {
        _remind  = [UIView new];
        [self.view addSubview:_remind];
        CGFloat higt = USHigt * 32 / 1135 + 44;
        CGFloat widh = USWidh * 30 / 1135;
        CGFloat size = USWidh * 150 / 1135;
        [_remind mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-higt);
            make.right.equalTo(-widh);
            make.size.equalTo(size);
        }];
        _remind.layer.cornerRadius = size / 2;
        _remind.clipsToBounds = YES;
        _remind.layer.borderWidth = 0.07;
        
        
      UIButton*  btnremind = [UIButton buttonWithType:UIButtonTypeSystem];
        [_remind addSubview:btnremind];
        [btnremind setBackgroundImage:[UIImage imageNamed:@"btn_tab_kaibo_normal_41x41_-1"] forState:UIControlStateNormal];
        [btnremind mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
    }
    return _remind;
}
-(UIView *)headView
{
    if (!_headView) {
        self.headView = [UIView new];
        _headView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:78 / 255.0 blue:81 / 255.0 alpha:1.0];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            CGFloat high = USHigt * 458 / 1130;
            make.height.equalTo(high);
        }];
        //聊天
        UIButton* chat = [UIButton buttonWithType:UIButtonTypeCustom];
        [chat setImage:[UIImage imageNamed:@"mine_message_icon_25x25_"] forState:
         UIControlStateNormal];
        [_headView addSubview:chat];
        [chat mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(40);
        }];
        //  设置
        UIButton* set = [UIButton buttonWithType:UIButtonTypeCustom];
        [set setImage:[UIImage imageNamed:@"mine_setting_icon_25x25_"] forState:UIControlStateNormal];
        [_headView addSubview: set];
        [set mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.top.equalTo(40);
        }];
        // 头像
        UIView* iconView = [UIView new];
        [_headView addSubview:iconView];
        CGFloat higt = USHigt * 350 / 1135;
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.centerX.equalTo(0);
            make.size.equalTo(higt);
        }];
        iconView.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:94 / 255.0 blue:98 / 255.0 alpha:.6];
        iconView.layer.cornerRadius = higt / 2;
        iconView.layer.masksToBounds = YES;
        UIImageView* round = [UIImageView new];
        CGFloat higt1 = USHigt * 230 / 1135;
        [iconView addSubview:round];
        round.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:88 / 255.0 blue:88 / 255.0 alpha:.7];
        [round mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(higt1);
        }];
        round.layer.cornerRadius = higt1    / 2;
        round.layer.masksToBounds = YES;
        UIButton * btninfo = [UIButton buttonWithType:UIButtonTypeSystem];
        [btninfo setBackgroundImage:[UIImage imageNamed:@"default_avatar_75x75_"] forState:UIControlStateNormal];
        CGFloat higt2 = USHigt * 150 / 1135;
        [round addSubview:btninfo];
        [btninfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(higt2);
        }];
        btninfo.layer.cornerRadius = higt2 / 2;
        btninfo.layer.masksToBounds = YES;
        btninfo.userInteractionEnabled = YES;
        
        // 点我登录
        UIButton* info = [UIButton buttonWithType:UIButtonTypeSystem];
        [_headView addSubview:info];
        [info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            CGFloat higt = USHigt * 300 / 1135;
            make.top.equalTo(higt);
        }];
        NSAttributedString* att = [[NSAttributedString alloc]initWithString:@"点我登录" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
        [info setAttributedTitle:att forState:UIControlStateNormal];
        [btninfo bk_addEventHandler:^(id sender) {
            
            UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
            registerVC* regVC  = [sb instantiateViewControllerWithIdentifier:@"registerVC"];
            UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:regVC];
            [self presentViewController:nav animated:YES completion:^{
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [info bk_addEventHandler:^(id sender) {
            UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
            registerVC* regVC  = [sb instantiateViewControllerWithIdentifier:@"registerVC"];
            UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:regVC];
            [self presentViewController:nav animated:YES completion:^{
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
#pragma  mark --- 登录按钮

#pragma mark - Table view data source


@end
