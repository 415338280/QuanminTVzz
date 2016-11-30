//
//  UIScrollView+Refresh.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)
- (void)configHeader;
- (void)addHeaderRefresh:(void(^)())block;
- (void)endHeaderRefresh;
- (void)beginHeaderRefresh;

- (void)addFooterRefresh:(void(^)())block;
- (void)endFooterRefresh;
- (void)endFooterRefreshWithNoMoreData;
@end
