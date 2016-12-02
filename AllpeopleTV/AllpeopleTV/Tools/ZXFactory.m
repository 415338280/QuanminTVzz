//
//  ZXFactory.m
//  AllpeopleTV
//
//  Created by tarena on 16/12/2.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "ZXFactory.h"

@implementation ZXFactory

+(void)addBackItemToVC:(UIViewController *)vc
{
      //如果barButtonItem 上方有两个图,  高亮+普通,那就只能自定义一个按钮,把按钮放到barButtonItem上.   因为其默认是系统的只支持默认的一张图 .高亮的时候它会决定变化程度.
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_nav_hp_player_back_normal_30x30"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"btn_nav_hp_player_back_selected_30x30"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 20, 20);
    // 修复距离按钮   杠杆...
    UIBarButtonItem* fixitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixitem.width = -15;
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.leftBarButtonItems = @[fixitem,item];
}
-(void )createWithBlock:(void (^)())block andItemToVc:(UIViewController *)vc
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_nav_search_selected_25x25"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 35, 35);
 
    [btn bk_addEventHandler:^(id sender) {
        
        self.function ?: self.function();
        
    } forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem* fixitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixitem.width = 15;
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.rightBarButtonItem = item;
 

}

+(void)addSearchItemToVC:(UIViewController *)vc action:(void (^)())handler
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25_-2"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_nav_search_selected_25x25_-2"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn bk_addEventHandler:^(id sender) {
        
        !handler ?: handler();
        
    } forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem* fixitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        fixitem.width = 15;
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.rightBarButtonItem = item;

}

@end
