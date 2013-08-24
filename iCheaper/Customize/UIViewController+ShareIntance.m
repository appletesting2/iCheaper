//
//  UIViewController+ShareIntance.m
//  iCheaper
//
//  Created by twb on 13-6-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "UIViewController+ShareIntance.h"
#import "MBProgressHUD.h"

@implementation UIViewController (ShareIntance)

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (TTUIManager *)UIManager
{
	return self.appDelegate.UIManager;
}

- (void) showProgressWithLabel:(NSString *) label task:(void (^)(void)) task completion:(void (^)(void)) completion
{
	assert(task);
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
	hud.labelText = label;
	dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
		task();
		dispatch_async(dispatch_get_main_queue(), ^{
			[MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
			if(completion)
				completion();
		});
	});
}

- (void) showProgressWithLabel2:(NSString *) label task:(void (^)(void)) task completion:(void (^)(void)) completion
{
	assert(task);
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	hud.labelText = label;
	dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
		task();
		dispatch_async(dispatch_get_main_queue(), ^{
			[MBProgressHUD hideHUDForView:self.view animated:YES];
			if(completion)
				completion();
		});
	});
}

@end
