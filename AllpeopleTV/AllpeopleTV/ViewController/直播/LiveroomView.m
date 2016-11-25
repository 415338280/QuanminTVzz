//
//  LiveroomView.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "LiveroomView.h"

#define widh self.width

@implementation LiveroomView
/*
@property(nonatomic)UIButton* goback;

@property(nonatomic)UIButton* more;

@property(nonatomic)UIButton* praise;

@property(nonatomic)UIButton* pause;

@property(nonatomic)UIButton* blowup;
*/

-(UIButton *)goback
{
  
    if (!_goback) {
        _goback = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_goback];
        [_goback mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat distance = (widh) * 40 / 700;
            make.left.top.equalTo(distance);
        }];
        [_goback setBackgroundImage:[UIImage imageNamed:@"btn_nav_player_back_normal_30x30_"] forState:UIControlStateNormal];
         [_goback setBackgroundImage:[UIImage imageNamed:@"btn_nav_player_back_selected_30x30_"] forState:UIControlStateHighlighted];
        
    }
    return _goback;
}
-(UIButton *)more
{
    if (!_more) {
        _more = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_more];
        [_more mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat distance = (widh) * 40 / 700;
            make.top.equalTo(distance);
            make.right.equalTo(-distance);
        }];
        [_more setBackgroundImage:[UIImage imageNamed:@"btn_sp_player_more_mormal_30x30_"] forState:UIControlStateNormal];
        [_more setBackgroundImage:[UIImage imageNamed:@"btn_sp_player_more_click_30x30_"] forState:UIControlStateHighlighted];
    }
    return _more;
}
-(UIButton *)praise
{
    if (!_praise) {
        
        _praise = [UIButton buttonWithType:UIButtonTypeCustom];
         [self addSubview:_praise];
        
        [_praise mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat distance = (widh) * 40 / 700;
            CGFloat higt = (widh) * 190 / 700;
            make.top.equalTo(higt);
            make.right.equalTo(-distance);
        }];
        [_praise setBackgroundImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25_"] forState:UIControlStateNormal];
        [_praise setBackgroundImage:[UIImage imageNamed:@"btn_nav_search_normal_25x25_"] forState:UIControlStateHighlighted];
    }
    return _praise;
}
-(UIButton *)pause
{
    if (!_pause) {
        _pause = [UIButton buttonWithType:UIButtonTypeCustom];
         [self addSubview:_pause];
        [_pause mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat distance = (widh) * 40 / 700;
            CGFloat higt = (widh) * 340 / 700;
            make.right.equalTo(-distance);
            make.top.equalTo(higt);
        }];
        [_pause setBackgroundImage:[UIImage imageNamed:@"btn_sp_player_bofang_30x30_"] forState:UIControlStateNormal];
        [_pause setBackgroundImage:[UIImage imageNamed:@"btn_sp_player_zanting_30x30_"] forState:UIControlStateHighlighted];
    }
    return _pause;
}
-(UIButton *)blowup
{
    if (!_blowup) {
        _blowup = [UIButton buttonWithType:UIButtonTypeCustom];
         [self addSubview:_blowup];
        [_blowup mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat distance = (widh) * 30 / 700;
            make.right.equalTo(-distance);
            make.bottom.equalTo(-distance);
        }];
        [_blowup setBackgroundImage:[UIImage imageNamed:@"btn_nav_player_quanping_normal_30x30_"] forState:UIControlStateNormal];
        [_blowup setBackgroundImage:[UIImage imageNamed:@"btn_nav_player_quanping_selected_30x30_"] forState:UIControlStateHighlighted];
    }
    return _blowup;
}
@end
