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
        _fans.layer.cornerRadius = 2;
        _fans.clipsToBounds = YES;
        _fans.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];

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
//                _title.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:.7];
        _title.backgroundColor = [UIColor blackColor];
        _title.alpha = 0.7;
        _title.textColor = [UIColor whiteColor];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.bottom.equalTo(-5);
        }];
        
    }
    return _title;
}
@end
