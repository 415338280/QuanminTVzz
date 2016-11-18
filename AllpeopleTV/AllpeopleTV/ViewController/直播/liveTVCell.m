//
//  liveTVCell.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "liveTVCell.h"

@implementation liveTVCell
/*
@property (nonatomic, strong) UIImageView* avatar; //头像
@property (nonatomic, strong) UILabel* title; //标题
@property (nonatomic, strong) UILabel* nick; //名字
@property (nonatomic, strong) UILabel* view; //人数
@property (nonatomic, strong) UIImageView* thumb;//图片
 */
-(UIImageView *)thumb
{
    if (!_thumb) {
        _thumb = [UIImageView new];
        [self.contentView addSubview:_thumb];
        [_thumb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 133, 0));
        }];
    }
    return _thumb;
}
-(UIImageView *)avatar
{
    if (!_avatar) {
        _avatar = [UIImageView new];
        [self.contentView addSubview:_avatar];
        
        [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(self.thumb.mas_bottom).offset(27);
            make.width.height.equalTo(100);
        }];
        _avatar.layer.cornerRadius = _avatar.size.height;
        _avatar.layer.masksToBounds = YES;
    }
    return _avatar;
}
-(UILabel *)nick
{
    if (!_nick) {
        _nick = [UILabel new];
        [self.contentView addSubview:_nick];
        [_nick mas_makeConstraints:^(MASConstraintMaker *make) {
            // 图片变园后可能布局出错
            make.left.equalTo(self.avatar.mas_right).offset(5);
       //     make.left.equalTo(115);
            make.top.equalTo(self.thumb.mas_bottom).offset(32);
        }];
    }
    return _nick;
}
-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.font = [UIFont systemFontOfSize:13];
        _title.textColor = [UIColor grayColor];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nick);
            make.top.equalTo(self.nick.mas_bottom).offset(14);
        }];
    }
    return _title;
}
-(UILabel *)view
{
    if (!_view) {
        _view = [UILabel new];
        [self.contentView addSubview:_view];
        _view.textColor = [UIColor whiteColor];
        _view.backgroundColor = [UIColor blackColor];
        _view.alpha = 0.5;
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
            make.width.equalTo(48);
        }];
    }
    return _view;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
