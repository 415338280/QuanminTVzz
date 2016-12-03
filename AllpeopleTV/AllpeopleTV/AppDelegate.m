//
//  AppDelegate.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "WelcomeViewController.h"
#import <SMS_SDK/SMSSDK.h>
 //解决自定义左上角按钮 后 导致右滑返回失效的问题
@interface AppDelegate ()
@property(nonatomic) WelcomeViewController* welcomeVC;

@property(nonatomic) UIWindow* welecomWind;

@end

@implementation AppDelegate

-(WelcomeViewController *)welcomeVC
{
    if (!_welcomeVC) {
        _welcomeVC = [WelcomeViewController new];
    }
    return _welcomeVC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   //解决自定义左上角按钮 后 导致右滑返回失效的问题
    
    [SMSSDK registerApp:@"19789bfeebab8" withSecret:@"fc97c71b37c7f53c0b6a7494f06b016b"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    [UITabBar appearance].translucent = NO;
    
    [UINavigationBar appearance].translucent = NO;
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    _window.rootViewController = [TableViewController new];
    
    NSDictionary* infoDic = [NSBundle mainBundle].infoDictionary;
    
    NSString* version = infoDic[@"CFBundleShortVersionString"];
    
    if (![[user objectForKey:@"kRunVersion"]isEqualToString:version]) {
        _welecomWind = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        _welecomWind.backgroundColor = [UIColor yellowColor];
        
        _welecomWind.hidden = NO;
        
        _welecomWind.rootViewController = self.welcomeVC;
    }
     
    return YES;
}


@end
