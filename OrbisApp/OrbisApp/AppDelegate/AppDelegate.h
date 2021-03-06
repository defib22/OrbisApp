//
//  AppDelegate.h
//  OrbisApp
//
//  Created by Defi Bansal on 23/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Reachability.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) UINavigationController *navController;

@property (nonatomic)         BOOL isServerReachable;
@property (nonatomic, strong) Reachability *serverReachability;

-(void)noInternetConnectionAvailable;

@end

