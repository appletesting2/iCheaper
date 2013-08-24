//
//  TTNearShopMapView.m
//  TaoChen
//
//  Created by twb on 13-2-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTNearShopMapView.h"
#import "TTNearShopMapView+Delegate.h"

static NSString *kCLRegionID = @"CLRegionID";

@implementation TTNearShopMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupFilterCondition];
        
        mDistannceMeter = [fc radius];
        
        // location.
        if (!CLLocationManager.locationServicesEnabled) {
            NSLog(@"CLLocationManager disable.");
        }
        mLocationManager = [[CLLocationManager alloc] init];
        mLocationManager.distanceFilter = mDistannceMeter;
        mLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;

        // map view.
        NSMapView = [[MKMapView alloc] initWithFrame:CGRectMake(kNearCouponsMapViewPaddingX, kNearCouponsMapViewPaddingY, kNearCouponsMapViewWidth, KNearCouponsMapViewHeight)];
        [NSMapView setShowsUserLocation:YES];
//        [NSMapView.layer setBorderWidth:0.5f];
//        [NSMapView.layer setBorderColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f].CGColor];
        [NSMapView setUserTrackingMode:MKUserTrackingModeNone];
        
        NSMapView.delegate = self;
        [self addSubview:NSMapView];
        
    }
    return self;
}

- (void)setupFilterCondition
{
    fc = [FilterCondition sharedInstance];
}

#pragma mark - event part.

- (void)setMapViewAvailable:(BOOL)isAvailAble
{    
    if (isAvailAble) {
        mLocationManager.delegate = self;
        [mLocationManager startUpdatingLocation];
    }else{
        [mLocationManager stopUpdatingLocation];
        mLocationManager.delegate = nil;
    }
}

// init annotations
- (void)setShopAnnotations:(NSMutableArray *)shopAnnotations
{
    NSArray *annotations = [NSMapView annotations];
    if ([annotations count] > 0)
    {
        [NSMapView removeAnnotations:annotations];
    }
    
    [NSMapView addAnnotations:shopAnnotations];

}

- (void)drawRangeCircle
{
    [NSMapView setCenterCoordinate:mCoordinate];
    regionShop.center = mCoordinate;
    regionShop = MKCoordinateRegionMakeWithDistance(mCoordinate, mDistannceMeter, mDistannceMeter);
    regionShop.span = MKCoordinateSpanMake(0.03f, 0.03f);
    [NSMapView setRegion:[NSMapView regionThatFits:regionShop]];
    
    
    return;
    // draw range.
    if (circle != nil) {
        [NSMapView removeOverlay:circle];
    }
    circle = [MKCircle circleWithCenterCoordinate:mCoordinate radius:mDistannceMeter];
    [NSMapView addOverlay:circle];
    
//    @autoreleasepool
    {
        // get calculation region.
        CLRegion *regionTemp = [[CLRegion alloc] initCircularRegionWithCenter:mCoordinate radius:mDistannceMeter identifier:kCLRegionID];
        
        for (NSUInteger i = 0; i < [self.shopAnnotations count]; i++) {
            CouponsAnnotation *annotation = (CouponsAnnotation*)self.shopAnnotations[i];
            if ([regionTemp containsCoordinate:annotation.coordinate]) {
                [NSMapView removeAnnotation:annotation];
                [NSMapView addAnnotation:annotation];
            }
            else{
                // remove
                [NSMapView removeAnnotation:annotation];
            }
        }
        
        // release resource.
        regionTemp = nil;
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
