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
+ (AppDelegate *)sharedAppDelegate{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   //解决自定义左上角按钮 后 导致右滑返回失效的问题
    
    //[SMSSDK registerApp:@"19789bfeebab8" withSecret:@"fc97c71b37c7f53c0b6a7494f06b016b"];
    
    
    
    
    
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


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
