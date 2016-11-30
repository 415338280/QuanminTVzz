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
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(-45);
        }];
        //图片填充样式
        _thumb.contentMode = UIStackViewAlignmentFill;
        // 剪切掉阴影部分
//        _thumb.clipsToBounds = YES;
        //  按圆形切割因为半径不够所以看出来效果只是四个角变了 半径为5
        _thumb.layer.cornerRadius = 5;
        // 边缘线宽
        _thumb.layer.borderWidth = 2;
        // 边缘线的颜色
        _thumb.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1].CGColor;
        // 剪切阴影
        _thumb.layer.masksToBounds = YES;
    }
    return _thumb;
}
-(UIImageView *)avatar
{
    if (!_avatar) {
        _avatar = [UIImageView new];
        [self.contentView addSubview:_avatar];
        [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(self.thumb.mas_bottom).offset(5);
            make.width.height.equalTo(36);
        }];
        _avatar.layer.cornerRadius = 18;
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
            make.top.equalTo(self.thumb.mas_bottom).offset(7);
            make.right.equalTo(0);
            make.height.equalTo(15);
        }];
        _nick.font = [UIFont systemFontOfSize:14];
    }
    return _nick;
}
-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = [UIColor lightGrayColor];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nick);
            make.top.equalTo(self.nick.mas_bottom).offset(3);
            make.right.equalTo(0);
            make.height.equalTo(15);
        }];
    }
    return _title;
}
-(UILabel *)view
{
    if (!_view) {
        _view = [UILabel new];
        [self.thumb addSubview:_view];
        _view.textColor = [UIColor whiteColor];
        _view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
        _view.layer.cornerRadius = 4;
        _view.clipsToBounds = YES;
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
//            make.width.equalTo(60);
        }];
    }
    return _view;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
