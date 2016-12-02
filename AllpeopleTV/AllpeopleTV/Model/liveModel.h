//
//  liveModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class livedataModel,liverecommendModel;
@interface liveModel : NSObject
@property (nonatomic, strong) NSArray<livedataModel*> * data;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, strong) liverecommendModel * recommend;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger total;
@end
// data 页面.
@interface livedataModel : NSObject
@property (nonatomic, strong) NSString* avatar; //头像
@property (nonatomic, strong) NSString* title; //标题
@property (nonatomic, strong) NSString* nick; //名字
@property (nonatomic, strong) NSString* view; //人数
@property (nonatomic, strong) NSString* thumb;//图片
@property (nonatomic, strong) NSString* uid;
@property(nonatomic,  strong) NSString* category_name;
@end

@interface liverecommendModel : NSObject
@property (nonatomic, strong) NSArray<livedataModel*> * data;
@property (nonatomic, strong) NSString* icon;
@property (nonatomic, strong) NSString* name;
@end
@interface liverecommenddataModel : NSObject

@end
