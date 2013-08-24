//
//  McdonaldsViewController.m
//  kfc
//
//  Created by twb on 13-5-20.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "McdonaldsViewController.h"
#import "McdonaldsViewController+Datasource.h"
#import "McdonaldsViewController+Delegate.h"



@interface McdonaldsViewController ()

@end

@implementation McdonaldsViewController

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
    
    [self setupMcdonaldsListTableView];
    
    [self retrieveMcdonaldslistFromWap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - setup part.

- (void)setupNavigationBar
{
    UILabel *titleLabel;
    [[ToolKit sharedInstance] setNavigationController:self title:@"麦当劳手机优惠券" output:&titleLabel];
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


- (void)setupMcdonaldsListTableView
{
    mcdonaldsListTableView = [[UITableView alloc] initWithFrame:CGRectMake(kMcdonaldsTableViewPaddingX, kMcdonaldsTableViewPaddingY, kMcdonaldsTableViewWidth, kMcdonaldsTableViewHeight)];
    
    mcdonaldsListTableView.delegate = self;
    mcdonaldsListTableView.dataSource = self;
//    [mcdonaldsListTableView registerClass:[McdonaldsListCell class] forCellReuseIdentifier:kMcdonaldsListCell];
    
    [self.view addSubview:mcdonaldsListTableView];
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
    [mcdonaldsListTableView reloadData];
}

- (void)retrieveMcdonaldslistFromWap
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kMcdonaldsBaseUrl, kMcdonaldsDownloadUrl]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:15.0f];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                                        NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            TFHpple *doc = [TFHpple hppleWithHTMLData:data];
            
            // Mcdonalds
            NSString *xpathMcdonalds = [NSString stringWithFormat:@"//img[@src]"];
            
            NSArray *McdonaldsExpireList = [doc searchWithXPathQuery:xpathMcdonalds];
//            for (TFHppleElement *e in McdonaldsExpireList) {
//                NSLog(@"e's content = %@", [[e.attributes objectForKey:@"src"] substringFromIndex:3]);
//            }
            
//            NSLog(@"McdonaldsExpireList = %@", McdonaldsExpireList);
            
            self.mcdonaldsListDictionary = [NSDictionary dictionaryWithObjectsAndKeys:McdonaldsExpireList, kMcdonaldsImageKey, nil];
            
            if (self.mcdonaldsListDictionary != nil)
            {
                [mcdonaldsListTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
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

@end
