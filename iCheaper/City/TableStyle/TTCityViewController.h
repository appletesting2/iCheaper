//
//  TTCityViewController.h
//  TaoChen
//
//  Created by twb on 13-2-23.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCityCell.h"
#import "TTTableViewHeaderView.h"
#import "Cities.h"
#import "FilterCondition.h"

#define kGetDistrictName(indexPath) [([(Cities *)supportCities[indexPath.section] districts][indexPath.row]) valueForKeyPath:@"district_name"]

@protocol TTSelectCityDelegate <NSObject>
@required
- (void)selectedCityName:(NSString *)cityName;

@end

@interface TTCityViewController : UIViewController
{
    NSMutableArray *sortedCityKeys;
    UITableView *cityTableView;
    
    NSArray *supportCities;
    
    FilterCondition *fc;
}

@property (nonatomic, weak) id<TTSelectCityDelegate> delegate;
@property (nonatomic, strong) NSString *currentCityName;

- (void)closeCitySetting:(id)sender;

@end
