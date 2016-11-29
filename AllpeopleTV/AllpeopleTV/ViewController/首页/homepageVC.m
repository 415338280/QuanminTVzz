//
//  homepageVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "homepageVC.h"
#import "HomePageModel.h"
#import "HeadView.h"
#import "HomeCell.h"
#import "HomeKongCell.h"
#import "HeadViewCell.h"
@interface homepageVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic) NSArray<HomePageroomModel*> * list;

@property(nonatomic) NSArray* headName;

@property(nonatomic) HomePageModel* modeldata;


@property(nonatomic) UICollectionViewFlowLayout* layou;


@property(nonatomic) UICollectionView* HomeVC;

@property(nonatomic) NSArray<HeadHomeiosModel*>* headModel;

@property(nonatomic) iCarousel* icVC;

@property(nonatomic) UIPageControl* page;

@property(nonatomic) UILabel* HeaTitle;

@property(nonatomic) NSTimer* timer;

@end

@implementation homepageVC

-(iCarousel *)icVC
{
    if (!_icVC) {
        _icVC = [iCarousel new];
        _icVC.delegate = self;
        _icVC.dataSource = self;
        _icVC.pagingEnabled = YES;
    }
    return _icVC;
}
-(UIPageControl *)page
{
    if (!_page) {
        _page = [UIPageControl new];
        _page.numberOfPages = self.headModel.count;
        _page.currentPageIndicatorTintColor = [UIColor whiteColor];
        _page.pageIndicatorTintColor = [UIColor grayColor];
    }
    return _page;
}
-(UILabel *)HeaTitle
{
    if (!_HeaTitle) {
        _HeaTitle = [UILabel new];
        _HeaTitle.font = [UIFont systemFontOfSize:12];
        _HeaTitle.textColor = [UIColor grayColor];
        _HeaTitle.text = self.headModel[0].title;
    }
    return _HeaTitle;
}
-(NSArray *)headName
{
    if (!_headName) {
        _headName = @[@"",@"精彩推荐",@"颜值控",@"全民星秀",@"全民户外",@"英雄联盟",@"炉石传说",@"守望先锋",@"QQ飞车",@"王者荣耀",@"手游专区",];
    }
    return _headName;
}

-(UICollectionView*)HomeVC
{
    if (!_HomeVC) {
        _HomeVC  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, USWidh, USHigt) collectionViewLayout:self.layou];
        _HomeVC.dataSource = self;
        _HomeVC.delegate = self;
        [self.HomeVC registerClass:[HomeCell class] forCellWithReuseIdentifier:@"HomeCell"];
        [self.HomeVC registerClass:[HomeKongCell class] forCellWithReuseIdentifier:@"HomeKongCell"];
        [self.HomeVC registerClass:[HeadViewCell class] forCellWithReuseIdentifier:@"HeadViewCell"];
        [self.HomeVC registerClass:[HeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView"];
        [self.HomeVC registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
        self.HomeVC.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_HomeVC];
    }
    return _HomeVC;
}

-(NSArray<HomePageroomModel *> *)list
{
    if (!_list) {
        NSMutableArray<HomePageroomModel *>* arr = [NSMutableArray<HomePageroomModel *> new];
        [self.modeldata.room enumerateObjectsUsingBlock:^(HomePageroomModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            for (int i = 1; i < self.headName.count; i++) {
                if ([obj.name isEqualToString:self.headName[i]]) {
                    [arr addObject:obj];
                }
            }
        }];
        _list = arr.copy;
    }
    return _list;
}






-(UICollectionViewFlowLayout *)layou
{
    if (!_layou) {
        _layou = [UICollectionViewFlowLayout new];
        _layou.sectionInset = UIEdgeInsetsMake(0, 15, 5, 15);
        _layou.minimumInteritemSpacing = 15;
        _layou.minimumLineSpacing = 15;

    }
    return _layou;
}
#pragma mark --- View加载
- (void)viewDidLoad {
    [super viewDidLoad];
    [NetManager getHomePageCompletionHandeler:^(HomePageModel *Model, NSError *error) {
        self.modeldata = Model;
        [self HomeVC];
        [self headName];
        [self list];
      
    }];
 
    [NetManager getHeadHomePageCompletionHandeler:^(HeadHomePageModel *Model, NSError *error) {
       
       self.headModel = Model.iosfocus;
     
   }];
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- iCVC  数据源 代理

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.page.currentPage = carousel.currentItemIndex;
    self.HeaTitle.text = self.headModel[carousel.currentItemIndex].title;
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.headModel.count;
}
-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, USHigt * 290 / 1135)];
        
    }
    [((UIImageView*)view) setImageURL:self.headModel[index].thumb.ZX_URL];
    return view;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark - Collection view data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.headName.count ;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    static int ind = -2;
    ind++;
    if (section == 0) {
        return 1;
    }
    return self.list[ind].list.count;
}

///Cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
        HeadViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeadViewCell" forIndexPath:indexPath];
        [cell addSubview:self.icVC];
        [self.icVC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
            _icVC.currentItemIndex++;
        } repeats:YES];
        [cell addSubview:self.page];
        [_page mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.right.equalTo(-10);
        }];
        [cell addSubview:self.HeaTitle];
        [_HeaTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
        }];
        
        return cell;
    }else{
        HomePageroomModel* model = self.list[indexPath.section - 1];
                NSInteger viownum = model.list[indexPath.row].view.integerValue;
                NSString* view = model.list[indexPath.row].view;
                if (viownum >= 10000) {
                    view = [NSString stringWithFormat:@"%.1ld万",viownum / 10000];
                }
                NSTextAttachment* chment = [NSTextAttachment new];
                chment.image = [UIImage imageNamed:@"player_audienceCount_icon_10x10_"];
                NSAttributedString* att = [NSAttributedString attributedStringWithAttachment:chment];
                chment.bounds = CGRectMake(3, 0, 8, 10);
                NSAttributedString* att1 = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@" %@ ",view] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                NSMutableAttributedString* str = [NSMutableAttributedString new];
                [str appendAttributedString:att];
                [str appendAttributedString:att1];
        if (indexPath.section == 2) {
            HomeKongCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeKongCell" forIndexPath:indexPath];
              [cell.image setImageURL:model.list[indexPath.row].thumb.ZX_URL];
            cell.title.text = model.list[indexPath.row].nick;
            cell.fans.attributedText = str;
            return cell;
        }
        [cell.image setImageURL:model.list[indexPath.row].thumb.ZX_URL];
        [cell.icon setImageURL:model.list[indexPath.row].avatar.ZX_URL];
        cell.title.text = model.list[indexPath.row].nick;
        cell.contens.text = model.list[indexPath.row].title;
        cell.fans.attributedText = str;
    }
    return cell;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView* cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor lightGrayColor];
        return  cell;
    }else
    {
        HeadView* cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView" forIndexPath:indexPath];
        
        if (indexPath.section) {
            [cell ico];
            cell.title.text = self.headName[indexPath.section];
            [cell image];
            cell.image.image = [UIImage imageNamed:@"ic_log_account_25x25_"];
            [cell name];
            return  cell;
        }
        return cell;
    }
    return nil;
}


#pragma mark -- layou delegate

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 15;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    else
        return 15;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
     CGFloat  widg =  ((USWidh - 45) / 2);
    CGFloat high = (USHigt * 270 / 1135);
    if (indexPath.section == 0) {
        return CGSizeMake(USWidh, USHigt * 290 / 1135);
    }
    if (indexPath.section == 2) {
       
        return CGSizeMake(widg, widg);
    }
   
    return CGSizeMake(widg, high);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
       return  CGSizeMake(0, 0);
    }
    CGFloat higt = USHigt* 70 / 1135;
    return CGSizeMake(USWidh, higt);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (!section) {
      return  CGSizeMake(0, 0);
    }
    CGFloat higt = USHigt* 25 / 1135;
   return  CGSizeMake(USWidh, higt);
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
