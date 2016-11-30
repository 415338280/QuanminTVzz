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
    UIView *hudView = [UIView new];
    [self addSubview:hudView];
    [hudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
    hudView.tag = 19090;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ani_popover_loading_yz副本" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
   UIImage *gifImage = [UIImage imageWithSmallGIFData:gifData scale:1];
    UIImageView *iconIV = [[UIImageView alloc] initWithImage:gifImage];
    [hudView addSubview:iconIV];
    [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(0);
        make.size.equalTo(100);
    }];
    UILabel *label = [UILabel new];
    label.textColor = [UIColor grayColor];
    [hudView addSubview:label];
    label.text = @"玩命加载中...";
    label.font = [UIFont systemFontOfSize:15];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(0);
        make.top.equalTo(iconIV.mas_bottom);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hudView removeFromSuperview];
    });
//    MBProgressHUD*  hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//    [hud hideAnimated:YES afterDelay:30];
//    hud.mode = MBProgressHUDModeCustomView;
    
}
-(void)hideHUD
{
    UIView *hudView = [self viewWithTag:19090];
    [hudView removeFromSuperview];
}
- (void)showMsg:(NSString *)msg{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1.5];
}
@end
