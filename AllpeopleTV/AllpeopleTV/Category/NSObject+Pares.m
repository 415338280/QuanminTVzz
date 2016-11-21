//
//  NSObject+Pares.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "NSObject+Pares.h"

@implementation NSObject (Pares)

+ (id)parse:(id)JSON{
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:JSON];
    }
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:self.class json:JSON];
    }
    return JSON;
}

@end
