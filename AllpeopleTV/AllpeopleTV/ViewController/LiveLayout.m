//
//  LiveLayout.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "LiveLayout.h"

@implementation LiveLayout
-(instancetype)init
{
    if (self = [super init]) {
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 5;
        CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 25) / 2 );
        CGFloat higt = width * 40 / 57 + 30;
        self.itemSize = CGSizeMake(width,higt);
    }
    return self;
}
@end
