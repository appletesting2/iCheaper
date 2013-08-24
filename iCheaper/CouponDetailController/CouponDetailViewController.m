//
//  CouponDetailViewController.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "CouponDetailViewController.h"
#import "CouponDetailViewController+Datasource.h"
#import "CouponDetailViewController+Delegate.h"
#import "UIViewController+ShareIntance.h"
#import "TFHpple.h"
#import "TFHppleElement.h"

#define kCouponBusinessTitleName @"tit"
#define kCouponBusinessAddress @"explai"
#define kCouponBusinessRejectKeyword @"更多"

@interface CouponDetailViewController ()

@end

@implementation CouponDetailViewController

#pragma mark - setup part

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:self.coupon.title output:&titleLabel];
    navigationTitleLabel = titleLabel;
    
    NavigationItemBackButton *leftBarItem = [[NavigationItemBackButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 28.0f, 28.0f)];
    [leftBarItem addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
    
    // right bar button items
    [self setupRightBarItem:[[FavoriteCoupon sharedInstance] HasExistcouponID:@(self.coupon.coupon_id)]];
}

- (void)setupRightBarItem:(BOOL)isFavorite
{
    UIBarButtonItem *rightFavorite;
    UIBarButtonItem *rightShare;
    
    if (isFavorite)
    {
        UIButton *rightBarItem = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
        [rightBarItem setImage:[UIImage imageNamed:@"Title_icon_Favorite_On_D.png"] forState:UIControlStateNormal];
        [rightBarItem setImage:[UIImage imageNamed:@"Title_icon_Favorite_On.png"] forState:UIControlStateHighlighted];
        [rightBarItem addTarget:self action:@selector(favoriteCouponOn:) forControlEvents:UIControlEventTouchUpInside];
        rightFavorite = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
    }
    else
    {
        UIButton *rightBarItem = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
        [rightBarItem setImage:[UIImage imageNamed:@"Title_icon_Favorite_Off_D.png"] forState:UIControlStateNormal];
        [rightBarItem setImage:[UIImage imageNamed:@"Title_icon_Favorite_Off.png"] forState:UIControlStateHighlighted];
        [rightBarItem addTarget:self action:@selector(favoriteCouponOff:) forControlEvents:UIControlEventTouchUpInside];
        rightFavorite = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
    }
    
    UIButton *rightBarItem2 = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
    [rightBarItem2 setImage:[UIImage imageNamed:@"Title_icon_Share_D.png"] forState:UIControlStateNormal];
    [rightBarItem2 setImage:[UIImage imageNamed:@"Title_icon_Share.png"] forState:UIControlStateHighlighted];
    [rightBarItem2 addTarget:self action:@selector(shareCoupon:) forControlEvents:UIControlEventTouchUpInside];
    rightShare = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem2];
    
    self.navigationItem.rightBarButtonItems = @[rightFavorite, rightShare];
}

- (void)setupCouponWebView
{
    detailCouponWeb = [[DetailCouponWeb alloc] initWithFrame:CGRectMake(kCouponDetailWebViewPaddingX, kCouponDetailWebViewPaddingY, kCouponDetailWebViewWidth, kCouponDetailWebViewHeight)];
    [detailCouponWeb setCouponWebURL:self.coupon.coupon_h5_url];
    [self.view addSubview:detailCouponWeb];
}

- (void)setupDetailTitle
{
    detailTitleView = [[DetailTitleView alloc] initWithFrame:CGRectMake(0.0f, kNavigationBarShadowOffsetY, kScreenWidth, kCouponDetailTitleHeight)];
    [detailTitleView setCouponDescriptionLabelText:self.coupon.description];
    [self.view addSubview:detailTitleView];
}

- (void)setupDetailTableHeaderAndFooterView
{
    detailHeaderView = [[DetailCouponHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 170.0f)];
    [detailHeaderView setRulesLabelTextFromH5:self.coupon.coupon_h5_url];
    [detailHeaderView setValidDateLabelFromText:self.coupon.publish_date toText:self.coupon.expiration_date];
    detailFooterView = [[DetailCouponFooterView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kScreenWidth, 30.0f)];
}

- (void)setupDetailTableView
{
    detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(kCouponDetailTableViewPaddingX, kCouponDetailTableViewPaddingY, kCouponDetailTableViewWidth, kCouponDetailTableViewHeight) style:UITableViewStyleGrouped];
    detailTableView.backgroundView = nil;
    detailTableView.backgroundColor = [UIColor clearColor];
    detailTableView.delegate = self;
    detailTableView.dataSource = self;
    detailTableView.tableHeaderView = detailHeaderView;
    detailTableView.tableFooterView = detailFooterView;
//    [detailTableView registerClass:[DetailCouponCell class] forCellReuseIdentifier:kDetailCouponCellTop];
//    [detailTableView registerClass:[DetailCouponCell class] forCellReuseIdentifier:kDetailCouponCellCenter];
//    [detailTableView registerClass:[DetailCouponCell class] forCellReuseIdentifier:kDetailCouponCellBottom];
    [self.view addSubview:detailTableView];
}

- (void)setupDetailBottomView
{
    detailBottomView = [[DetailBottomView alloc] initWithFrame:CGRectMake(kCouponDetailBottomViewPaddingX, kCouponDetailBottomViewPaddingY, kCouponDetailBottomViewWidth, kCouponDetailBottomViewHeight)];
    detailBottomView.delegate = self;
    [self.view addSubview:detailBottomView];
}

- (void)setupBusinessInfo
{
    businessArray = self.coupon.businesses;
}

- (void)setupWeChat
{
    _scene = WXSceneSession;
}

#pragma mark - event part

- (void)registerRetrieveCouponDescription
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrieveCouponDescription:) name:kNotificationRetrieveCouponDescription object:nil];
}

- (void)unregisterRetrieveCouponDescription
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationRetrieveCouponDescription object:nil];
}

- (void)retrieveCouponDescription: (NSNotification *)notification
{
    if (![[notification object] isKindOfClass:[NotificationBody class]]) {
        return;
    }
    
    NotificationBody *notificationBody = [notification object];
    
    if (notificationBody.tag == kNotificationRetrieveCouponDescriptionTag)
    {
        self.coupon.activityDescription = notificationBody.body;
    }
}

- (void)goBack:(UIButton *)sender
{
    switch (self.fromTag) {
        case kFromMainController:
            [self.UIManager exitCouponDetailController];
            break;
        case kFromNearController:
            [self.UIManager exitNearCouponDetailController];
            break;
        case kFromMyFavoriteController:
            [self.UIManager exitFavoriteCouponDetailController];
            break;
        default:
            break;
    }
}

- (void)favoriteCouponOn:(UIButton *)sender
{
    // just tip.
    if (self.coupon.coupon_id > 0)
    {
        [[FavoriteCoupon sharedInstance] removeCoupon:self.coupon.coupon_id];
        [self setupRightBarItem:NO];
        [[ToolKit sharedInstance] showTipInView:self.navigationController.view forText:@"已取消收藏"];
    }
}

- (void)favoriteCouponOff:(UIButton *)sender
{
    if (self.coupon.coupon_id > 0)
    {
        [[FavoriteCoupon sharedInstance] saveCoupon:self.coupon.coupon_id];
        [self setupRightBarItem:YES];
        [[ToolKit sharedInstance] showTipInView:self.navigationController.view forText:@"已收藏"];
    }
}

- (void)sendShareAppContent
{
    // 发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = self.coupon.title;
    message.description = self.coupon.description;
    [message setThumbImage:[UIImage imageNamed:@"icon_ticket.png"]];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = @"<xml>iCheaper</xml>";
    ext.url = @"http://github.com";
    
    Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    ext.fileData = data;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)shareCoupon:(UIButton *)sender
{
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"%@", self.coupon.description] delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"分享给微信好友", nil];
    [as showInView:self.view];
    
//    NSLog(@".....%@", self.coupon.coupon_url);
//    return;
//    
//    if ([self.coupon.businesses count] > 0)
//    {
//        MBProgressHUD *loadCouponImageViewHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        loadCouponImageViewHud.labelText = @"正在载入...";
//        loadCouponImageViewHud.removeFromSuperViewOnHide = YES;
//        
//        NSUInteger businessID = [[self.coupon.businesses[0] valueForKeyPath:@"id"] integerValue];
//        
//        [[RetrieveData sharedInstance] retrieveBusiness:businessID WithBlock:^(Businesses *business, NSError *error) {
//            if (error == nil)
//            {
//                
////                NSLog(@"%@", business.coupon_url);
//                
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 250.0f, 300.0f)];
//                [imageView setImageWithURL:[NSURL URLWithString:business.photo_url] placeholderImage:nil];
//                ;
//                loadCouponImageViewHud.hidden = YES;
//                [self presentSemiView:imageView];
//                
//            }
//        }];
//    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavigationBar];
    
    [self setupDetailTitle];
    
    [self setupDetailTableHeaderAndFooterView];
    
    [self setupBusinessInfo];
    
    [self setupDetailTableView];
    
    [self setupDetailBottomView];
    
    [self setupWeChat];
//    [self setupCouponHtml5String];
    
    [self registerRetrieveCouponDescription];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
