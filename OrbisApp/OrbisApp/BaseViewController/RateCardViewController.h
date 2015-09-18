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

@interface RateCardViewController : BaseViewController{
    NSString *operationFees;
}
@property(nonatomic,strong)NSString *rateCardType;
@property(nonatomic,assign) RateCardType RATE_CARD_FOR;

@property (weak, nonatomic) IBOutlet UILabel *lblShippingWeight;

@property (weak, nonatomic) IBOutlet UILabel *lblMinPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupAmount;

@property (weak, nonatomic) IBOutlet UILabel *lblPerMile;

@property (weak, nonatomic) IBOutlet UILabel *lblPerMinute;

@property (weak, nonatomic) IBOutlet UILabel *lblOperation;





@end
