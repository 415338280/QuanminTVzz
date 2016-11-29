//
//  NetManager.h
//  Day06_Heros
//
//  Created by tarena on 2016/11/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"
#import "liveRoomModel.h"
#import "HomePageModel.h"
#import "HeadHomePageModel.h"
typedef void(^Myblock)(id * model,NSError* error);


@interface NetManager : BaseNetManager
+getLiveModelWithPage:(NSInteger)page CompletionHandeler:(void(^)(liveModel* model,NSError* error))completionHandeler;
+getProgramaModelCompletionHandeler:(void(^)(programaModel* Model,NSError* error))completionHandeler;
+getLiveTVModelWithslug:(NSString*)slug WithPage:(NSInteger)page completionHandeler:(void(^)(liveModel* model,NSError* error))completionHandeler;
+getLiveRoomWithPath:(NSString*)path completionHandeler:(void(^)(liveRoomModel* Model,NSError* error))completionHandeler;
//获取首页数据
+getHomePageCompletionHandeler:(void(^)(HomePageModel* Model,NSError* error))completionHandeler;
// 获取首页头部视图数据
+getHeadHomePageCompletionHandeler:(void(^)(HeadHomePageModel* Model,NSError* error))completionHandeler;
@end











