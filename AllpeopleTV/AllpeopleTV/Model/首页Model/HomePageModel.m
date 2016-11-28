//
//  HomePageModel.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"room":@"HomePageroomModel"};
}

@end

@implementation HomePageroomModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"id":@"idField"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"HomePageroomlistModel"};
}
@end

@implementation HomePageroomlistModel



@end
