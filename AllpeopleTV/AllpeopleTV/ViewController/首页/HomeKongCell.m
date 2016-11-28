//
//  HomeKongCell.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/28.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "HomeKongCell.h"

@implementation HomeKongCell

-(UIImageView *)image
{
    if (!_image) {
        _image = [UIImageView new];
        [self.contentView addSubview:_image];
        _image.layer.cornerRadius = 2;
        _image.layer.masksToBounds = YES;
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    
    return _image;
}
-(UILabel *)fans
{
    if (!_fans) {
        _fans = [UILabel new];
        [self.contentView addSubview:_fans];
        [_fans mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.right.equalTo(-5);
        }];
    }
    return _fans;
}
-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.bottom.equalTo(-5);
        }];
        
    }
    return _title;
}
@end
