//
//  AppSettings.m
//  AskMePay
//
//  Created by Kuldeep Saini on 28/07/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import "AppSettings.h"

@implementation AppSettings
@synthesize accessToken,userPhoneNumber,refreshToken,responseTokenType;


+ (instancetype)sharedInstance
{
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppSettings alloc] init];
        // Do any other initialisation stuff here
        
    });
    return sharedInstance;
}


- (NSString*) appVersion{
    return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}


+ (NSString *) appVersionNew
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+ (NSString *) build
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}

+ (NSString *) versionBuild
{
    NSString * version = [self appVersionNew];
    NSString * build = [self build];
    
    NSString * versionBuild = [NSString stringWithFormat: @"v%@", version];
    
    if (![version isEqualToString: build]) {
        versionBuild = [NSString stringWithFormat: @"%@(%@)", versionBuild, build];
    }
    
    return versionBuild;
}


- (NSString *)stringUniqueID {
    
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string ;
}




@end
