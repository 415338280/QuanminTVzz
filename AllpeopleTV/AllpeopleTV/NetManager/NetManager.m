//
//  NetManager.m
//  Day06_Heros
//
//  Created by tarena on 2016/11/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"

#import "liveRoomModel.h"


@implementation NetManager
+getLiveModelWithPage:(NSInteger)page CompletionHandeler:(void(^)(liveModel* model,NSError* error))completionHandeler;
{
    NSString* path = nil;
    if (page) {
         path = [NSString stringWithFormat:kLivePath,page];
    }path = kLivePath0;

    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler([liveModel parse:responseObj],error);
    }];
}
+(id)getProgramaModelCompletionHandeler:(void (^)(programaModel *, NSError *))completionHandeler
{
    return [self GET:kProgramaPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler ([programaModel parse:responseObj],error);
    }];
}
+(id)getLiveTVModelWithslug:(NSString*)slug WithPage:(NSInteger)page completionHandeler:(void(^)(liveModel* model,NSError* error))completionHandeler
{
    NSString* path = nil;
    if (page) {
        path = [NSString stringWithFormat:kLiveTvPath,slug,page];
    }
    path = [NSString stringWithFormat:kLiveTvPath0,slug];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler([programaModel parse:responseObj],error);
    }];
}

+(id)getLiveRoomWithPath:(NSString *)path completionHandeler:(void (^)(liveRoomModel *, NSError *))completionHandeler
{
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler([liveRoomModel parse:responseObj],error);
    }];
    
}

@end









