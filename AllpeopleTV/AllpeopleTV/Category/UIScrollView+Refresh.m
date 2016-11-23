//
//  UIScrollView+Refresh.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block

    {
        NSArray* images = @[[UIImage imageNamed:@"img_top_refresh_gy1"],[UIImage imageNamed:@"img_top_refresh_gy2"],[UIImage imageNamed:@"img_top_refresh_gy3"],[UIImage imageNamed:@"img_top_refresh_gy4"],[UIImage imageNamed:@"img_top_refresh_gy5"],[UIImage imageNamed:@"img_top_refresh_gy6"]];
        MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingBlock:block];
        [header setImages:images forState:MJRefreshStateIdle];
        [header setImages:images forState:MJRefreshStatePulling];
        [header setImages:images forState:MJRefreshStateRefreshing];
        self.mj_header = header;
    }

- (void)endHeaderRefresh
{
    [self.mj_header endRefreshing];
}

- (void)beginHeaderRefresh
{
    [self.mj_header beginRefreshing];
}


- (void)addFooterRefresh:(void(^)())block
{
    NSArray* image = @[[UIImage imageNamed:@"bubble_0_57x63_"]];
    NSMutableArray* images = [NSMutableArray new];
    for (int i = 1; i < 19; i++ ) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"bubble_%d_57x63_",i]];
        [images addObject:image];
    }
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:block];
    
    [footer setImages:image forState:MJRefreshStatePulling];
    [footer setImages:image forState:MJRefreshStateIdle];
    [footer setImages:image forState:MJRefreshStateRefreshing];
    self.mj_footer = footer;
//     CGPoint = self.
//  CGPoint point =  self.contentOffset;
//    if (<#condition#>) {
//        <#statements#>
//    }
 
}
- (void)endFooterRefresh
{
     [self.mj_footer endRefreshing];
}

- (void)endFooterRefreshWithNoMoreData;
{
     [self.mj_footer endRefreshingWithNoMoreData];
}

@end
