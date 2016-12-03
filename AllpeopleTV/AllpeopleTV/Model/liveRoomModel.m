//
//  liveRoomModel.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "liveRoomModel.h"

@implementation RoomModel


@end
@implementation RoomLiveModel

@end
@implementation RoomLiveWsModel

@end
@implementation RoomLiveWsflvModel



@end
@implementation RoomLiveWsHlsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"standrandQuality": @"3",@"RoomLivehighdefinitionModel": @"4",@"RoomLivesuperfinitionModel": @"5"
             ,@"superfinitionzero":@"0"};
}
@end

@implementation RoomLivesuperfinitionzeroModel


@end
@implementation RoomLiveWsHlsThreeModel



@end

@implementation RoomLivehighdefinitionModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"name":@"highdename",@"src":@"highdesrc"};
}

@end
@implementation RoomLivesuperfinitionModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"name":@"supername",@"src":@"supersrc"};
}

@end
