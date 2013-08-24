//
//  MoreInfoController+Delegate.m
//  iCheaper
//
//  Created by twb on 13-4-19.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "MoreInfoController+Delegate.h"


@implementation MoreInfoController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kMoreInfoCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // iso-8859-1
    if (indexPath.section == kMoreInfoSectionAbout)
    {
        if (indexPath.row == kMoreInfoRowSuggestion)
        {
            [self sendEMail];
        }
        else if (indexPath.row == kMoreInfoRowDisclaimers)
        {
            DisclaimerViewController *disclaimer = [[DisclaimerViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:disclaimer animated:YES];
        }
        else if (indexPath.row == kMoreInfoRowAbout)
        {
            AboutUSViewController *aboutUs = [[AboutUSViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:aboutUs animated:YES];
        }
    }
    else if (indexPath.section == kMoreInfoSectionAppraise)
    {
        NSString *str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", kMyAppID];
        NSLog(@"str = %@", str);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    else if (indexPath.section == kMoreInfoSectionVersion)
    {
        if (indexPath.row == kMoreInfoRowVersion)
        {
            
        }
    }
}


/**************************************************************************
 ************************Send Mail Module Begin****************************
 **************************************************************************/

- (void)sendEMail
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            // Send Email.
            [self displayComposeEmailSheet];
        }
        else
        {
            // not supported.
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}

- (void)displayComposeEmailSheet
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.navigationBar.tintColor = kNavigationTitleColor;
    mailPicker.mailComposeDelegate = self;
    [mailPicker setSubject:@"意见反馈"];
    [mailPicker setToRecipients:@[@"angeltwb@me.com"]];

    [self.navigationController presentViewController:mailPicker animated:YES completion:^{
        
    }];
}

-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:angeltwb@me.com&subject=意见反馈";
    //@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=my email!";
    //    NSString *body = @"&body=你好:\n我想修电脑\n我的电话:\n请尽快联系我,谢谢!";
    NSString *body;
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0)
{
    //    NSLog(@"error = %@", [error localizedDescription]);
    NSString *msg;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)alertWithTitle: (NSString *)title msg:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}

/**************************************************************************
 ************************Send Mail Module End******************************
 **************************************************************************/

@end
