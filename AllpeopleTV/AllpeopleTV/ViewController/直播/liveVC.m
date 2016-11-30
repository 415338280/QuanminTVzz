//
//  liveVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "liveVC.h"
#import "LiveroomVC.h"
@interface liveVC ()

@property(nonatomic) NSMutableArray<livedataModel*>* addData;

@property(nonatomic) NSInteger page;

@property(nonatomic) NSTimer* timer;
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
    MJWeakSelf
    [weakSelf.collectionView addHeaderRefresh:^{
        [NetManager getLiveModelWithPage:0 CompletionHandeler:^(liveModel *model, NSError *error) {
            [self.addData removeAllObjects];
            [self.addData addObjectsFromArray:model.data];
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
            self.page = 0;
            [NSTimer bk_timerWithTimeInterval:4 block:^(NSTimer *timer) {
                [self.collectionView configHeader];
            } repeats:YES];
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
     [cell.thumb setImageURL:model.thumb.ZX_URL];
    [cell.avatar setImageURL:model.avatar.ZX_URL];
    cell.title.text = model.title;
    cell.nick.text = model.nick;
//    cell.view.text = model.view;
    int num = model.view.intValue;
    NSString* follow = model.view;
    if (num >= 10000) {
        follow = [NSString stringWithFormat:@"%.1f万", num / 10000.0];
    }
    follow = [NSString stringWithFormat:@" %@ ", follow];
    NSAttributedString* str1 = [[NSAttributedString alloc]initWithString:follow attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName: [UIFont systemFontOfSize:13]}];
    NSTextAttachment* ima = [NSTextAttachment new];
    ima.image = [UIImage imageNamed:@"player_audienceCount_icon_10x10_"];
    ima.bounds = CGRectMake(4, 0, 8, 12);
    NSAttributedString* str2 = [NSAttributedString attributedStringWithAttachment:ima];
    NSMutableAttributedString* str = [NSMutableAttributedString new];
    [str appendAttributedString: str2];
    [str appendAttributedString: str1];
    cell.view.attributedText = str;

    return cell;
}
#pragma mark - Collection view dalegate  跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* rid = self.addData[indexPath.row].uid;
    NSString* livePath = [NSString stringWithFormat:kLiveroomPath,rid];
    LiveroomVC* VC = [[LiveroomVC alloc]initWithlivePath:livePath];
    [self presentViewController:VC animated:YES completion:^{
        
    }];
}


@end
