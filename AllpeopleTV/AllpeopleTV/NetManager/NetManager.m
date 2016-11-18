//
//  NetManager.m
//  Day06_Heros
//
//  Created by tarena on 2016/11/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"



@implementation NetManager
+getLiveModelWithPage:(NSString*)page CompletionHandeler:(Myblock)completionHandeler;
{
   
        NSString *path = [NSString stringWithFormat:kLivePath,page];
 
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler([liveModel pares:responseObj],error);
    }];
    
}
@end









