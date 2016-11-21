//
//  programaVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "programaVC.h"
#import "programacell.h"
#import "liveVC.h"
@interface programaVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic)NSArray<programaModel*>* programalist;
@property(nonatomic)UICollectionViewFlowLayout* layou;
@property(nonatomic)UICollectionView* Covc;
@end

@implementation programaVC
-(NSArray<programaModel *> *)programalist
{
    if (!_programalist) {
        _programalist = [NSArray new];
    }
    return _programalist;
}

-(UICollectionView *)Covc
{
    if (!_Covc) {
       
        _layou = [UICollectionViewFlowLayout new];
        _Covc = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,USWidh, USHigt) collectionViewLayout:_layou];
        _layou.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        _layou.minimumLineSpacing = 8;
        _layou.minimumInteritemSpacing = 7;
        CGFloat widh = (USWidh - 40) / 3;
        CGFloat higt = widh * 500 / 385 ;
        _layou.itemSize = CGSizeMake(widh, higt);
        _Covc.delegate = self;
        _Covc.dataSource = self;
        [_Covc registerClass:[programacell class] forCellWithReuseIdentifier:@"programacell"];
        _Covc.backgroundColor = [UIColor whiteColor];
    }
    return _Covc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.Covc];
//    __weak Class weakself = self;
    
//    MJWeakSelf
//    __weak typeof(self) weakSelf = self;
//    __weak typeof  weakSelf = self;
    __weak typeof(self) weakSelf = self;
    [weakSelf.Covc addHeaderRefresh:^{
               [NetManager getProgramaModelCompletionHandeler:^(programaModel *Model, NSError *error) {
                   [self.Covc endHeaderRefresh];
                   if (!error) {
                     self.programalist =   [self.programalist arrayByAddingObjectsFromArray:(NSArray*)Model];
                       [self.Covc reloadData];
                   }
               }];
    }];
    [self.Covc beginHeaderRefresh];
   __block int num = 10;
    [weakSelf.Covc addFooterRefresh:^{
        [self.Covc endFooterRefresh];
//        if (num == 15) {
//            [self.Covc endFooterRefreshWithNoMoreData];
//        }
        num++;
    }];
    
    
    //  自定义的刷新动画
    //  只有类名的开头才大写字母    变量名 必须小写字母开头    方法名小写开头,而且首单词最好是动词   逗号后面必须空格
//    __weak weakself = self;
    
    // 隐藏右侧滚动条
    
    
//    self.Covc.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//       [NetManager getProgramaModelCompletionHandeler:^(programaModel *Model, NSError *error) {
//           [self.Covc.mj_header endRefreshing];
//           if (!error) {
//               //[self.programalist arrayByAddingObject:Model];
//             self.programalist =   [self.programalist arrayByAddingObjectsFromArray:(NSArray*)Model];
//               
//               [self.Covc reloadData];
//           }
//       }];
//    }];
//    [self.Covc.mj_header beginRefreshing];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.programalist.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    programacell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"programacell" forIndexPath:indexPath];
    programaModel* model = self.programalist[indexPath.row];
    [cell.thumb setImageURL:model.thumb.ZX_URL];
    cell.name.text = model.name;
    
    return cell;
}


#pragma mark -- layou delegate



@end
