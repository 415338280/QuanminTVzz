//
//  NetManager.h
//  Day06_Heros
//
//  Created by tarena on 2016/11/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"
typedef void(^Myblock)(NSArray<liveModel*>* model,NSError* error);


@interface NetManager : BaseNetManager
+getLiveModelWithPage:(NSString*)page CompletionHandeler:(Myblock)completionHandeler;

@end











