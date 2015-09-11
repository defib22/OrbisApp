//
//  UserProfileBO.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 11/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "UserProfileBO.h"

@implementation UserProfileBO

+ (instancetype)sharedInstance
{
    static UserProfileBO *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserProfileBO alloc] init];
        // Do any other initialisation stuff here
     });
    return sharedInstance;
}


@end
