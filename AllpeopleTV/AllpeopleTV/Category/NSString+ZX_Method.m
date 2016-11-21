//
//  NSString+ZX_Method.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "NSString+ZX_Method.h"

@implementation NSString (ZX_Method)
-(NSURL *)ZX_URL
{
    return [NSURL URLWithString:self];
}

@end
