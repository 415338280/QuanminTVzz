//
//  MyHomeVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "MyHomeVC.h"
#import "MyTableViewController.h"
@interface MyHomeVC ()

@property(nonatomic)UIView* headView;

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
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TopView 懒加载
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
        UIButton* chat = [UIButton buttonWithType:UIButtonTypeSystem];
        [chat setImage:[UIImage imageNamed:@"ic_profile_room_25x25_"] forState:
         UIControlStateNormal];
        [_headView addSubview:chat];
        [chat mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(40);
        }];
        //  设置
        UIButton* set = [UIButton buttonWithType:UIButtonTypeSystem];
        [set setImage:[UIImage imageNamed:@"btn_nav_search_selected_25x25_"] forState:UIControlStateNormal];
        [_headView addSubview: set];
        [set mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.top.equalTo(40);
        }];
        // 点我登录
        UIButton* info = [UIButton buttonWithType:UIButtonTypeSystem];
        [_headView addSubview:info];
        [info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            CGFloat higt = USHigt * 300 / 1135;
            make.top.equalTo(higt);
        }];
        NSAttributedString* att = [[NSAttributedString alloc]initWithString:@"点我登录" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [info setAttributedTitle:att forState:UIControlStateNormal];
        
        
    }
    return _headView;
}
#pragma mark - Table view data source


@end
