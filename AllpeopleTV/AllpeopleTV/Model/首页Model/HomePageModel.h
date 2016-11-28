//
//  HomePageModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomePageroomModel,HomePageroomlistModel;
@interface HomePageModel : NSObject

@property (nonatomic, strong) NSArray * ad;
@property (nonatomic, strong) NSArray<HomePageroomModel*> * room;

@end

@interface HomePageroomModel : NSObject

@property (nonatomic, strong) NSString * category_more;
//id ->
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger is_default;
@property (nonatomic, strong) NSArray<HomePageroomlistModel*> * list;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, assign) NSInteger type;

@end

@interface HomePageroomlistModel : NSObject
@property (nonatomic, assign) NSInteger anniversary;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * beauty_cover;
@property (nonatomic, assign) NSInteger category_id;
@property (nonatomic, strong) NSString * category_name;
@property (nonatomic, strong) NSString * category_slug;
@property (nonatomic, assign) BOOL check;
@property (nonatomic, assign) NSInteger coin;
@property (nonatomic, strong) NSString * create_at;
@property (nonatomic, strong) NSObject * default_image;
@property (nonatomic, strong) NSString * first_play_at;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, assign) NSInteger grade;
@property (nonatomic, strong) NSString * icontext;
@property (nonatomic, assign) BOOL is_shield;
@property (nonatomic, strong) NSString * last_end_at;
@property (nonatomic, strong) NSString * last_play_at;
@property (nonatomic, strong) NSString * last_thumb;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * loveCover;
@property (nonatomic, assign) NSInteger maxView;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, assign) NSInteger play_count;
@property (nonatomic, assign) BOOL play_status;
@property (nonatomic, assign) NSInteger play_true;
@property (nonatomic, strong) NSObject * recommendImage;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * video;
@property (nonatomic, strong) NSString * view;
@property (nonatomic, assign) NSInteger weight;

@end
