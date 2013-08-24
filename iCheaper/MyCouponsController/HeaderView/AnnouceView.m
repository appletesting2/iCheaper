//
//  AnnouceView.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "AnnouceView.h"

@implementation AnnouceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        [self setupBannerView];
        
        //        [self setupAnnounceImage];
        
        [self setupScrollViewContainer];
        
        [self startTimer];
    }
    return self;
}

//#pragma mark - ADBannerViewDelegate
//
//- (void)bannerViewDidLoadAd:(ADBannerView *)banner
//{
//    NSLog(@"bannerViewDidLoadAd");
//    
//    [self setDefaultAnnounceHide:YES];
//}
//
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
//{
//    NSLog(@"%@", [error localizedDescription]);
//    NSLog(@"didFailToReceiveAdWithError");
//    [self setDefaultAnnounceHide:NO];
//}
//
//// This message will be sent when the user taps on the banner and some action is to be taken.
//// Actions either display full screen content in a modal session or take the user to a different
//// application. The delegate may return NO to block the action from taking place, but this
//// should be avoided if possible because most advertisements pay significantly more when
//// the action takes place and, over the longer term, repeatedly blocking actions will
//// decrease the ad inventory available to the application. Applications may wish to pause video,
//// audio, or other animated content while the advertisement's action executes.
//- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
//{
//    return YES;
//}
//
//// This message is sent when a modal action has completed and control is returned to the application.
//// Games, media playback, and other activities that were paused in response to the beginning
//// of the action should resume at this point.
//- (void)bannerViewActionDidFinish:(ADBannerView *)banner
//{
//    
//}

#pragma mark - setup part

//- (void)setupBannerView
//{
//    if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)]) {
//        bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
//    } else {
//        bannerView = [[ADBannerView alloc] init];
//    }
//    bannerView.delegate = self;
//    
//    //    bannerView.backgroundColor = [UIColor lightGrayColor];
//    if (bannerView.bannerLoaded) {
//        NSLog(@"banner load.");
//    }
//    //    [bannerView ]
//    [self addSubview:bannerView];
//}

- (void)setupAnnounceImage
{
    UIImageView *announceImage = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 15.0f, 24.0f, 24.0f)];
    announceImage.image = [UIImage imageNamed:@"voice_setting_speaker_on.png"];
    [self addSubview:announceImage];
}

- (void)setupScrollViewContainer
{
    scrollViewContainer = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 5.0f, 320.0f, kMyCouponsAnnounceHeaderViewHeight)];
    [scrollViewContainer setPagingEnabled:YES];
    [self addSubview:scrollViewContainer];
    
    // just for testing.
    NSArray *testContent = @[
                             @"PC120全(上海)市上门服务,详询:58-120-120",
                             @"点击底部\"更多\",反馈意见"
                             ];
    
    for (NSUInteger i = 0; i < kScrollMaxPageNumber; i++) {
        UILabel *news = [[UILabel alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0.0f, 320.0f, kMyCouponsAnnounceHeaderViewHeight - 20.0f)];
        news.text = testContent[i];
        news.textAlignment = NSTextAlignmentCenter;
        news.font = [UIFont systemFontOfSize:16.0f];
        news.backgroundColor = [UIColor clearColor];
        news.textColor = kNavigationTitleColor;
        [scrollViewContainer addSubview:news];
    }
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0f, kMyCouponsAnnounceHeaderViewHeight - 25.0f, kScreenWidth, 20.0f)];
    //just for IOS 6.0
    //    NSLog(@"kCurrentIOSVersion = %.2f", kCurrentIOSVersion);
    if (kSDKMoreThan6) {
        pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    }
    else{
        pageControl.backgroundColor = [UIColor colorWithWhite:0.90f alpha:1.0f];
    }
    
    [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    pageControl.numberOfPages = kScrollMaxPageNumber;
    [self addSubview:pageControl];
    
//    UIImageView *announceShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, kMyCouponsAnnounceHeaderViewHeight - 5.0f, 320.0f, 1.0f)];
//    announceShadow.image = [UIImage imageNamed:@"line.png"];
//    [self addSubview:announceShadow];
}

#pragma mark - event part

- (void)pageTurn:(id)sender
{
    // do nothing.
}

- (void)startTimer
{
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:kScrollTimerInterval target:self selector:@selector(autoScrollingAnnounce:) userInfo:nil repeats:YES];
}

- (void)killTimer
{
    [scrollTimer invalidate];
}

- (void)setDefaultAnnounceHide:(BOOL)hidden
{
    scrollViewContainer.hidden = hidden;
    pageControl.hidden = hidden;
}

- (void)autoScrollingAnnounce:(id)sender
{
    static NSUInteger i = 0;
    
    BOOL animated = YES;
    //    NSLog(@"i = %d", i);
    if (i == 0) {
        animated = NO;
    }
    
    [scrollViewContainer setContentOffset:CGPointMake(kScreenWidth * i, 0.0f) animated:animated];
    [pageControl setCurrentPage:i];
    i = (i + 1) % kScrollMaxPageNumber;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
