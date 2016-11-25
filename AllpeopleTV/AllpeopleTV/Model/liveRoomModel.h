//
//  liveRoomModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class liveRoomliveModel,liveRoomlivewsModel,liveRoomlivewshlsModel,hls3,hlsModel,GhlsModel;
@interface liveRoomModel : NSObject
@property(nonatomic)liveRoomliveModel* live;
@end
@interface liveRoomliveModel : NSObject
@property(nonatomic)liveRoomlivewsModel* ws;
@end

@interface  liveRoomlivewsModel: NSObject

@property(nonatomic)liveRoomlivewshlsModel* hls;

@end

@interface liveRoomlivewshlsModel : NSObject
//3->
@property(nonatomic)hls3* hls3;
@property(nonatomic)hlsModel* hlsModel;
@property(nonatomic)GhlsModel* GhlsModel;
@end

@interface hls3 : NSObject
@property(nonatomic)NSString* name;;
@property(nonatomic)NSString* src;
@end
@interface hlsModel : NSObject
@property(nonatomic)NSString* name;;
@property(nonatomic)NSString* src;
@end
@interface GhlsModel : NSObject
@property(nonatomic)NSString* name;;
@property(nonatomic)NSString* src;
@end
