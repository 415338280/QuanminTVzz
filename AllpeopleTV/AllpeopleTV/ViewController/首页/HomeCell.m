//
//  HomeCell.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

-(UIImageView *)image
{
    if (!_image) {
        _image = [UIImageView new];
        [self.contentView addSubview:_image];
        _image.layer.cornerRadius = 2;
        _image.clipsToBounds = YES;
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            CGFloat higt = USHigt * 90 / 1135;
            make.bottom.equalTo(-higt);
        }];
    }
    return _image;
}

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        [self.contentView addSubview:_icon];
           CGFloat higt = USHigt * 20 / 1135;
         CGFloat hight = USHigt * 65 / 1135;
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(_image.mas_bottom).offset(higt);
            make.width.height.equalTo(hight);
        }];
        _icon.layer.cornerRadius = hight / 2;
        _icon.clipsToBounds = YES;
    }
    return _icon;
}
-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.font = [UIFont systemFontOfSize:13];

        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat hight = USHigt * 25 / 1135;
            make.top.equalTo(_image.mas_bottom).offset(hight);
            make.left.equalTo(_icon.mas_right).offset(5);
        }];
    }
    return _title;
}
-(UILabel *)contens
{
    if (!_contens) {
        _contens = [UILabel new];
        [self.contentView addSubview:_contens];
        _contens.font = [UIFont systemFontOfSize:13];
        _contens.textColor = [UIColor grayColor];
        
        [_contens mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icon.mas_right).offset(5);
            make.top.equalTo(_title.mas_bottom).offset(5);
            make.right.equalTo(-5);
        }];
    }
    return _contens;
}

-(UILabel *)fans
{
    if (!_fans) {
        _fans = [UILabel new];
        [self.image addSubview:_fans];
        _fans.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
        _fans.layer.cornerRadius = 2;
        _fans.clipsToBounds = YES;
        [_fans mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.bottom.equalTo(-5);
        }];
    }
    return _fans;
}
@end
