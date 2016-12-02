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
#import "NoNetView.h"
@interface programaVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic)NSArray<programaModel*>* programalist;
@property(nonatomic)UICollectionViewFlowLayout* layou;
@property(nonatomic)UICollectionView* Covc;
@property(nonatomic, strong)NoNetView *noNetView;
@property (nonatomic) UIImageView *iconIV;
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
        _Covc = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,USWidh, USHigt - 64 - 48) collectionViewLayout:_layou];
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
        self.Covc.alwaysBounceVertical = YES;
    }
    ZXFactory* zx = [ZXFactory new];
    [zx setFunction:^{
        NSLog(@"栏目");
    }];
    [zx createWithBlock:zx.function andItemToVc:self];
    return _Covc;
}
-(NoNetView *)noNetView
{
    if (!_noNetView) {
       _noNetView = [[NoNetView alloc]initWithRefreshBlock:^{
           if (!kIsOnline) {
               [self refreshContent];
           }else{
               [self.view showMsg:@"请稍后重试"];
           }
       }];
        [self.view addSubview:_noNetView];
        [_noNetView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _noNetView;
}
// 封装获取数据方法
-(void)refreshContent {
    [self.view showHUD];
    [NetManager getProgramaModelCompletionHandeler:^(programaModel *Model, NSError *error) {
        sleep(2);
        if (!error) {
            self.programalist =   [self.programalist arrayByAddingObjectsFromArray:(NSArray*)Model];
        }
        [self.view hideHUD];
          [self.Covc reloadData];
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.Covc];
//    ZXFactory* zx = [ZXFactory new];
//    [zx setFunction:^{
//        NSLog(@"直播");
//    }];
    
    [ZXFactory addSearchItemToVC:self action:^{
        NSLog(@"哈哈哈开播啦");
    }];
    if (!kIsOnline)
    {
        [self refreshContent];
    }
    else
    {
        self.noNetView.hidden = NO;
    }
    
    self.Covc.showsVerticalScrollIndicator = NO;
    
    _iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble_0_57x63_"]];
//    [self.Covc addSubview:_iconIV];
//    [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(0);
//        make.centerX.equalTo(0);
//    }];
    MJWeakSelf
    [weakSelf.Covc addHeaderRefresh:^{
        [NetManager getProgramaModelCompletionHandeler:^(programaModel *Model, NSError *error) {
            if (!error) {
                self.programalist =   [self.programalist arrayByAddingObjectsFromArray:(NSArray*)Model];
            }
            [self.Covc reloadData];
            [self.Covc endHeaderRefresh];
            [NSTimer bk_scheduledTimerWithTimeInterval:.4 block:^(NSTimer *timer) {
                [weakSelf.Covc configHeader];
            } repeats:NO];
        }];
    }];
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    [NetManager getProgramaModelCompletionHandeler:^(programaModel *Model, NSError *error) {
        [self.Covc endHeaderRefresh];
        if (!error) {
            self.programalist =   [self.programalist arrayByAddingObjectsFromArray:(NSArray*)Model];
            [self.Covc reloadData];
        }
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
    
*/
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
