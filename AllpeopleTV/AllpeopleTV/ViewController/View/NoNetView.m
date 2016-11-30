//
//  NoNetView.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/29.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "NoNetView.h"

@implementation NoNetView

-(id)initWithRefreshBlock:(void (^)())block
{
    if (self = [super init]) {
        self.RefreshBlock = block;
        self.backgroundColor = [UIColor whiteColor];
        //
        UIImageView* imageIV =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"disconnect_internet_190x190_"]];
        [self addSubview:imageIV];
        [imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
        UILabel *textLb = [UILabel new];
        textLb.text = @"咦?似乎没有检测到网络哦";
        textLb.textColor = [UIColor lightGrayColor];
        textLb.font = [UIFont systemFontOfSize:14];
        textLb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLb];
        [textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(imageIV.mas_bottom).offset(10);
        }];
        
        //重新加载的button
        UIButton *button = [UIButton new];
        [button setBackgroundImage:[UIImage imageNamed:@"Img_game_download_btn_508x80_"] forState:UIControlStateNormal];
        [button setTitle:@"重新加载" forState:UIControlStateNormal];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(textLb.mas_bottom).offset(30);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        
        //添加点击button触发的block
        [button bk_addEventHandler:^(id sender) {
            !self.RefreshBlock ?: self.RefreshBlock();
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
