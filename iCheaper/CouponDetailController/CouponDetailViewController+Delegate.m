//
//  CouponDetailViewController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-11.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "CouponDetailViewController+Delegate.h"

#define kResizePadding 8.0f

@implementation CouponDetailViewController (Delegate)

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *keywords = [[businessArray[indexPath.row] valueForKeyPath:@"name"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"dianping://shoplist?q=%@",keywords]];
    
    if([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
    else
    {
        //没有安装应用，默认打开WAP站
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.dianping.com/search.aspx?skey=%@", keywords]];
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark - RetrieveCouponsDelegate

- (void)RetrieveCoupons
{
    // passbook
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    
    NSLog(@"%f", [[[UIDevice currentDevice] systemVersion] floatValue]);
    
    if (!kCanLoadPassbook)
    {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"Passbook只支持iOS6.0+" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在获取,请稍候...";
    hud.removeFromSuperViewOnHide = YES;
    
    if (self.coupon.activityDescription == nil)
    {
        self.coupon.activityDescription = self.coupon.description;
    }
    
    NSMutableArray *businessList = [NSMutableArray arrayWithCapacity:0];
    
    for (NSUInteger i = 0; i < [businessArray count]; i++)
    {
        NSDictionary *dictionary = [businessArray objectAtIndex:i];
        // Download Business List
        NSUInteger nBusinessID = [[dictionary valueForKeyPath:@"id"] integerValue];
        [[RetrieveData sharedInstance] retrieveBusiness:nBusinessID WithBlock:^(Businesses *business, NSError *error) {
            if (error == nil)
            {
                [businessList addObject:business];
                if (i == [businessArray count] - 1)
                {
                    [self generatePass:businessList];
                }
            }
            else
            {
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            }
        }];
    }
}

- (void)generatePass:(NSMutableArray *)businesses
{
    // combine business informations.
    NSMutableString *businessString = [NSMutableString string];
//    NSMutableString *locations = [NSMutableString string];
    for (Businesses *business in businesses)
    {
        NSString *businessName;
        if (business.branch_name == nil || [business.branch_name isEqualToString:@""])
        {
            businessName = business.name;
        }
        else
        {
            businessName = [NSString stringWithFormat:@"%@(%@)", business.name, business.branch_name];
        }
        
        NSString *businessInformation = [NSString stringWithFormat:@"%@\n%@\n%@\n\n", businessName, business.telephone, business.address];
        [businessString appendString:businessInformation];
        
//        [locations appendString:[NSString stringWithFormat:@"{\"latitude\" : %f, \"longitude\" : %f},", [business.latitude floatValue], [business.longitude floatValue]]];
    }
    
    // no need douhao of last one char
//    NSString *locationString = [NSString stringWithFormat:@"[%@]", [locations substringToIndex:locations.length - 1]];
    
    
    NSString *backField = [self.coupon.activityDescription stringByAppendingFormat:@", %@至%@有效.", self.coupon.publish_date, self.coupon.expiration_date];
    
    NSString *expiredate = [NSString stringWithFormat:@"%@(详情见背面)", self.coupon.expiration_date];
    NSDictionary *values = @{
                             @"logoText" : [self.coupon.title stringByAppendingString:@"优惠券"],
                             @"description" : self.coupon.description,
                             @"acitivitydescription" : backField,
                             @"expiredate" : expiredate,
                             @"businesslist" : businessString
//                             @"locations" : locationString
                             };
    [PassSlot createPassFromTemplateWithName:@"iCheaper" withValues:values andRequestInstallation:self completion:^{
//        hud.hidden = YES;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

- (void)SendMessage
{
    // send message.
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    
    SendMessageViewController *sendMessageController = [[SendMessageViewController alloc] initWithNibName:nil bundle:nil];
    [sendMessageController setWebUrl:self.coupon.coupon_h5_url];
    NSLog(@"self.coupon.coupon_h5_url = %@", self.coupon.coupon_h5_url);
//    [sendMessageController setWebUrl:self.coupon.coupon_url];
    NavigationController *navSendMessage = [[NavigationController alloc] initWithRootViewController:sendMessageController];
    [self.navigationController presentViewController:navSendMessage animated:YES completion:nil];

}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self sendShareAppContent];
    }
}

@end
