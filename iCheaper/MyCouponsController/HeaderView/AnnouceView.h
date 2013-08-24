//
//  AnnouceView.h
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScrollTimerInterval 3.0f
#define kScrollMaxPageNumber 2

@interface AnnouceView : UIView
//<ADBannerViewDelegate>
{
    UIScrollView *scrollViewContainer;
    UIPageControl *pageControl;
    NSTimer *scrollTimer;
//    ADBannerView *bannerView;
}
@end
