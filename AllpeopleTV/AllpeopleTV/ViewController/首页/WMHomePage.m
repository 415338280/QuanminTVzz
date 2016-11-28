//
//  WMHomePage.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "WMHomePage.h"
#import "homepageVC.h"
@interface WMHomePage ()

@end

@implementation WMHomePage

-(NSArray<NSString *> *)titles
{
    return @[@"推荐",@"全部",@"颜值控",@"全民新秀",@"全民户外",@"英雄联盟",@"炉石传说",@"守望先锋",@"QQ飞车",@"王者荣耀",@"手游专区"];
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}
-(NSString*)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    return self.titles[index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    homepageVC* _homeVC = [[homepageVC alloc]init];
    _homeVC = [homepageVC new];
    
    return _homeVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
