//
//  TTNearShopMapView+Delegate.m
//  TaoChen
//
//  Created by twb on 13-2-13.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#import "TTNearShopMapView+Delegate.h"
#import "SendMessageViewController.h"

@implementation TTNearShopMapView (Delegate)

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"didUpdateToLocation...");
    mCoordinate = newLocation.coordinate;
    
    // save
    [fc setLatitude:mCoordinate.latitude];
    [fc setLongitude:mCoordinate.longitude];
    
    // draw range.
    [self drawRangeCircle];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
//         NSLog(@"error = %@", error);
         if (placemarks.count >0)
         {
             CLPlacemark *plmark = [placemarks objectAtIndex:0];
             NSString *country = plmark.name;
//             [mapSearchRange showDistance:NO];
//             [mapSearchRange setLocationLabel:plmark.name];
             NSLog(@"%@",country);
         }
         
         //NSLog(@"%@",placemarks);
     }];
}


#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // in case it's the user location, we already have an annotation, so just return nil
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
//        UserLocation.png
        static NSString *kCouponsUserLocation = @"CouponsUserLocation";
        MKAnnotationView *userLocation = [NSMapView dequeueReusableAnnotationViewWithIdentifier:kCouponsUserLocation];
        if (userLocation == nil)
        {
            userLocation = [[MKAnnotationView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
            userLocation.image = [UIImage imageNamed:@"UserLocation.png"];
        }
        
//        return nil;
    }

    // handle our three custom annotations
    //
    
    if ([annotation isKindOfClass:[CouponsAnnotation class]])
    {
        // try to dequeue an existing pin view first
        static NSString *kCouponsIdentifier = @"CouponsIdentifier";
        
        MKPinAnnotationView *pinView =
        (MKPinAnnotationView *) [NSMapView dequeueReusableAnnotationViewWithIdentifier:kCouponsIdentifier];
        if (pinView == nil)
        {
            // if an existing pin view was not available, create one
            MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                                  initWithAnnotation:annotation reuseIdentifier:kCouponsIdentifier];
            customPinView.pinColor = MKPinAnnotationColorPurple;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: when the detail disclosure button is tapped, we respond to it via:
            //       calloutAccessoryControlTapped delegate method
            //
            // by using "calloutAccessoryControlTapped", it's a convenient way to find out which annotation was tapped
            //
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(openCouponInfo:) forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    
    return nil;
}

- (void)openCouponInfo:(UIButton *)sender
{
    // send message.
    if (![[TTCheckNetwork sharedInstance] networkIsOK])
    {
        [[ToolKit sharedInstance] postErrorMessage:@"无法连接到网络,请稍后再试"];
        return;
    }
    
    CouponsAnnotation *annotation = [NSMapView selectedAnnotations][0];
    MBProgressHUD *mapHud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    mapHud.labelText = @"正在载入...";
    mapHud.removeFromSuperViewOnHide = YES;
    
    [[RetrieveData sharedInstance] retrieveCoupon:annotation.tagID WithBlock:^(Coupons *coupon, NSError *error) {
        if (error == nil && coupon != nil)
        {
            //                NSLog(@"coupon = %@", coupon);
            NotificationBody *notification = [[NotificationBody alloc] init];
            notification.body = coupon;
            notification.tag = kNotificationNearRetrieveCouponTag;
            [NotificationBody postNearRetrieveCouponWithNotificationBody:notification];
        }
        
        mapHud.hidden = YES;
    }];

}

#pragma mark - TTMapPopWindowDelegate

- (void)moreDetail
{
    // Maybe pass data to parent controller from now on.
    
//    [self.delegate cellButtonAction:nil];
    //    [self.flipDelegate nearShopListFlipView];
    
    
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKCircle class]])
    {
        //NSLog(@"viewForOverlay...");
        MKCircleView* circleView = [[MKCircleView alloc] initWithOverlay:overlay];
        circleView.fillColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1f];
        circleView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5f];
        circleView.lineWidth = 3.0f;
        return circleView;
    }
    
    return nil;
}

//- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0)
//{
//    // assign coordinate for route.
//    mCoordinate = [view.annotation coordinate];
//    [NSMapView setCenterCoordinate:mCoordinate animated:YES];
//    
//    if ([view isKindOfClass:[MKShopAnnotationView class]])
//    {
//        
//    }
//    
//}
//
//- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0)
//{   
//    if ([view isKindOfClass:[MKShopAnnotationView class]])
//    {
//
//    }
//    
//}


@end
