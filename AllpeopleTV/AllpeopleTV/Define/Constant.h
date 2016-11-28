//
//  Constant.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define KBeasPath @"http://www.quanmin.tv"
#define kLivePath @"http://www.quanmin.tv/json/play/list_%ld.json"

#define kLivePath0 @"http://www.quanmin.tv/json/play/list.json"

#define kLiveroomPath @"http://www.quanmin.tv/json/rooms/%@/info.json"

//栏目数据连接
#define kProgramaPath @"http://www.quanmin.tv/json/categories/list.json"
//栏目二级界面连接数据
#define kLiveTvPath0   @"http://www.quanmin.tv/json/categories/%@/list.json"
#define kLiveTvPath   @"http://www.quanmin.tv/json/categories/%@/list_%ld.json"

#define kHomePath  @"http://www.quanmin.tv/json/app/index/recommend/list-iphone.json?1127105609"


// 屏幕宽和高
#define USWidh  [UIScreen mainScreen].bounds.size.width
#define USHigt  [UIScreen mainScreen].bounds.size.height
#endif /* Constant_h */
