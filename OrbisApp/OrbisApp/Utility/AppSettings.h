//
//  AppSettings.h
//  AskMePay
//
//  Created by Kuldeep Saini on 28/07/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSettings : NSObject


@property(nonatomic,strong)NSString *userPhoneNumber;
@property(nonatomic,strong)NSString *accessToken;
@property(nonatomic,strong)NSString *refreshToken;
@property(nonatomic,strong)NSString *responseTokenType;
@property(nonatomic,assign)double expiryTime;

@property(nonatomic,strong)NSString *serverReachability;


+ (instancetype)sharedInstance;

- (NSString*) appVersion;

- (NSString*) appUniqueID;

+ (NSString *) versionBuild;

@end
