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
    self.navigationItem.title = @"";
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"img_nav_logo_77x20_"] style:0 target:nil action:nil];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"btn_nav_open_ani_sc_normal副本" ofType:@"gif"];
    NSData * gifdata = [NSData dataWithContentsOfURL:path.ZX_URL];
    UIImage* gifImage = [UIImage imageWithSmallGIFData:gifdata scale:3];
    //    UIImageView* image = [[UIImageView alloc]initWithImage:gifImage];
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton* btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:gifImage forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25_"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"btn_nav_search_selected_25x25_"] forState:UIControlStateHighlighted];
    [btn2 setImage:[UIImage imageNamed:@"btn_nav_gz_normal_25x25_"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"btn_nav_gz_selected_25x25_"] forState:UIControlStateHighlighted];
    [btn1 setImage:gifImage forState:UIControlStateNormal];
    UIBarButtonItem *btn_3 = [[UIBarButtonItem alloc]initWithCustomView:btn3];
    UIBarButtonItem *btn_2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    UIBarButtonItem *btn_1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem* fix = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = 15;
    btn1.frame = CGRectMake(0, 0, 25, 25);
    btn2.frame = CGRectMake(0, 0, 25, 25);
    btn3.frame = CGRectMake(0, 0, 25, 25);
    self.navigationItem.rightBarButtonItems = @[btn_3, fix, btn_2, fix, btn_1];
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
