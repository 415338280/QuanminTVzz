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
        UIImageView* image =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"disconnect_internet_190x190_"]];
        
    }
    
    
    
    return nil;
}

@end
