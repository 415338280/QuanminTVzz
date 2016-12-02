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
// 首页数据链接
#define kHomePath  @"http://www.quanmin.tv/json/app/index/recommend/list-iphone.json?1127105609"
// 首页滚动栏链接
#define kHeadHomePath @"http://www.quanmin.tv/json/page/app-data/info.json"

// 屏幕宽和高
#define USWidh  [UIScreen mainScreen].bounds.size.width
#define USHigt  [UIScreen mainScreen].bounds.size.height
//   
#define kAppDelegate  ((AppDelegate *)[UIApplication sharedApplication].delegate)

#endif /* Constant_h */
