//
//  WelcomeViewController.m
//  AllpeopleTV
//
//  Created by tarena on 16/11/30.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "WelcomeViewController.h"

@import AVFoundation;

@interface WelcomeViewController ()

@property(nonatomic) AVPlayer*  player;

@property(nonatomic) AVPlayerLayer* playerLayer;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL* url = [[NSBundle mainBundle]URLForResource:@"dyla_movie" withExtension:@"mp4"];
    
    _player = [AVPlayer playerWithURL:url];
    
    [_player play];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    
    [self.view.layer addSublayer:_playerLayer];
    
    _playerLayer.frame = self.view.layer.bounds;
    
     _playerLayer.videoGravity = @"AVLayerVideoGravityResizeAspectFill";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)playToEnd:(NSNotification *)noti{
    
    [UIView animateWithDuration:1 animations:^{
        self.view.window.alpha = 0;
        self.view.transform = CGAffineTransformMakeScale(1.5,1.5);
        
    } completion:^(BOOL finished) {
        self.view.window.hidden = YES;
        self.view.window.rootViewController = nil;
    }];
    NSDictionary* infoDic = [NSBundle mainBundle].infoDictionary;
    NSString* version = infoDic[@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"kRunVersion"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
