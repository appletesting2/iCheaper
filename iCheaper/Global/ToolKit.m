//
//  ToolKit.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "ToolKit.h"
#import "MTStatusBarOverlay.h"
#import "MBProgressHUD.h"
#import "UITabBarController+ShowHideBar.h"

@implementation ToolKit
+ (instancetype)sharedInstance
{
	static id instance;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[[self class] alloc] init];
	});
	
	return instance;
}

// sort related.
- (NSArray *)retrieveSortStringArray
{
    return @[@"最新发布优先", @"热门优惠优先", @"最优优惠优先", @"即将结束优先", @"距离近优先"];
}

- (NSArray *)retrieveSortStringTitleArray
{
    return @[@"最新发布", @"热门优惠", @"最优优惠", @"即将结束", @"距离近"];
}

- (NSArray *)retrieveNearCouponsSortStringArray
{
    return @[@"默认", @"星级高优先", @"产品评价高优先", @"环境评价高优先", @"服务评价高优先", @"点评数量多优先", @"距离近优先"];
}

- (NSArray *)retrieveNearCouponsSortStringTitleArray
{
    return @[@"附近优惠", @"星级高", @"产品评价高", @"环境评价高", @"服务评价高", @"点评数量多", @"距离近"];
}

- (NSArray *)retrieveCategories
{
    return @[@{@"category": @[@"全部频道"]},
            @{@"category": @[@"美食", @"本帮江浙菜", @"小吃快餐", @"日本", @"粤菜", @"西餐", @"面包甜点", @"川菜", @"火锅", @"自助餐", @"东南亚菜", @"韩国料理", @"湘菜", @"台湾菜", @"新疆/清真", @"西北菜", @"素菜", @"东北菜", @"贵州菜", @"其他"]},
            @{@"category": @[@"休闲娱乐", @"咖啡厅", @"KTV", @"酒吧", @"景点/郊游", @"足疗按摩", @"电影院", @"洗浴", @"文化艺术", @"桌面游戏", @"茶馆", @"DIY手工坊", @"游乐游艺", @"密室", @"桌球馆", @"更多休闲娱乐"]},
            @{@"category": @[@"购物", @"服饰鞋包", @"化妆品", @"亲子购物", @"食品茶酒", @"眼镜店", @"珠宝饰品", @"花店"]},
            @{@"category": @[@"丽人", @"美发", @"美容/SPA", @"个性写真", @"瘦身纤体", @"化妆品", @"舞蹈", @"美甲", @"瑜伽"]},
            @{@"category": @[@"结婚", @"婚纱摄影", @"婚纱礼服", @"婚庆公司", @"婚戒首饰", @"婚宴", @"彩妆造性", @"婚礼跟拍", @"婚车租赁", @"婚礼小商品", @"司仪主持", @"婚房装修"]},
            @{@"category": @[@"亲子", @"幼儿教育", @"亲子摄影", @"亲子购物", @"孕产护理", @"亲子游乐", @"更多亲子服务"]},
            @{@"category" : @[@"运动健身", @"游泳馆", @"舞蹈", @"瑜伽", @"桌球馆", @"武术场馆", @"高尔夫场"]},
            @{@"category": @[@"酒店", @"五星级酒店", @"经济型酒店", @"精品酒店", @"四星级酒店", @"更多酒店住宿"]},
            @{@"category": @[@"爱车", @"维修保养", @"汽车租赁", @"配件/车饰"]},
            @{@"category": @[@"生活服务", @"宠物", @"培训", @"更多生活服务"]}
             ];
}

- (void)setNavigationController:(UIViewController *)v title:(NSString *)s
{
    UILabel *titleLabel;
    [self setNavigationController:v title:s output:&titleLabel];
}

- (void)setNavigationController:(UIViewController *)v title:(NSString *)s output:(UILabel **)l
{
//    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 25.0f, 25.0f)];
//    logoImageView.image = [UIImage imageNamed:@"app-logo.png"];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 0.0f, 120.0f, 25.0f)];
    v.title = s;
    [titleLabel setText:s];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:kNavigationTitleFontSize]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:kNavigationTitleColor];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    titleLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    titleLabel.shadowOffset = CGSizeMake(0.5f, 0.5f);
    [v.navigationItem setTitleView:titleLabel];
    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 140.0f, 25.0f)];
//    [titleView addSubview:logoImageView];
//    [titleView addSubview:titleLabel];
//    [v.navigationItem setTitleView:titleView];
    
    *l = titleLabel;
}

- (void)setNavController:(UIViewController *)v title:(NSString *)s output:(UIButton**)button
{
    UIButton *titleButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 25.0f)];
    v.title = s;
    [titleButton setTitle:s forState:UIControlStateNormal];
    [titleButton setTitleColor:kNavigationTitleColor forState:UIControlStateNormal];
    [titleButton.titleLabel setFont:[UIFont boldSystemFontOfSize:kNavigationTitleFontSize]];
    [titleButton setShowsTouchWhenHighlighted:YES];
    titleButton.titleLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
//    titleButton.titleLabel.shadowOffset = CGSizeMake(0.5f, 0.5f);
    [titleButton setBackgroundColor:[UIColor clearColor]];
    [v.navigationItem setTitleView:titleButton];
    *button = titleButton;
}

- (void)setImage:(UIImageView *)imageView url:(NSString *)string
{
    UIImage *memImage = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:string];
    UIImage *diskImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:string];
    if (memImage != nil)
    {
        imageView.image = memImage;
    }
    else if (diskImage != nil)
    {
        imageView.image = diskImage;
    }
    else
    {
        imageView.alpha = 0.0f;
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:string] options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
            
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            imageView.image = image;
            [UIView animateWithDuration:0.5f animations:^{
                imageView.alpha = 1.0f;
            }];
        }];
    }
}

- (void)showTipInView:(UIView *)v forText:(NSString *)text
{
    // default 3 seconds disappear.
    [self showTipInView:v forText:text afterDelay:1.5f];
}

- (void)showTipInView:(UIView *)v forText:(NSString *)text afterDelay:(CGFloat)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:v];
    [v addSubview:hud];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    //    hud.delegate = self;
    hud.labelText = text;
    [hud show:YES];
    [hud hide:YES afterDelay:delay];
}

// draw cell bottom separator, thinner.
- (void)drawCellBottomLine:(CGFloat)height
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 0.5f);
    CGContextSetStrokeColorWithColor(context, kCellSeparatorColor.CGColor);
    //    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0.0f, height);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 320.0f, height);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
}

// Custom status bar tips
- (void)postErrorMessage:(NSString *)strTips
{
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    overlay.animation = MTStatusBarOverlayAnimationFallDown;
    overlay.detailViewMode = MTDetailViewModeCustom;
    overlay.frame = CGRectMake(0.0f, 0.0f, 320.0f, 20.0f);
    
    [overlay postImmediateErrorMessage:strTips duration:3.0f animated:YES];
    //    [overlay postErrorMessage:@"网络连接失败,请检查" duration:5.0f animated:YES];
}

- (void)postFinishMessage:(NSString *)strTips
{
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    overlay.animation = MTStatusBarOverlayAnimationFallDown;
    overlay.detailViewMode = MTDetailViewModeCustom;
    overlay.frame = CGRectMake(0.0f, 0.0f, 320.0f, 20.0f);
    
    [overlay postImmediateFinishMessage:strTips duration:3.0f animated:YES];
    //    [overlay postErrorMessage:@"网络连接失败,请检查" duration:5.0f animated:YES];
}

// tab bar controller show or hide.
- (void)hideTabBar:(UITabBarController *)tabbarcontroller
{
//    [tabbarcontroller setHidden:YES];
//    return;
    
    __block UIView *transitView;
    [UIView animateWithDuration:0.35f animations:^{
    
//    NSLog(@"tabbarcontroller.view.subviews = ###### %@ ###### ", tabbarcontroller.view.subviews);
        for(UIView *view in tabbarcontroller.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]])
            {
                [view setFrame:CGRectMake(view.frame.origin.x, kScreenHeight, view.frame.size.width, view.frame.size.height)];
//                [view setHidden:YES];
            }
            else
            {
                transitView = view;
//                [view setFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight)];
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, kScreenHeight)];
            }
        }
        
    } completion:^(BOOL finished) {
        if (transitView != nil && finished)
        {
            [transitView setFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight)];
        }
    }];
}

- (void)showTabBar:(UITabBarController *)tabbarcontroller
{
//    [tabbarcontroller setHidden:NO];
//    return;
    
    __block UIView *transitView;
    [UIView animateWithDuration:0.35f animations:^{
//    NSLog(@"tabbarcontroller.view.subviews = ###### %@ ###### ", tabbarcontroller.view.subviews);
        for(UIView *view in tabbarcontroller.view.subviews)
        {            
            if([view isKindOfClass:[UITabBar class]])
            {
//                [view setHidden:NO];
                [view setFrame:CGRectMake(view.frame.origin.x, kScreenHeight - kTabBarControllerDefaultHeight, view.frame.size.width, view.frame.size.height)];
                
            }
            else
            {
                transitView = view;
//                [view setFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight - kTabBarControllerDefaultHeight)];
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, kScreenHeight - kTabBarControllerDefaultHeight)];
            }
        }
    } completion:^(BOOL finished) {
        if (transitView != nil && finished)
        {
            [transitView setFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight - kTabBarControllerDefaultHeight)];
        }
    }];
}

@end
