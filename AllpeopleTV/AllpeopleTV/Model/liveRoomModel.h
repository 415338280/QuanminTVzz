//
//  liveRoomModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RoomLiveModel, RoomLiveWsModel, RoomLiveWsHlsModel, RoomLiveWsHlsThreeModel,RoomLivehighdefinitionModel,RoomLivesuperfinitionModel,RoomLiveWsflvModel,RoomLiveWssuperflvModel,RoomLivesuperfinitionzeroModel;

@interface RoomModel : NSObject
@property (nonatomic, strong) NSArray * admins;
@property (nonatomic, strong) NSString * announcement;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * categoryId;
@property (nonatomic, strong) NSString * categoryName;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, assign) BOOL forbidStatus;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, strong) NSArray * hotWord;
@property (nonatomic, strong) NSString * intro;
@property (nonatomic, assign) BOOL isStar;
@property (nonatomic, strong) NSString * lastPlayAt;
@property (nonatomic, strong) RoomLiveModel * live;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSArray * notice;
@property (nonatomic, strong) NSString * playAt;
@property (nonatomic, assign) BOOL playStatus;
@property (nonatomic, assign) BOOL policeForbid;
@property (nonatomic, strong) NSArray * rankCurr;
@property (nonatomic, strong) NSArray * rankTotal;
@property (nonatomic, strong) NSArray * rankWeek;
@property (nonatomic, strong) NSArray * roomLines;
@property (nonatomic, strong) NSString * screen;
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, strong) NSObject * special;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * video;
@property (nonatomic, strong) NSString * videoQuality;
@property (nonatomic, assign) NSInteger view;
@property (nonatomic, assign) BOOL warn;
@property (nonatomic, assign) NSInteger watermark;
@property (nonatomic, strong) NSString * watermarkPic;
@property (nonatomic, assign) NSInteger weight;
@end

@interface RoomLiveModel : NSObject
@property (nonatomic, strong) RoomLiveWsModel * ws;
@end

@interface RoomLiveWsModel : NSObject
@property (nonatomic, strong) NSString * defMobile;
@property (nonatomic, strong) NSString * defPc;
@property (nonatomic, strong) RoomLiveWsHlsModel * hls;
@property (nonatomic, strong) RoomLiveWsflvModel * flv;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger v;
@end

@interface RoomLiveWsflvModel : NSObject

@property (nonatomic, strong) RoomLiveWssuperflvModel * superflv;

@property (nonatomic, strong) NSString * main_mobile;

@property (nonatomic, strong) NSString * main_pc;

@end

@interface RoomLiveWssuperflvModel : NSObject

@property (nonatomic, strong) NSString * name;

@property (nonatomic, strong) NSString * src;

@end

@interface RoomLiveWsHlsModel : NSObject
@property (nonatomic, strong) RoomLiveWsHlsThreeModel * standrandQuality;
@property (nonatomic, strong) RoomLivehighdefinitionModel * highdefinition;
@property (nonatomic, strong) RoomLivesuperfinitionModel * superfinition;
@property (nonatomic, strong) RoomLivesuperfinitionzeroModel * superfinitionzero;

@property (nonatomic, assign) NSInteger mainMobile;
@property (nonatomic, assign) NSInteger mainPc;
@end

@interface RoomLivesuperfinitionzeroModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * src;

@end

@interface RoomLiveWsHlsThreeModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * src;

@end

@interface RoomLivehighdefinitionModel : NSObject

@property (nonatomic, strong) NSString * highdename;
@property (nonatomic, strong) NSString * highdesrc;

@end

@interface RoomLivesuperfinitionModel : NSObject

@property (nonatomic, strong) NSString * supername;
@property (nonatomic, strong) NSString * supersrc;

@end

