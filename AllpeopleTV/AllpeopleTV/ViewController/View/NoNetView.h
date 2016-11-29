//
//  NoNetView.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/29.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoNetView : UIView
-(id)initWithRefreshBlock:(void(^)())block;
@property(nonatomic, copy) void(^RefreshBlock)();
@end
