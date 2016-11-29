//
//  HeadHomePageModel.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/29.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "HeadHomePageModel.h"

@implementation HeadHomePageModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"iosfocus":@"HeadHomeiosModel"};
}

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"iosfocus":@"ios-focus",@"iosfocustest":@"ios-focus-test"};
}

@end

@implementation HeadHomeiosModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"link_object":@"linkObject",@"id":@"idField"};
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"linkObject":@"HeadlinkObjectModel"};
}
@end

@implementation HeadlinkObjectModel



@end
