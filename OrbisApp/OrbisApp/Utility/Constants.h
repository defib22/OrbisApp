//
//  Constants.h
//  OrbisApp
//
//  Created by Defi Bansal on 23/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#ifndef OrbisApp_Constants_h
#define OrbisApp_Constants_h

#import "AppDelegate.h"

typedef enum{
    CROSS_ACTION = 900,
    PROFILE_ACTION,
    
}Right_Buttton_Action_Type;


#define NSBUNDLE_IMAGE(NAME) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:NAME ofType:@"png"]]

#define APP_DELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

// For Dashboard View
#define GenericTag 9000
#define NAV_BAR_LEFT_BTN_TAG 5760
#define TOP_NAV_BAR 4899576

#define MOVERIGHT  256
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_VERSION_GRT_5    ([(NSNumber*)[[UIDevice currentDevice] systemVersion] doubleValue] > 5.0)
#define IS_VERSION_GRT_7    ([(NSNumber*)[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)
#define IS_IPAD ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )


#endif
