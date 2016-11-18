//
//  TableViewController.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "TableViewController.h"
#import "homepageVC.h"
#import "programaVC.h"
#import "liveVC.h"
#import "MyHomeVC.h"
@interface TableViewController ()
@property(nonatomic)homepageVC* homeVC;
@property(nonatomic)programaVC* programaVC;
@property(nonatomic)liveVC*     liveVC;
@property(nonatomic)MyHomeVC* MyHomeVC;
@end

@implementation TableViewController
-(homepageVC *)homeVC
{
    if (!_homeVC) {
        _homeVC = [[homepageVC alloc]initWithStyle:UITableViewStyleGrouped];
        _homeVC.title = @"首页";
        _homeVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_home_normal_25x25_"];
        _homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_home_selected_25x25_"];
    }
    return _homeVC;
}
-(programaVC*)programaVC
{
    if (!_programaVC) {
        _programaVC = [programaVC new];
        _programaVC.title  = @"栏目";
        _programaVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_lanmu_normal_25x25_"];
        _programaVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_lanmu_selected_25x25_"];
    }
    return _programaVC;
}
-(liveVC *)liveVC
{
    if (!_liveVC) {
        _liveVC = [liveVC new];
        _liveVC.title = @"直播";
        _liveVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_wode_normal_25x25_"];
        _liveVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_wode_selected_25x25_"];
    }
    return _liveVC;
}
-(MyHomeVC *)MyHomeVC
{
    if (!_MyHomeVC) {
        _MyHomeVC = [MyHomeVC new];
        _MyHomeVC.view.backgroundColor = [UIColor yellowColor];
        _MyHomeVC.title = @"我的";
        _MyHomeVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_zhibo_normal_25x25_"];
         _MyHomeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_zhibo_selected_25x25_"];
    }
    return _MyHomeVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController* navi0 = [[UINavigationController alloc]initWithRootViewController:self.homeVC];
    UINavigationController* navi1 = [[UINavigationController alloc]initWithRootViewController:self.programaVC];
    UINavigationController* navi2 = [[UINavigationController alloc]initWithRootViewController:self.liveVC];
    UINavigationController* navi3 = [[UINavigationController alloc]initWithRootViewController:self.MyHomeVC];
    self.viewControllers = @[navi0, navi1, navi2, navi3];
    [[UITabBar appearance]setTintColor:[UIColor redColor]];
   // [[UIBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
   // [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    //[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateSelected];
    
    
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
