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
