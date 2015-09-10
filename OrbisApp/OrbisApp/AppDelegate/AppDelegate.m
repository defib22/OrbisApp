//
//  AppDelegate.m
//  OrbisApp
//
//  Created by Defi Bansal on 23/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import "LaunchScreenViewController.h"

@interface AppDelegate ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@end

@implementation AppDelegate
@synthesize currentLocation;
@synthesize isServerReachable;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self configureReachability];

    [self setNavigationBarAppearance];
    
    [self fetchCurrentLocation];
    
    return YES;
}

-(void)setNavigationBarAppearance
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
    
    //    [[UINavigationBar appearance]setBarTintColor:BLUE_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:APP_TEXT_COLOR, NSForegroundColorAttributeName,
                                                           FONT_TitilliumWeb_Regular(18), NSFontAttributeName, nil]];
    //    [[UINavigationBar appearance] setTintColor:WHITE_COLOR];
    
    
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"top_back_ic"]
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)fetchCurrentLocation
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];

}

#pragma mark- Reachability
#pragma mark-
-(void)configureReachability
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    
    self.serverReachability = [Reachability reachabilityForInternetConnection];
    [self.serverReachability startNotifier];
    [self updateInterfaceWithReachability:self.serverReachability];
}

- (void)reachabilityChanged:(NSNotification*)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability*)curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus)
    {
        case NotReachable:
            self.isServerReachable = NO;
            break;
        case ReachableViaWWAN:{
            [[AppSettings sharedInstance] setServerReachability:@"3G"];
            self.isServerReachable = YES;
        }
            break;
        case ReachableViaWiFi:{
            [[AppSettings sharedInstance] setServerReachability:@"Wifi"];
            self.isServerReachable = YES;
        }
            break;
    }
}


-(void)noInternetConnectionAvailable
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ASKME PAY" message:@"This application requires Internet Connection. Please check your connection." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    alert = nil;
}


@end
