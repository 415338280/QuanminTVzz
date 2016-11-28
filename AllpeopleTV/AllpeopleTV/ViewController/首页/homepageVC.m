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
@interface homepageVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic) NSArray* headName;

@property(nonatomic) HomePageModel* modeldata;


@property(nonatomic) UICollectionViewFlowLayout* layou;


@property(nonatomic) UICollectionView* HomeVC;
@end

@implementation homepageVC

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
        [self.HomeVC registerClass:[HeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView"];
        [self.HomeVC registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
        self.HomeVC.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_HomeVC];
    }
    return _HomeVC;
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
    }];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.headName.count ;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 6;
    }
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor redColor];
    }else{
         HomePageroomModel* room = self.modeldata.room[indexPath.section - 1];
        [cell.image setImageURL:room.list[indexPath.row].thumb.ZX_URL];
        [cell.icon setImageURL:room.list[indexPath.row].avatar.ZX_URL];
        cell.title.text = room.list[indexPath.row].nick;
        cell.contens.text = room.list[indexPath.row].title;
        
        
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
