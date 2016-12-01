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

#define AVhight USHigt * 400 / 1135;
@import AVFoundation;

@import AVKit;

@interface LiveroomVC ()

@property(nonatomic)AVPlayerLayer* avplayerLayer;

@property(nonatomic)RoomModel* roomModel;

@property(nonatomic)NSString* liveRoompath;

//暂停按钮
@property(nonatomic, strong) UIButton *pauseBtn;
//播放器功能栏视图
@property(nonatomic)UIView* liveView;
//主播信息栏视图
@property(nonatomic, strong) UIView *middleView;



@end

@implementation LiveroomVC

//播放器功能栏视图
-(UIView *)liveView
{
    if(_liveView == nil) {
        _liveView = [[UIView alloc] init];
        [self.view addSubview:_liveView];
         _liveView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        [_liveView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            CGFloat higt = USHigt * 400 / 1135;
            make.height.equalTo(higt);
        }];
        CGFloat widh = USHigt * 30 / 640;
        CGFloat higt = USHigt * 45 / 1135;
        CGFloat interval = USHigt * 40 / 1135;

        //添加全民直播水印
        UIImageView *watermarkIV = [UIImageView new];
        [_liveView addSubview:watermarkIV];
        watermarkIV.image = [UIImage imageNamed:@"live_notLiving_image_140x59_"];
        [watermarkIV mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat higt = USHigt * 35 / 1135;
            make.left.top.equalTo(higt);
            CGFloat higt1 = USHigt * 130 / 640;
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
        nickLb.font = [UIFont systemFontOfSize:15];
        [_middleView addSubview:nickLb];
        [nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh = USHigt * 12 / 1335;
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
            CGFloat widh = USWidh * 330 / 1335;
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
            CGFloat higt = USWidh * 20 / 1335;
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
        [followBtn setImage:[UIImage imageNamed:@"btn_nav_gz_selected_25x25_"] forState:UIControlStateSelected];
        [_middleView addSubview:followBtn];
        [followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widh1 = USWidh * 20 / 1335;
            make.right.equalTo(remindSwitch.mas_left).offset(-widh1);
            CGFloat higt = USWidh * 15 / 1335;
            make.top.equalTo(higt);
            CGFloat widh = USWidh * 60 / 1335;
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
    [NetManager getLiveRoomWithPath:self.livePath completionHandeler:^(RoomModel *Model, NSError *error) {
        
        self.roomModel = Model;
        
        _liveRoompath = self.roomModel.live.ws.hls.standrandQuality.src;
        [self PlayLive];
        [self middleView];
    }];
    
}
#pragma LiveView  控件相关方法
-(void)backToLiveView{
    //返回上一页面停止播放
 //   [_player replaceCurrentItemWithPlayerItem:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Playlive
{
    
}
-(void)PlayLive
{
    AVPlayerViewController* VC = [AVPlayerViewController new];
    VC.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.liveRoompath]];
    NSLog(@"---------%@---------",self.liveRoompath);
    [VC.player play];
    
    _avplayerLayer = [AVPlayerLayer playerLayerWithPlayer:VC.player];
   // [AVPlayerLayer playerLayerWithPlayer:_player];
    
    
    
    [self.view.layer addSublayer:_avplayerLayer];
    
    CGFloat higt = USHigt * 400 / 1135;
    
    _avplayerLayer.frame = CGRectMake(0, 0, USWidh,higt);
    
    [self.view addSubview:[self liveView]];
    
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
