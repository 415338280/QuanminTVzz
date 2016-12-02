//
//  AppDelegate+ZX.m
//  AllpeopleTV
//
//  Created by tarena on 16/12/2.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "AppDelegate+ZX.h"
#import <MLTransition.h>
@implementation AppDelegate (ZX)
-(void)configSystem
{
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
}
@end
