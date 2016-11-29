//
//  HeadHomePageModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/29.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HeadHomeiosModel,HeadlinkObjectModel;

@interface HeadHomePageModel : NSObject

@property (nonatomic, strong) NSArray * androidstart;
@property (nonatomic, strong) NSArray * appfocus;
@property (nonatomic, strong) NSArray * appFocusCheck;

@property(nonatomic)NSArray<HeadHomeiosModel*>* iosfocus;

// ios-focus-test iosfocustest
@property (nonatomic, strong) NSArray * iosfocustest;
@property (nonatomic, strong) NSArray * iosstart;
@property (nonatomic, strong) NSArray * iosstarttest;
@property (nonatomic, strong) NSArray * ipadstart;

@end

@interface HeadHomeiosModel : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * create_at;
//@property (nonatomic, strong) Ext * ext;
@property (nonatomic, strong) NSString * fk;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) HeadlinkObjectModel * linkObject;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) NSInteger slot_id;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * subtitle;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

@end

@interface HeadlinkObjectModel : NSObject

@end
