//
//  AppDelegate+ZX.h
//  AllpeopleTV
//
//  Created by tarena on 16/12/2.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (ZX)
- (void)configSystem;

//获取当前应用程序单例
+ (AppDelegate *)sharedAppDelegate;

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window;
@end
