//
//  TTNearShopMapView.h
//  TaoChen
//
//  Created by twb on 13-2-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CouponsAnnotation.h"
#import "TTMapSearchRange.h"
#import "MKShopAnnotationView.h"
#import "MKShopPlacemarkView.h"
#import "MKShopAnnotationPopWindow.h"
#import "FilterCondition.h"
#import "RetrieveData.h"

@interface TTNearShopMapView : UIView
{
    MKMapView *NSMapView;
    MKCoordinateRegion regionShop;
    CLLocationCoordinate2D mCoordinate;
    MKCoordinateSpan mSpan;

    CLLocationManager *mLocationManager;

//    CLGeocoder *geocoder;
    MKCircle* circle;
    NSUInteger mDistannceMeter;
    
    FilterCondition *fc;
}

@property (nonatomic, assign) NSMutableArray *shopAnnotations;

- (void)setMapViewAvailable:(BOOL)isAvailAble;
- (void)drawRangeCircle;

@end
