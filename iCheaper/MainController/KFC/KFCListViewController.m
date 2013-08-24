//
//  KFCListViewController.m
//  kfc
//
//  Created by twb on 13-5-17.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "KFCListViewController.h"
#import "KFCListViewController+Datasource.h"
#import "KFCListViewController+Delegate.h"


@interface KFCListViewController ()

@end

@implementation KFCListViewController

#pragma mark - setup part.

- (void)setupKFCListTableView
{
    kfcListTableView = [[UITableView alloc] initWithFrame:CGRectMake(kKFCTableViewPaddingX, kKFCTableViewPaddingY, kKFCTableViewWidth, kKFCTableViewHeight)];

    kfcListTableView.delegate = self;
    kfcListTableView.dataSource = self;
//    [kfcListTableView registerClass:[KFCListCell class] forCellReuseIdentifier:kKFCListCell];
    
    [self.view addSubview:kfcListTableView];
}

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"肯德基手机优惠券" output:&titleLabel];
    navigationTitleLabel = titleLabel;
    
    NavigationItemBackButton *leftBarItem = [[NavigationItemBackButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 28.0f, 28.0f)];
    [leftBarItem addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarItem];
    
    // right
    NavigationItemButton *rightBarItem = [[NavigationItemButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 32.0f)];
    [rightBarItem setButtonTitle:@"刷新"];
    [rightBarItem addTarget:self action:@selector(refreshContent:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarItem];
}

#pragma mark - event part.

- (void)goBack:(UIButton *)sender
{
//    [[ToolKit sharedInstance] showTabBar:self.tabBarController];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)refreshContent:(UIButton *)sender
{
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDisk];
    [[SDImageCache sharedImageCache] cleanDisk];
    [kfcListTableView reloadData];
}

- (void)retrieveKFClistFromWap
{
    NSURL *url = [NSURL URLWithString:kKFCListWAP];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:15.0f];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                                        NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            TFHpple *doc = [TFHpple hppleWithHTMLData:data];
            
            // coupon Image
            NSString *xpathImage = [NSString stringWithFormat:@"//div[@class='%@']/a[@href]", kKFCImageNode];
            
            // coupon Title
            NSString *xpathTitle = [NSString stringWithFormat:@"//div[@class='%@']/h1/a[@href]", kKFCDetailNode];
            
            // coupon Price
            NSString *xpathPrice = [NSString stringWithFormat:@"//div[@class='%@']/h2", kKFCDetailNode];
            
            // coupon Expire date
            NSString *xpathExpireDate = [NSString stringWithFormat:@"//div[@class='%@']/h3", kKFCDetailNode];
            
            NSArray *kfcImageList = [doc searchWithXPathQuery:xpathImage];
            NSArray *kfcTitleList = [doc searchWithXPathQuery:xpathTitle];
            NSArray *kfcPriceList = [doc searchWithXPathQuery:xpathPrice];
            NSArray *kfcExpireList = [doc searchWithXPathQuery:xpathExpireDate];
            
            self.kfcListDictionary = [NSDictionary dictionaryWithObjectsAndKeys:kfcImageList, kKFCImageKey, kfcTitleList, kKFCTitleKey, kfcPriceList, kKFCPriceKey, kfcExpireList, kKFCExpireKey, nil];
            
            if (self.kfcListDictionary != nil)
            {
//                [self setupKFCListTableView];
//                [kfcListTableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.01f];
                [kfcListTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            }
            else
            {
                NSLog(@"无法获取...");
            }
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded.");
        }
        else if (error != nil)
        {
            NSLog(@"Error happened = %@", error);
            
        } }];
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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setupNavigationBar];
    
    [self setupKFCListTableView];
    
    [self retrieveKFClistFromWap];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
