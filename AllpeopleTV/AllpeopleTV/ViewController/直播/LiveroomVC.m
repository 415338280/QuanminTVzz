//
//  LiveroomVC.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/24.
//  Copyright © 2016年 Zx. All rights reserved.
//


#import "LiveroomVC.h"

#import "liveRoomModel.h"

#import "LiveroomView.h"

#import <IJKMediaFramework/IJKMediaFramework.h>

#import "LivePageViewController.h"
#define AVhight USHigt * 400 / 1135;
@import AVFoundation;

@import AVKit;

@interface LiveroomVC ()

@property(nonatomic) IJKFFMoviePlayerController* ijkPlayerVC;

@property(nonatomic)RoomModel* roomModel;

@property(nonatomic)NSString* liveRoompath;

//电池条的背景色
@property (nonatomic) UIView *statusBG;

//暂停按钮
@property(nonatomic, strong) UIButton *pauseBtn;
//播放器功能栏视图
@property(nonatomic)UIView* liveView;
//主播信息栏视图
@property(nonatomic, strong) UIView *middleView;
// 底部视图
@property(nonatomic) UIView* bottomView;




@end

@implementation LiveroomVC

//底部视图

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        [self.view addSubview:_bottomView];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.borderColor = [UIColor grayColor].CGColor;
        _bottomView.layer.borderWidth = 1;
        CGFloat hight = USHigt * 85 / 1135;
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(hight);
        }];
        //添加热btn 这里用图片替换
        UIImageView *hotIV = [UIImageView new];
        hotIV.image = [UIImage imageNamed:@"live_hotButton_icon_25x25_"];
        [_bottomView addSubview:hotIV];
        [hotIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            CGFloat widh = USHigt * 25 / 1135;
            make.left.equalTo(widh);
            CGFloat hight = USHigt * 40 / 1135;
            make.size.equalTo(hight);
        }];
        //添加礼物按钮
        //
        UIButton *giftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage* image = [UIImage imageNamed:@"btn_bofang_toolbar_gift_25x25_"];
//        [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [giftBtn setImage:image forState:UIControlStateNormal];
        
        [_bottomView addSubview:giftBtn];
        [giftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh = USHigt * 25 / 1135;
            make.right.equalTo(-widh);
             CGFloat hight = USHigt * 40 / 1135;
            make.size.equalTo(hight);
            make.centerY.equalTo(0);
        }];
        //添加textField
        UITextField* field = [UITextField new];
        [_bottomView addSubview:field];
        [field mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh = USHigt * 25 / 1135;
            make.left.equalTo(hotIV.mas_right).offset(widh);
            make.right.equalTo(giftBtn.mas_left).offset(-widh);
            make.centerY.equalTo(0);
            CGFloat higt = USHigt * 55 / 1135;
            make.height.equalTo(higt);
        }];
        //边缘线
        field.layer.borderWidth = 1;
        field.layer.borderColor = [UIColor colorWithRed:251 / 255.0 green:251 / 255.0 blue:251 / 255.0 alpha:1].CGColor;
        field.text = @"  Zx忘记了初衷.........";
        field.textColor = [UIColor colorWithRed:210 / 255.0 green:210 / 255.0 blue:210 / 255.0 alpha:1.0];
        
        field.font = [UIFont systemFontOfSize:13];
        
        field.backgroundColor = [UIColor colorWithRed:251 / 255.0 green:251 / 255.0 blue:251 / 255.0 alpha:.8];
        field.layer.cornerRadius = 15;
        field.clipsToBounds = YES;
        // 添加发送按钮
        UIButton* sendbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        sendbtn.bounds = CGRectMake(5, 0, 20, 20);
        [sendbtn setImage:[UIImage imageNamed:@"btn_player_toolbar_sr_send_normal_25x25_"] forState:UIControlStateNormal];
        [sendbtn setImage:[UIImage imageNamed:@"btn_hp_player_toolbar_sr_send_selected_25x25_"]  forState:UIControlStateHighlighted];
        field.rightViewMode = UITextFieldViewModeAlways;
        field.rightView = sendbtn;
        field.rightView.bounds = CGRectMake(-5, 0, 20, 20);
        
    }
    return _bottomView;
}


//播放器功能栏视图
-(UIView *)liveView
{
    if(_liveView == nil) {
        _liveView = [[UIView alloc] init];
        [self.view addSubview:_liveView];
         _liveView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        [_liveView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(20);
            CGFloat higt = USHigt * 400 / 1135;
            make.height.equalTo(higt);
        }];
        CGFloat widh = USWidh * 45 / 1135;
        CGFloat higt = USHigt * 20 / 1135;
        CGFloat interval = USHigt * 30 / 1135;

        //添加全民直播水印
        UIImageView *watermarkIV = [UIImageView new];
        [_liveView addSubview:watermarkIV];
        watermarkIV.image = [UIImage imageNamed:@"live_notLiving_image_140x59_"];
        [watermarkIV mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat higt = USHigt * 35 / 1135;
            make.left.top.equalTo(higt);
            CGFloat higt1 = USWidh * 130 / 640;
            CGFloat widh = USHigt * 30 / 1135;
            make.size.equalTo(CGSizeMake(higt1, widh));
        }];

        //添加返回按钮
        UIButton *backBtn = [UIButton new];
        [backBtn setImage:[UIImage imageNamed:@"btn_nav_player_back_normal_30x30_"] forState:UIControlStateNormal];
        [_liveView addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(widh);
            make.top.equalTo(higt);
        }];
        [backBtn addTarget:self action:@selector(backToLiveView) forControlEvents:UIControlEventTouchUpInside];
        //添加"更多"按钮
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setImage:[UIImage imageNamed:@"btn_sp_player_more_mormal_30x30_"] forState:UIControlStateNormal];
        [_liveView addSubview:moreBtn];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(-widh);
            make.top.equalTo(higt);
        }];
        //添加屏蔽礼物特效按钮
        UIButton *giftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [giftBtn setImage:[UIImage imageNamed:@"live_hiddenGift_icon_30x30_"] forState:UIControlStateNormal];
        [_liveView addSubview:giftBtn];
        [giftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-widh);
            make.top.equalTo(moreBtn.mas_bottom).offset(interval);
        }];
        //添加暂停按钮
        _pauseBtn = [UIButton new];
        [_pauseBtn setImage:[UIImage imageNamed:@"btn_sp_player_zanting_30x30_"] forState:UIControlStateNormal];
        [_liveView addSubview:_pauseBtn];
        [_pauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-widh);
            make.top.equalTo(giftBtn.mas_bottom).offset(interval);
        }];
       // [_pauseBtn addTarget:self action:@selector(pauseLive) forControlEvents:UIControlEventTouchUpInside];
        //添加全屏按钮
        UIButton *fullScreenBtn = [UIButton new];
        [fullScreenBtn setImage:[UIImage imageNamed:@"btn_nav_player_quanping_normal_30x30_"] forState:UIControlStateNormal];
        [_liveView addSubview:fullScreenBtn];
        [fullScreenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-widh);
            make.bottom.equalTo(-higt);
        }];
    }
    return _liveView;
}
-(void)creatViewLabel{
    UILabel *viewLb = [UILabel new];
    [self.liveView addSubview:viewLb];
    viewLb.textColor = [UIColor whiteColor];
    viewLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    viewLb.layer.cornerRadius = 5;
    viewLb.clipsToBounds = YES;
    [viewLb mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat higt = USHigt * 20 / 1135;
        make.left.equalTo(higt);
        
        make.bottom.equalTo(-higt);
    }];
    NSInteger viewNum = self.roomModel.view;
    NSString *viewPerson = nil;
    if (viewNum < 10000) {
        viewPerson = [NSString stringWithFormat:@"  %ld", viewNum];
    }else{
        viewPerson = [NSString stringWithFormat:@"  %.1f万", viewNum / 10000.0];
    }
    NSMutableAttributedString *str = [NSMutableAttributedString new];
    NSTextAttachment *att = [NSTextAttachment new];
    att.image = [UIImage imageNamed:@"player_audienceCount_icon_10x10_"];
    att.bounds = CGRectMake(4, 0, 15, 13);
    NSAttributedString *str1 = [NSAttributedString attributedStringWithAttachment:att];
    NSAttributedString *str2 = [[NSAttributedString alloc]initWithString:viewPerson attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:13]}];
    [str appendAttributedString:str1];
    [str appendAttributedString:str2];
    viewLb.attributedText = str;
}
//主播信息栏视图
-(UIView *)middleView
{
    if (!_middleView) {
        _middleView = [UIView new];
        [self.view addSubview:_middleView];
        [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.liveView.mas_bottom);
            CGFloat higt = USHigt* 115 / 1335;
            make.height.equalTo(higt);
        }];
        //添加头部视图
        UIImageView *headView = [UIImageView new];
        [self.middleView addSubview:headView];
        CGFloat higt = USHigt * 80 / 1335;
        headView.layer.cornerRadius = higt / 2;
        headView.clipsToBounds = YES;
        [headView setImageURL:self.roomModel.avatar.ZX_URL];
        //[headView setImageWithURL:self.roomModel.avatar.ZX_URL placeholder:[UIImage imageNamed:@"img_profile_touxiang_default_logged_75x75_"]];
        //布局
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat higt1 = USHigt * 15 / 1335;
            make.left.top.equalTo(higt1);
            
            make.size.equalTo(higt);
        }];
        //添加主播昵称
        UILabel *nickLb = [UILabel new];
        nickLb.text = self.roomModel.nick;
//        nickLb.font = [UIFont systemFontOfSize:15];
        //变粗
        nickLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        [_middleView addSubview:nickLb];
        [nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh = USWidh * 14 / 1335;
            make.left.equalTo(headView.mas_right).offset(widh);
            CGFloat higt1 = USHigt * 20 / 1335;
            make.top.equalTo(higt1);
        }];
        //添加房间标题
        UILabel *titleLb = [UILabel new];
        titleLb.text = self.roomModel.title;
        titleLb.font = [UIFont systemFontOfSize:11];
        titleLb.textColor = [UIColor grayColor];
        [_middleView addSubview:titleLb];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nickLb);
            CGFloat higt1 = USHigt * 12 / 1335;
            make.top.equalTo(nickLb.mas_bottom).offset(higt1);
            CGFloat widh = USWidh * 320 / 640;
            make.width.equalTo(widh);
        }];
        //添加开播提醒
        UISwitch *remindSwitch = [UISwitch new];
        // 选中时颜色
        remindSwitch.onTintColor = [UIColor redColor];
        // 大小比例
        remindSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
        [_middleView addSubview:remindSwitch];
        [remindSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh = USWidh * 14 / 1335;
            make.right.equalTo(-widh);
            CGFloat higt = USHigt * 20 / 1335;
            make.top.equalTo(higt);
        }];
        UILabel *remindLb = [UILabel new];
        remindLb.text = @"开播提醒";
        remindLb.font = [UIFont systemFontOfSize:10];
        remindLb.textColor = [UIColor grayColor];
        [_middleView addSubview:remindLb];
        [remindLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(remindSwitch);
            CGFloat widh = USWidh * 13 / 1335;
            make.top.equalTo(remindSwitch.mas_bottom).offset(widh);
        }];
        //添加关注按钮
        UIButton *followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [followBtn setImage:[UIImage imageNamed:@"btn_nav_gz_normal_25x25_"] forState:UIControlStateNormal];
        [followBtn setImage:[UIImage imageNamed:@"btn_nav_gz_selected_25x25_"] forState:UIControlStateHighlighted];
        [_middleView addSubview:followBtn];
        [followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh1 = USWidh * 20 / 1335;
            make.right.equalTo(remindSwitch.mas_left).offset(-widh1);
            CGFloat higt = USHigt * 15 / 1335;
            make.top.equalTo(higt);
            CGFloat widh = USWidh * 60 / 640;
            make.size.equalTo(widh);
        }];
        UILabel *followLb = [UILabel new];
        followLb.text = @"关注";
        followLb.font = [UIFont systemFontOfSize:10];
        followLb.textColor = [UIColor grayColor];
        [_middleView addSubview:followLb];
        [followLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(followBtn);
            
            make.top.equalTo(remindLb);
        }];
    }
    return _middleView;
}

-(instancetype)initWithlivePath:(NSString *)path
{
    if (self = [super init]) {
        self.livePath = path;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //获取数据
    [NetManager getLiveRoomWithPath:self.livePath completionHandeler:^(RoomModel *Model, NSError *error) {
        self.roomModel = Model;
        [self PlayLive];
        [self middleView];
        [self addPageVC];
        [self bottomView];
        [self creatViewLabel];
    }];
    
}
#pragma  mark  WMPageVC  页面控制器
-(void)addPageVC
{
    LivePageViewController* pageVC = [LivePageViewController new];
    pageVC.menuViewStyle = WMMenuViewStyleLine;
//    pageVC.menuViewBottomSpace
    [self addChildViewController:pageVC];
    [self.view addSubview:pageVC.view];
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(self.middleView.mas_bottom);
        CGFloat higt = USHigt * 67 / 1135;
        make.height.equalTo(higt);
    }];
    pageVC.viewFrame = pageVC.view.bounds;
    pageVC.view.backgroundColor = [UIColor redColor];
    pageVC.menuBGColor = [UIColor colorWithRed:5 / 255.0 green:5 / 255.0 blue:5 / 255.0 alpha:1];

}
#pragma  mark ---- 导航控制器与Tabbar

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
//    kAppDelegate.isRotating = YES; //当前window可旋转
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
//    kAppDelegate.isRotating = NO; //window不支持旋转
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
#pragma LiveView  控件相关方法
-(void)backToLiveView{
    //返回上一页面停止播放
    
    [_ijkPlayerVC shutdown];
    
 //   [_player replaceCurrentItemWithPlayerItem:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)PlayLive
{
    
     IJKFFOptions* options = [IJKFFOptions optionsByDefault];
    // 判断当前是不是全民星秀
    if (self.isStarShow) {
    _ijkPlayerVC = [[IJKFFMoviePlayerController alloc]initWithContentURLString:self.roomModel.live.ws.hls.superfinition.supersrc withOptions:options];
    }else _ijkPlayerVC = [[IJKFFMoviePlayerController alloc]initWithContentURLString:self.roomModel.live.ws.hls.standrandQuality.src withOptions:options];
 
    _ijkPlayerVC.playbackRate = 1;
    
    [_ijkPlayerVC prepareToPlay];
    
    [self.view addSubview:_ijkPlayerVC.view];
    
    CGFloat higt = USHigt * 400 / 1135;
    
    _ijkPlayerVC.view.frame = CGRectMake(0, 20, USWidh,higt);
    
    _ijkPlayerVC.scalingMode = IJKMPMovieScalingModeAspectFill;
    
    
    [self.view addSubview:[self liveView]];
    
}
#pragma  mark ---- 横竖屏 电池条背景
- (UIView *)statusBG {
    if(_statusBG == nil) {
        _statusBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        _statusBG.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_statusBG];
    }
    return _statusBG;
}
// 状态栏文字颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    [self statusBG];
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
