//
//  DPAPI.h
//  apidemo
//
//  Created by ZhouHui on 13-1-28.
//  Copyright (c) 2013年 Dianping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPRequest.h"

#define kDPAppKey             @"429038071"
#define kDPAppSecret          @"7ce12cc9d789400699f0c61281a5aeec"

#ifndef kDPAppKey
#error
#endif

#ifndef kDPAppSecret
#error
#endif

@interface DPAPI : NSObject

- (DPRequest*)requestWithURL:(NSString *)url
					  params:(NSMutableDictionary *)params
					delegate:(id<DPRequestDelegate>)delegate;

- (DPRequest *)requestWithURL:(NSString *)url
				 paramsString:(NSString *)paramsString
					 delegate:(id<DPRequestDelegate>)delegate;

@end
