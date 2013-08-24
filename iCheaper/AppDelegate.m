//
//  AppDelegate.m
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "AppDelegate.h"
#import <PassSlot/PassSlot.h>
#import "Reachability.h"
#import "Database.h"
#import "AWVersionAgent.h"
#import "TTUIManager.h"

@implementation AppDelegate

+ (AppDelegate *)instance
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (id)init
{
	self = [super init];
    if (self) {
        _dpapi = [[DPAPI alloc] init];
		_appKey = [[NSUserDefaults standardUserDefaults] valueForKey:@"appkey"];
		if (_appKey.length<1) {
			_appKey = kDPAppKey;
		}
		_appSecret = [[NSUserDefaults standardUserDefaults] valueForKey:@"appsecret"];
		if (_appSecret.length<1) {
			_appSecret = kDPAppSecret;
		}
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef __TEA_DEBUG__
    if ([[NSFileManager defaultManager] fileExistsAtPath:kDatabasePath]){
        NSLog(@"File Exists.");
        [[NSFileManager defaultManager] removeItemAtPath:kDatabasePath error:nil];
    }
#endif
    
    // Software update.
//    [[AWVersionAgent sharedAgent] setDebug:YES];
    [[AWVersionAgent sharedAgent] checkNewVersionForApp:kMyAppID];
    
    // setup APP initial data.
    // create system table.
    [Database createTable];
    
    // show status bar for normal.
    [application setStatusBarHidden:NO];

    if (kCanLoadPassbook)
    {
        [PassSlot start:@"UWUtmqgoqbDLypTQGRMWtFppnYPTSliGzKkEZgYFVesnAUQjGueHDEPJXzwMIfNS"];
    }
    
    //向微信注册
    [WXApi registerApp:@"wx8f5ea607c7c9acdc"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.UIManager = [[TTUIManager alloc] init];
    
    self.window.rootViewController = self.UIManager.rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    // listenning network status.
    [self registerNetworkStatusListener];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[AWVersionAgent sharedAgent] upgradeAppWithNotification:notification];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - register network

- (void)registerNetworkStatusListener
{
    // Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the
    // method "reachabilityChanged" will be called.
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    //Change the host name here to change the server your monitoring
	hostReach = [Reachability reachabilityWithHostName:kAppHostAddress];
	[hostReach startNotifier];
	
    internetReach = [Reachability reachabilityForInternetConnection];
	[internetReach startNotifier];
    
    wifiReach = [Reachability reachabilityForLocalWiFi];
	[wifiReach startNotifier];
}

//Called by Reachability whenever status changes.
- (void)reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
//    NSLog(@"reachabilityChanged");
	//[self updateInterfaceWithReachability: curReach];
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:
        {
//            NSLog(@"Access Not Available");
//            [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
            break;
        }
        case ReachableViaWWAN:
        {
//            NSLog(@"Reachable WWAN");
            [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
            break;
        }
        case ReachableViaWiFi:
        {
//            NSLog(@"Reachable WiFi");
            [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
            break;
        }
    }
}


- (void)setAppKey:(NSString *)appKey {
	_appKey = appKey;
	[[NSUserDefaults standardUserDefaults] setValue:appKey forKey:@"appkey"];
}

- (void)setAppSecret:(NSString *)appSecret {
	_appSecret = appSecret;
	[[NSUserDefaults standardUserDefaults] setValue:appSecret forKey:@"appsecret"];
}

#pragma mark - WeChat SDK

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
//        NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
//        NSString *strMsg = [NSString stringWithFormat:@"发送媒体消息结果:%d", resp.errCode];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
//        NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
//        NSString *strMsg = [NSString stringWithFormat:@"Auth结果:%d", resp.errCode];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    }
}

-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        [self onRequestAppMessage];
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        [self onShowMediaMessage:temp.message];
    }
}

- (void) viewContent:(WXMediaMessage *) msg
{
    //显示微信传过来的内容
    WXAppExtendObject *obj = msg.mediaObject;
    
    NSString *strTitle = [NSString stringWithFormat:@"消息来自微信"];
    NSString *strMsg = [NSString stringWithFormat:@"标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%u bytes\n\n", msg.title, msg.description, obj.extInfo, msg.thumbData.length];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void) onRequestAppMessage
{
    // 微信请求App提供内容， 需要app提供内容后使用sendRsp返回
//    NSLog(@"start.");
}

-(void) onShowMediaMessage:(WXMediaMessage *) message
{
    // 微信启动， 有消息内容。
    [self viewContent:message];
}

@end
