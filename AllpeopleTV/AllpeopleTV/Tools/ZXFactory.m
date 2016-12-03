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
    [btn setBackgroundImage:[UIImage imageNamed:@"navigationBar_backButton_icon_30x30_"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"navigationBar_backButton_pressIcon_30x30_"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 45);
    // 修复距离按钮   杠杆...
    UIBarButtonItem* fixitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixitem.width = -15;
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.leftBarButtonItems = @[fixitem,item];
}
+(void)addSearchItemToVC:(UIViewController *)vc action:(void (^)())handler
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25_"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nav_search_selected_25x25_"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 25, 25);
    [btn bk_addEventHandler:^(id sender) {
        
        !handler ?: handler();
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.rightBarButtonItem = item;

}
+ (void)addGobackItemToVC:(UIViewController*)vc
{
    // 退出按钮
    UIButton* goback = [UIButton buttonWithType:UIButtonTypeSystem];
    [goback setBackgroundImage:[UIImage imageNamed:@"btn_player_popover_close_35x35_"] forState:UIControlStateNormal];
    goback.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem* gobackbtn = [[UIBarButtonItem alloc]initWithCustomView:goback];
    UIBarButtonItem* wixbtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    wixbtn.width = -15;
    vc.navigationItem.leftBarButtonItems = @[wixbtn,gobackbtn];
    [goback bk_addEventHandler:^(id sender) {
        [vc dismissViewControllerAnimated:YES completion:^{
        }];
    } forControlEvents:UIControlEventTouchUpInside];
}

@end
