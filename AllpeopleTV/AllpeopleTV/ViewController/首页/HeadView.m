//
//  HeadView.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView


-(UIImageView *)ico
{
    if (!_ico) {
        _ico = [UIImageView new];
        [self addSubview:_ico];
        _ico.backgroundColor = [UIColor redColor];
        [_ico mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.centerY.equalTo(0);
            make.height.equalTo(14);
            make.width.equalTo(2);
        }];
    }
    return _ico;
}

-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(_ico.mas_right).offset(5);
        }];
    }
    return _title;
}
-(UIImageView *)image
{
    if (!_image ) {
        _image = [UIImageView new];
        [self addSubview:_image];
        _image.image = [UIImage imageNamed:@"btn_home_content_rignt_cc_normal_20x20_-1"];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-5);
            make.width.equalTo(5);
            make.height.equalTo(10);
        }];
    }
    return _image;
}
-(UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        [self addSubview:_name];
        _name.text = @"瞅瞅";
        _name.textColor = [UIColor grayColor];
        _name.font = [UIFont systemFontOfSize:12];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(_image.mas_left).offset(5);
        }];
    }
    return _name;
}
@end
