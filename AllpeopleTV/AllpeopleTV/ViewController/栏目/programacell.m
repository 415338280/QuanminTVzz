//
//  programacell.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "programacell.h"

@implementation programacell
-(UIImageView*)thumb
{
    if (!_thumb) {
        _thumb = [UIImageView new];
        [self.contentView addSubview:_thumb];
        _thumb.layer.cornerRadius = 3;
        _thumb.contentMode = UIViewContentModeScaleAspectFill;
        _thumb.clipsToBounds = YES;
        [_thumb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _thumb;
}
-(UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        _name.textColor = [UIColor whiteColor];
        
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-15);
        }];
    }return _name;
}
@end
