//
//  programaModel.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface programaModel : NSObject

@property (nonatomic, strong) NSString * firstLetter;
// id ---> idField
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
/****
 **
 **   名字
 **
 **
 ****/
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) NSInteger prompt;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, assign) NSInteger status;
/****
 **
 **   图片
 **
 **
 ****/
@property (nonatomic, strong) NSString * thumb;

@end
