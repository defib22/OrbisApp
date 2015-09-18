//
//  UserProfileBO.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 11/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseBO.h"

@interface UserProfileBO : BaseBO

@property(nonatomic,strong) NSString *userID;
@property(nonatomic,strong) NSString *emailID;
@property(nonatomic,strong) NSString *password;
@property(nonatomic,strong) NSString *firstName;
@property(nonatomic,strong) NSString *lastName;
@property(nonatomic,strong) NSString *mobileNumber;
@property(nonatomic,strong) NSString *fav_address;
@property(nonatomic,strong) NSString *home_address;
@property(nonatomic,strong) NSString *work_address;
@property(nonatomic,strong) NSString *profileImageURL;
@property(nonatomic,strong) UIImage *imgUserProfile;



+ (instancetype)sharedInstance;

@end
