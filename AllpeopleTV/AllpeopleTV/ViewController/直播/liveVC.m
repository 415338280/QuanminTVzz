//
//  liveVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "liveVC.h"

@interface liveVC ()
//@property(nonatomic)liveModel *datalist;
@property(nonatomic)NSMutableArray<livedataModel*>* addData;
@property(nonatomic)NSInteger page;
@end
@implementation liveVC
//-(NSArray<liveModel *> *)datalist
//{
//    if (!_datalist) {
//        _datalist = [NSArray new];
//    }
//    return _datalist;
//}
-(NSMutableArray<livedataModel *> *)addData
{
    if (!_addData) {
        _addData = [NSMutableArray array];
    }
    return _addData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[liveTVCell class] forCellWithReuseIdentifier:@"liveTVCell"];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
          [NetManager getLiveModelWithPage:0 CompletionHandeler:^(liveModel *model, NSError *error) {
//              self.datalist = model;
              [self.addData removeAllObjects];
//              [self.addData addObject:model.data];
              [self.addData addObjectsFromArray:model.data];
              [self.collectionView reloadData];
              [self.collectionView.mj_header endRefreshing];
              self.page = 0;
          }];
    }];
    [self.collectionView.mj_header beginRefreshing];
//    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getLiveModelWithPage:self.page + 1 CompletionHandeler:^(liveModel *model, NSError *error) {
            [self.collectionView.mj_footer endRefreshing];
            if (!error) {
                [self.addData addObjectsFromArray:model.data];
                [self.collectionView reloadData];
                self.page++;
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
    
    livedataModel* model = self.addData[indexPath.row];
    liveTVCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"liveTVCell" forIndexPath:indexPath];
    [cell.avatar setImageURL:model.avatar.ZX_URL];
    [cell.thumb setImageURL:model.thumb.ZX_URL];
    cell.title.text = model.title;
    cell.nick.text = model.nick;
    cell.view.text = model.view;

    return cell;
}



@end
