//
//  ZXRefreshHeader.m
//  AllpeopleTV
//
//  Created by 😘王艳 on 2016/11/30.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "ZXRefreshHeader.h"

@implementation ZXRefreshHeader

-(UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        [self addSubview:_label];
       _label.font = [UIFont systemFontOfSize:13];
        _label.textColor = [UIColor lightGrayColor];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _label;
}

-(void)placeSubviews
{
    [super placeSubviews];
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeTop;
        [self label];
        self.mj_h = 80; //头部视图的高度

    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
