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
    self.headView = [UIView new];
    _headView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:78 / 255.0 blue:81 / 255.0 alpha:1.0];
    [self.view addSubview:_headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        CGFloat high = USHigt * 685 / 2200;
        make.height.equalTo(high);
    }];
    
    UIStoryboard* sy  = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    MyTableViewController* myVC = [sy instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    [self addChildViewController:myVC];
    [self.view addSubview:myVC.tableView];
    myVC.tableView.backgroundColor = [UIColor colorWithRed:232 / 255.0 green:234 / 255.0 blue:240 / 255.0  alpha:1];   [myVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.bottom.equalTo(0);
       make.top.equalTo(_headView.mas_bottom);
    }];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


@end
