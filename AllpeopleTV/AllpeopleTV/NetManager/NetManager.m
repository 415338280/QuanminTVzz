//
//  NetManager.m
//  Day06_Heros
//
//  Created by tarena on 2016/11/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"



@implementation NetManager
+getLiveModelWithPage:(NSInteger)page CompletionHandeler:(void(^)(liveModel* model,NSError* error))completionHandeler;
{
    NSString* str = nil;
    if (page) {
         str = [NSString stringWithFormat:@"_%@",@(page)];
    }str = @"";
    NSString* path = [NSString stringWithFormat:kLivePath,str];
    NSLog(@"------%@-------",path);
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler([liveModel parse:responseObj],error);
    }];
}
@end









