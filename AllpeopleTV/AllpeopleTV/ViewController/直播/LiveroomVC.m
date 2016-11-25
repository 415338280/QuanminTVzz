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

@import AVFoundation;

@import AVKit;

@interface LiveroomVC ()

@property(nonatomic)AVPlayerLayer* avplayerLayer;

@property(nonatomic)liveRoomModel* datalist;

@property(nonatomic)NSString* liveRoompath;

@property(nonatomic)LiveroomView* heaView;

@end

@implementation LiveroomVC
-(LiveroomView *)heaView
{
    if (!_heaView) {
        CGFloat higt = USHigt * 755 / 2205;
        _heaView = [[LiveroomView alloc]init];
        [_heaView goback];
        [_heaView more];
        [_heaView praise];
        [_heaView pause];
        [_heaView blowup];
        _heaView.frame = CGRectMake(0, 10, USWidh, higt);
        _heaView.alpha = 0.2;
        _heaView.backgroundColor = [UIColor whiteColor];
    }
    return _heaView;
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
    [NetManager getLiveRoomWithPath:self.livePath completionHandeler:^(liveRoomModel *Model, NSError *error) {
        
        self.datalist = Model;
        
        _liveRoompath = self.datalist.live.ws.hls.GhlsModel.src;
        
        [self PlayLive];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    CGFloat higt = USHigt * 755 / 2205;
    
    _avplayerLayer.frame = CGRectMake(0, 10, USWidh, higt);
    
    [self.view addSubview:[self heaView]];
    
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
