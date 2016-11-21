//
//  LiveController.h
//  AllpeopleTV
//
//  Created by tarena on 16/11/21.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "liveModel.h"
@interface LiveController : UICollectionViewController
@property(nonatomic)NSString* slug;
-(instancetype)initWithlayout:(UICollectionViewLayout*)layout Withslug:(NSString*)slug;
@end
