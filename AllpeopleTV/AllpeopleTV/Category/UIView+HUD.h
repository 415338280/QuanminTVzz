//
//  UIView+HUD.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
- (void)showHUD;

- (void)hideHUD;
- (void)showMsg:(NSString *)msg;
@end
