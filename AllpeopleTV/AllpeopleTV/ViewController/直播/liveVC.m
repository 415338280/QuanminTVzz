//
//  liveVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "liveVC.h"

@interface liveVC ()
@property(nonatomic)NSArray<liveModel*> *datalist;
@property(nonatomic)UICollectionViewFlowLayout* layou;
@property(nonatomic)NSMutableArray<liveModel*>* addData;

@end
@implementation liveVC
-(NSArray<liveModel *> *)datalist
{
    if (!_datalist) {
        _datalist = [NSArray new];
    }
    return _datalist;
}
-(NSMutableArray<liveModel *> *)addData
{
    if (!_addData) {
        _addData = [NSMutableArray array];
    }
    return _addData;
}
-(UICollectionViewLayout *)layou
{
    if (!_layou) {
        _layou = [[UICollectionViewFlowLayout alloc]init];
        _layou.sectionInset = UIEdgeInsetsMake(25, 25, 25, 25);
        _layou.minimumLineSpacing = 25;
        _layou.minimumInteritemSpacing = 45;
        CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 75)/ 2 );
        _layou.itemSize = CGSizeMake(width, 465);
    }
    return _layou;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[liveTVCell class] forCellWithReuseIdentifier:@"liveTVCell"];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [NetManager getLiveModelWithPage:@"" CompletionHandeler:^(NSArray<liveModel *> *model, NSError *error) {
           if (!error) {
               self.datalist = model;
               [self.addData removeAllObjects];
               [self.addData addObjectsFromArray:model];
               [self.collectionView reloadData];
               [self.collectionView.mj_header endRefreshing];
           }
       }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getLiveModelWithPage:@"" CompletionHandeler:^(NSArray<liveModel *> *model, NSError *error) {
            if (!error) {
                [self.addData addObjectsFromArray:model];
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
            }
        }];
    }];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view data source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.addData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return nil;
}



@end
