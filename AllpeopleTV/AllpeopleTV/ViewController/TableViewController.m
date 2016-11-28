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
#import "WMHomePage.h"
@interface TableViewController ()
@property(nonatomic)homepageVC* homeVC;
@property(nonatomic)programaVC* programaVC;
@property(nonatomic)liveVC*     liveVC;
@property(nonatomic)MyHomeVC* MyHomeVC;
@end

@implementation TableViewController
-(UICollectionViewLayout *)getlayou
{
       UICollectionViewFlowLayout *layou = [[UICollectionViewFlowLayout alloc]init];
        layou.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layou.minimumLineSpacing = 10;
        layou.minimumInteritemSpacing = 5;
        CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 25) / 2 );
    CGFloat higt = width * 40 / 57 + 30;
        layou.itemSize = CGSizeMake(width,higt);
    return layou;
}
//-(homepageVC *)homeVC
//{
//    if (!_homeVC) {
//        _homeVC = [homepageVC new];
//        _homeVC.title = @"首页";
//        _homeVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_home_normal_25x25_"];
//        _homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_home_selected_25x25_"];
//    }
//    return _homeVC;
//}
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
        _liveVC = [[liveVC alloc]initWithCollectionViewLayout:[self getlayou]];
        _liveVC.title = @"直播";
        _liveVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_wode_normal_25x25_"];
        _liveVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_wode_selected_25x25_"];
    }
    return _liveVC;
}
-(MyHomeVC *)MyHomeVC
{
    if (!_MyHomeVC) {
      //  self.navigationController.hidesBarsOnTap = YES;
        self.navigationController.hidesBarsWhenVerticallyCompact = YES;
        UIStoryboard* sy = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        _MyHomeVC = [sy instantiateViewControllerWithIdentifier:@"MyHomeVC"];
       
        _MyHomeVC.title = @"我的";
        _MyHomeVC.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_zhibo_normal_25x25_"];
         _MyHomeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_zhibo_selected_25x25_"];
    }
    return _MyHomeVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //给首页控制器 添加根控制器
    WMHomePage* WMHome = [WMHomePage new];
    WMHome.title = @"首页";
    WMHome.menuViewContentMargin = 7;
    WMHome.menuBGColor = [UIColor whiteColor];
    WMHome.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_home_normal_25x25_"];
    WMHome.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_home_selected_25x25_"];

  UINavigationController* navi0 = [[UINavigationController alloc]initWithRootViewController:WMHome];
   //设置控制器在 导航控制器下位置
    
    
    
    UINavigationController* navi1 = [[UINavigationController alloc]initWithRootViewController:self.programaVC];
    UINavigationController* navi2 = [[UINavigationController alloc]initWithRootViewController:self.liveVC];
  //  UIStoryboard* sy = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
   // UINavigationController* navi3 = [sy instantiateViewControllerWithIdentifier:@"Nav"];
   UINavigationController* navi3 = [[UINavigationController alloc]initWithRootViewController:self.MyHomeVC];
   navi3.navigationController.hidesBarsOnTap = YES;
    navi3.hidesBottomBarWhenPushed = YES;
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
