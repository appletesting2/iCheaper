//
//  GlobalDefine.h
//  iCheaper
//
//  Created by twb on 13-4-10.
//  Copyright (c) 2013年 IBM. All rights reserved.
//

#ifndef iCheaper_GlobalDefine_h
#define iCheaper_GlobalDefine_h

#ifndef __TEA_DEBUG__
#define __TEA_DEBUG__
#endif

// APP
#define kAppHostAddress @"http://api.dianping.com/"
#define kAppKey @"429038071"
#define kAppSecret @"7ce12cc9d789400699f0c61281a5aeec"

#define kMyAppID @"643555297"

#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)[0]
#define kDatabaseFileName @"iCheaper.db"
#define kDatabasePath [kDocumentPath stringByAppendingPathComponent:kDatabaseFileName]
// system
#define kCurrentIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define kNavigationTitleFontSize 20.0f

// cell separator color
#define kCellSeparatorColor [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.0f]

// table group
#define kResizePadding 8.0f

#define kSDKVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define kCanLoadPassbook (kSDKVersion >= 6.0f)
#define kSDKMoreThan6 (kSDKVersion >= 6.0f)

// enum start with 100, end with 500
typedef NS_ENUM(NSInteger, UIPickerViewTag) {
    kPikcerViewSelectCity = 100,
    kPikcerViewSelectCategory,
    kPikcerViewSelectNear
};

// navigation and tab color
#define kNavigationTitleColor \
[UIColor colorWithRed:103.0f / 255.0f green:65.0f / 255.0f blue:19.0f / 255.0f alpha:1.0f]

// tab bar
//#define kTabBarTitleColor \
[UIColor colorWithRed:103.0f / 255.0f green:65.0f / 255.0f blue:19.0f / 255.0f alpha:1.0f]
#define kTabBarTitleColor [UIColor whiteColor]

// MACRO
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define kNavigationBarDefaultHeight (44.0f)
#define kTabBarControllerDefaultHeight (49.0f)
#define kNavigationBarShadowOffsetY (0.0f)
#define kStatusBarHeight_ (20.0f)

#define kContentHeight (kScreenHeight - kStatusBarHeight_ - kNavigationBarDefaultHeight - kTabBarControllerDefaultHeight)

// Search bar
#define kSearchBarPaddingX (0.0f)
#define kSearchBarPaddingY (0.0f)
#define kSearchBarWidth (kScreenWidth)
#define kSearchBarHeight (44.0f)

// network
#define kNetworkNotRegularPaddingX (10.0f)
#define kNetworkNotRegularPaddingY (kContentHeight / 3)
#define kNetworkNotRegularWidth (kScreenWidth - 2 * kNetworkNotRegularPaddingX)
#define kNetworkNotRegularHeight (150.0f)

#define kNetworkNotRegularLabelPaddingX ((kNetworkNotRegularWidth - 220.0f) / 2)
#define kNetworkNotRegularLabelPaddingY (5.0f)
#define kNetworkNotRegularLabelWidth (220.0f)
#define kNetworkNotRegularLabelHeight (30.0f)

#define kNetworkNotRegularImagePaddingX ((kNetworkNotRegularWidth - 94.0f) / 2)
#define kNetworkNotRegularImagePaddingY (40.0f)
#define kNetworkNotRegularImageWidth (94.0f)
#define kNetworkNotRegularImageHeight (115.0f)

// coupon cell
#define kCouponCellHeight 95.0f
#define kCouponCellPadding 5.0f

#define kCouponCellLogoPaddingX 10.0f
#define kCouponCellLogoPaddingY 15.0f
#define kCouponCellLogoImageWidth 80.0f
#define kCouponCellLogoImageHeight 65.0f

#define kCouponCellDistanceLabelPaddingX (10.0f)
#define kCouponCellDistanceLabelPaddingY (60.0f)
#define kCouponCellDistanceLabelWidth 80.0f
#define kCouponCellDistanceLabelHeight 20.0f

#define kCouponCellTitleHeight 30.0f
#define kCouponCellSubTitleHeight 35.0f

#define kCouponCellDownloadCountLabelPaddingX (kScreenWidth - 110.0f)
#define kCouponCellDownloadCountLabelPaddingY (kCouponCellPadding + kCouponCellTitleHeight + kCouponCellSubTitleHeight)
#define kCouponCellDownloadCountLabelWidth 100.0f
#define kCouponCellDownloadCountLabelHeight 15.0f

#define kCouponCellCategoryWidth 100.0f
#define kCouponCellCategoryHeight 15.0f

#define kCouponCellShadowHeight 5.0f

// select city
#define kCouponSelectCityPickerViewPaddingX 5.0f
#define kCouponSelectCityPickerViewPaddingY 50.0f
#define kCouponSelectCityPickerViewWidth (kScreenWidth - 2*kCouponSelectCityPickerViewPaddingX)
#define kCouponSelectCityPickerViewHeight 210.0f

#define kCouponSelectCityPickerContentViewRowHeight 45.0f

#define kCouponSelectCityCollectionCellHeaderPaddingX 5.0f
#define kCouponSelectCityCollectionCellHeaderPaddingY 0.0f
#define kCouponSelectCityCollectionCellHeaderWidth (kScreenWidth - 2*kCouponSelectCityCollectionCellHeaderPaddingX)
#define kCouponSelectCityCollectionCellHeaderHeight 30.0f

#define kCouponSelectCityCollectionViewPaddingX 5.0f
#define kCouponSelectCityCollectionViewPaddingY (5.0f + kCouponSelectCityCollectionCellHeaderHeight)
#define kCouponSelectCityCollectionViewWidth (kScreenWidth - 2*kCouponSelectCityCollectionViewPaddingX)
#define kCouponSelectCityCollectionViewHeight 120.0f

#define kCouponSelectCityCollectionViewCellLabelPaddingX 0.0f
#define kCouponSelectCityCollectionViewCellLabelPaddingY 5.0f
#define kCouponSelectCityCollectionViewCellLabelWidth 70.0f
#define kCouponSelectCityCollectionViewCellLabelHeight 40.0f

#define kCouponSelectCityCollectionCellWidth 70.0f
#define kCouponSelectCityCollectionCellHeight 50.0f
#define kCouponSelectCityCollectionCellMinimumInteritemSpacing 10.0f
#define kCouponSelectCityCollectionCellMinimumLineSpacing 10.0f

#define kCouponSelectCityConfirmButtonPaddingX 25.0f
#define kCouponSelectCityConfirmButtonPaddingY (5.0f + kCouponSelectCityCollectionViewPaddingY + kCouponSelectCityCollectionViewHeight)
#define kCouponSelectCityConfirmButtonWidth (kScreenWidth - 2*kCouponSelectCityConfirmButtonPaddingX)
#define kCouponSelectCityConfirmButtonHeight 35.0f

#define kCityTableViewHeight (kScreenHeight - kNavigationBarDefaultHeight - kStatusBarHeight_)

// near coupon
#define kCouponSelectNearPickerViewPaddingX 0.0f
#define kCouponSelectNearPickerViewPaddingY 10.0f
#define kCouponSelectNearPickerViewWidth (kScreenWidth - 2*kCouponSelectNearPickerViewPaddingX)
#define kCouponSelectNearPickerViewHeight 150.0f

#define kCouponSelectNearPickerViewTipLabelPaddingX 10.0f
#define kCouponSelectNearPickerViewTipLabelPaddingY 5.0f
#define kCouponSelectNearPickerViewTipLabelWidth (kCouponSelectNearPickerViewWidth - 2*kCouponSelectNearPickerViewTipLabelPaddingX)
#define kCouponSelectNearPickerViewTipLabelHeight 25.0f

#define kCouponSelectNearPickerViewSliderPaddingX 10.0f
#define kCouponSelectNearPickerViewSliderPaddingY (20.0f + kCouponSelectNearPickerViewTipLabelHeight)
#define kCouponSelectNearPickerViewSliderWidth (kCouponSelectNearPickerViewWidth - 2*kCouponSelectNearPickerViewSliderPaddingX)
#define kCouponSelectNearPickerViewSliderHeight 50.0f

#define kCouponSelectNearPickerViewMinLabelPaddingX 0.0f
#define kCouponSelectNearPickerViewMinLabelPaddingY (15.0f + kCouponSelectNearPickerViewTipLabelHeight)
#define kCouponSelectNearPickerViewMinLabelWidth 40.0f
#define kCouponSelectNearPickerViewMinLabelHeight 20.0f

#define kCouponSelectNearPickerViewMaxLabelPaddingX (kCouponSelectNearPickerViewWidth - 40.0f)
#define kCouponSelectNearPickerViewMaxLabelPaddingY (15.0f + kCouponSelectNearPickerViewTipLabelHeight)
#define kCouponSelectNearPickerViewMaxLabelWidth 40.0f
#define kCouponSelectNearPickerViewMaxLabelHeight 20.0f

#define kCouponSelectNearPickerViewCurrentLabelPaddingX 0.0f
#define kCouponSelectNearPickerViewCurrentLabelPaddingY (15.0f + kCouponSelectNearPickerViewTipLabelHeight)
#define kCouponSelectNearPickerViewCurrentLabelWidth (kCouponSelectNearPickerViewWidth)
#define kCouponSelectNearPickerViewCurrentLabelHeight 20.0f

#define kCouponSelectNearConfirmButtonPaddingX 25.0f
#define kCouponSelectNearConfirmButtonPaddingY (5.0f + kCouponSelectNearPickerViewSliderPaddingY + kCouponSelectNearPickerViewSliderHeight)
#define kCouponSelectNearConfirmButtonWidth (kScreenWidth - 2*kCouponSelectNearConfirmButtonPaddingX)
#define kCouponSelectNearConfirmButtonHeight 35.0f

// detail controller

#define kCouponDetailTitleHeight 40.0f
#define kCouponDetailBottomLineheight 9.0f

#define kCouponDetailBottomViewPaddingX 0.0f
#define kCouponDetailBottomViewPaddingY (kScreenHeight - 80.0f - kNavigationBarDefaultHeight)
#define kCouponDetailBottomViewWidth (kScreenWidth)
#define kCouponDetailBottomViewHeight 80.0f

#define kCouponDetailBottomViewButtonPaddingX (kScreenWidth - 150.0f - 20.0f)
#define kCouponDetailBottomViewButtonPaddingY (15.0f)
#define kCouponDetailBottomViewButtonWidth (150.0f)
#define kCouponDetailBottomViewButtonHeight 35.0f

#define kCouponDetailBottomViewSendMsgButtonPaddingX (10.0f)
#define kCouponDetailBottomViewSendMsgButtonPaddingY (15.0f)
#define kCouponDetailBottomViewSendMsgButtonWidth (120.0f)
#define kCouponDetailBottomViewSendMsgButtonHeight 35.0f

#define kCouponDetailTableViewPaddingX (0.0f)
#define kCouponDetailTableViewPaddingY (kCouponDetailTitleHeight)
#define kCouponDetailTableViewWidth (kScreenWidth)
#define kCouponDetailTableViewHeight (kScreenHeight - kNavigationBarDefaultHeight - kCouponDetailTitleHeight - kCouponDetailBottomViewHeight)


#define kCouponDetailWebViewPaddingX (0.0f)
#define kCouponDetailWebViewPaddingY (0.0f)
#define kCouponDetailWebViewWidth (kScreenWidth)
#define kCouponDetailWebViewHeight (kScreenHeight - kNavigationBarDefaultHeight - kCouponDetailBottomViewHeight)

// select categories

#define kCouponSelectCategoryTableViewPaddingX (0.0f)
#define kCouponSelectCategoryTableViewPaddingY (0.0f)
#define kCouponSelectCategoryTableViewWidth (kScreenWidth - 70.0f)
#define kCouponSelectCategoryTableViewHeight (kScreenHeight - kNavigationBarDefaultHeight - kStatusBarHeight_ - kTabBarControllerDefaultHeight)

/**
 * filter condition
 */ 
#define kCouponSelectConditionTableViewPaddingX (70.0f)
#define kCouponSelectConditionTableViewPaddingY (0.0f)
#define kCouponSelectConditionTableViewWidth (kScreenWidth - kCouponSelectConditionTableViewPaddingX)
#define kCouponSelectConditionTableViewHeight (kScreenHeight - kNavigationBarDefaultHeight - kStatusBarHeight_ - kTabBarControllerDefaultHeight)

// distance cell
#define kCouponFilterConditionDistancePaddingX 10.0f
#define kCouponFilterConditionDistancePaddingY 5.0f
#define kCouponFilterConditionDistanceWidth (kScreenWidth - 2*kCouponFilterConditionDistancePaddingX - kCouponSelectConditionTableViewPaddingX)
#define kCouponFilterConditionDistanceHeight 25.0f

#define kFilterConditionDistanceSliderPaddingX 10.0f
#define kFilterConditionDistanceSliderPaddingY (20.0f)
#define kFilterConditionDistanceSliderWidth (kCouponFilterConditionDistanceWidth - 2*kFilterConditionDistanceSliderPaddingX)
#define kFilterConditionDistanceSliderHeight 50.0f

#define kFilterConditionDistanceMinLabelPaddingX 0.0f
#define kFilterConditionDistanceMinLabelPaddingY (15.0f)
#define kFilterConditionDistanceMinLabelWidth 40.0f
#define kFilterConditionDistanceMinLabelHeight 20.0f

#define kFilterConditionDistanceMaxLabelPaddingX (kCouponFilterConditionDistanceWidth - 40.0f - 5.0f)
#define kFilterConditionDistanceMaxLabelPaddingY (15.0f)
#define kFilterConditionDistanceMaxLabelWidth 40.0f
#define kFilterConditionDistanceMaxLabelHeight 20.0f

#define kFilterConditionDistanceCurrentLabelPaddingX 0.0f
#define kFilterConditionDistanceCurrentLabelPaddingY (15.0f)
#define kFilterConditionDistanceCurrentLabelWidth (kCouponFilterConditionDistanceWidth - 2*kFilterConditionDistanceCurrentLabelPaddingX)
#define kFilterConditionDistanceCurrentLabelHeight 20.0f

// sort cell
#define kFilterConditionSortTitleLabelPaddingX (10.0f)
#define kFilterConditionSortTitleLabelPaddingY (10.0f)
#define kFilterConditionSortTitleLabelWidth (kCouponFilterConditionDistanceWidth - 2*kFilterConditionSortTitleLabelPaddingX)
#define kFilterConditionSortTitleLabelHeight (20.0f)


// keyword cell
#define kFilterConditionKeywordTextFieldPaddingX (10.0f)
#define kFilterConditionKeywordTextFieldPaddingY (10.0f)
#define kFilterConditionKeywordTextFieldWidth (kCouponFilterConditionDistanceWidth - 2*kFilterConditionKeywordTextFieldPaddingX)
#define kFilterConditionKeywordTextFieldHeight (20.0f)


// region cell
#define kFilterConditionRegionTitlePaddingX (10.0f)
#define kFilterConditionRegionTitlePaddingY (10.0f)
#define kFilterConditionRegionTitleWidth (kCouponFilterConditionDistanceWidth - 2*kFilterConditionRegionTitlePaddingX)
#define kFilterConditionRegionTitleHeight (20.0f)

/*
 * detail controller
 */
#define kDetailHeaderCouponDescriptionLabelPaddingX (10.0f)
#define kDetailHeaderCouponDescriptionLabelPaddingY (5.0f)
#define kDetailHeaderCouponDescriptionLabelWidth (kScreenWidth - 2*kDetailHeaderCouponDescriptionLabelPaddingX)
#define kDetailHeaderCouponDescriptionLabelHeight (30.0f)


/*
 * SendMessageController
 */
#define kSendMessageViewPaddingX (0.0f)
#define kSendMessageViewPaddingY (0.0f)
#define kSendMessageViewWidth (kScreenWidth)
#define KSendMessageViewHeight (kContentHeight + kTabBarControllerDefaultHeight)


/*
 * Near Coupons Controller.
 */
#define kNearCouponsViewPaddingX (0.0f)
#define kNearCouponsViewPaddingY kSearchBarHeight
#define kNearCouponsViewWidth (kScreenWidth)
#define KNearCouponsViewHeight (kContentHeight - kSearchBarHeight)

#define kNearCouponsMapViewPaddingX (0.0f)
#define kNearCouponsMapViewPaddingY (0.0f)
#define kNearCouponsMapViewWidth (kScreenWidth)
#define KNearCouponsMapViewHeight (kContentHeight - kSearchBarHeight)

#define kNearCouponsMapSearchRangePaddingX (0.0f)
#define kNearCouponsMapSearchRangePaddingY (0.0f)
#define kNearCouponsMapSearchRangeWidth (kScreenWidth)
#define KNearCouponsMapSearchRangeHeight (60.0f)


#define kNearCouponsMapViewDefaultDistance 1000


/*
 * My Coupons
 */
#define kMyCouponsTableViewPaddingX (0.0f)
#define kMyCouponsTableViewPaddingY (0.0f)
#define kMyCouponsTableViewWidth (kScreenWidth)
#define kMyCouponsTableViewHeight (kContentHeight)

#define kMyCouponsTableViewCellHeight 40.0f

#define kMyCouponsAnnounceHeaderViewPaddingX 0.0f
#define kMyCouponsAnnounceHeaderViewPaddingY 0.0f
#define kMyCouponsAnnounceHeaderViewWidth (kScreenWidth)
#define kMyCouponsAnnounceHeaderViewHeight 60.0f
/*
 * More info
 */
#define kMoreInfoTableViewPaddingX (0.0f)
#define kMoreInfoTableViewPaddingY (0.0f)
#define kMoreInfoTableViewWidth (kScreenWidth)
#define kMoreInfoTableViewHeight (kContentHeight - kSearchBarHeight)

#define kMoreInfoCellHeight 40.0f


// KFC
#define kKFCTableViewPaddingX (0.0f)
#define kKFCTableViewPaddingY (0.0f)
#define kKFCTableViewWidth (kScreenWidth)
#define kKFCTableViewHeight (kContentHeight + kTabBarControllerDefaultHeight)

#define kDetailViewPaddingX (0.0f)
#define kDetailViewPaddingY (0.0f)
#define kDetailViewWidth_ (kScreenWidth)
#define kDetailViewHeight_ (280.0f)

#define kDetailImageViewPaddingX (5.0f)
#define kDetailImageViewPaddingY (5.0f)
#define kDetailImageViewWidth (kScreenWidth - 2*kDetailImageViewPaddingX)
#define kDetailImageViewHeight (kDetailViewHeight_ - 2*kDetailImageViewPaddingY - 30.0f)

#define kDetailTipLabelPaddingX (0.0f)
#define kDetailTipLabelPaddingY (20.0f + 205.5f * 1.1)
#define kDetailTipLabelWidth (kScreenWidth)
#define kDetailTipLabelHeight (30.0f)


// Mcdonalds
#define kMcdonaldsImagePaddingX (5.0f)
#define kMcdonaldsImagePaddingY (5.0f)
#define kMcdonaldsImageWidth (kScreenWidth - 2*kMcdonaldsImagePaddingX)
#define kMcdonaldsImageHeight (360.0f)

#define kMcdonaldsTableViewPaddingX (0.0f)
#define kMcdonaldsTableViewPaddingY (0.0f)
#define kMcdonaldsTableViewWidth (kScreenWidth)
#define kMcdonaldsTableViewHeight (kContentHeight + kTabBarControllerDefaultHeight)


// Partner
#define kPartnerImagePaddingX (5.0f)
#define kPartnerImagePaddingY (5.0f)
#define kPartnerImageWidth (kScreenWidth - 2*kMcdonaldsImagePaddingX - 20.0f)
#define kPartnerImageHeight (70.0f)




#endif
