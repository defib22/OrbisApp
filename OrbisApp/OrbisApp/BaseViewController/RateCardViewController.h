//
//  RateCardViewController.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseViewController.h"

typedef enum{
    BIKE_NOW = 100,
    CAR_NOW,
    CAR_SHARE
    
}RateCardType;

@interface RateCardViewController : BaseViewController

@property(nonatomic,assign) RateCardType RATE_CARD_FOR;

@end
