//
//  CouponsAnnotation.h
//  iCheaper
//
//  Created by twb on 13-4-18.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CouponsAnnotation : NSObject <MKAnnotation>
// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
@property (nonatomic, strong) NSString *title;
// optional
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, assign) NSUInteger tagID;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
