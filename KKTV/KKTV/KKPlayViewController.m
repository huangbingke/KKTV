//
//  KKPlayViewController.m
//  KKTV
//
//  Created by KK on 2020/12/8.
//

#import "KKPlayViewController.h"
#import <ZFPlayer/ZFAVPlayerManager.h>
#import <ZFPlayer/ZFIJKPlayerManager.h>
#import <ZFPlayer/ZFPlayerControlView.h>
#import <ZFPlayer/ZFPlayerConst.h>

//static NSString *kVideoCover = @"https://upload-images.jianshu.io/upload_images/635942-14593722fe3f0695.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240";

@interface KKPlayViewController ()
@property (nonatomic, strong) ZFPlayerController *player;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation KKPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
//    kAPPDelegate.allowOrentitaionRotation = YES;
    @zf_weakify(self)
    self.controlView.backBtnClickCallback = ^{
        @zf_strongify(self)
        [self.player rotateToOrientation:UIInterfaceOrientationPortrait animated:NO completion:nil];
        [self.player stop];
        [self dismissViewControllerAnimated:NO completion:nil];
    };
    
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    /// 播放器相关
    self.player = [[ZFPlayerController alloc] initWithPlayerManager:playerManager containerView:self.view];
    self.player.controlView = self.controlView;
    self.player.orientationObserver.supportInterfaceOrientation = ZFInterfaceOrientationMaskLandscape;
    [self.player rotateToOrientation:UIInterfaceOrientationLandscapeRight animated:NO completion:nil];

//    self.url = @"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4";
    playerManager.assetURL = [NSURL URLWithString:self.url];
    NSLog(@"==============%@", self.url);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    kAPPDelegate.allowOrentitaionRotation = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return self.player.isStatusBarHidden;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.fastViewAnimated = YES;
        _controlView.effectViewShow = NO;
        _controlView.prepareShowLoading = YES;
    }
    return _controlView;
}
@end
