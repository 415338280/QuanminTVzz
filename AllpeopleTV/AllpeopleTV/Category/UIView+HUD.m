//
//  UIView+HUD.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
-(void)showHUD
{
    [self hideHUD];
    MBProgressHUD*  hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hideAnimated:YES afterDelay:30];
    hud.mode = MBProgressHUDModeCustomView;
    
}
-(void)hideHUD
{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}
- (void)showMsg:(NSString *)msg{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1.5];
}
@end
