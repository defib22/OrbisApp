//
//  RateCardViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "RateCardViewController.h"

@interface RateCardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bikeImageView;

@end

@implementation RateCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    operationFees = @"";
    
    self.lblMinPrice.text = @"";
    self.lblPerMile.text = @"";
    self.lblPerMinute.text = @"";
    self.lblPickupAmount.text = @"";
    self.lblShippingWeight.text = @"";
    self.lblOperation.text = [NSString stringWithFormat:@"%@ operations fee added to all deliveries Minute charges apply to all extended wait times",operationFees];
    [self getRateCardDetails];
    
    

}

-(void) viewWillAppear:(BOOL)animated{
    NSString *imageName=  @"";
    switch (self.RATE_CARD_FOR) {
        case BIKE_NOW:{
            self.rateCardType = @"bike";
            imageName= @"bike_now";
            break;}
        case CAR_SHARE:{
            self.rateCardType = @"carshare";
            imageName=@"car_share";}
            break;
        case CAR_NOW:{
            self.rateCardType = @"carnow";
            imageName=@"car_now";}
            break;
            
        default:
            break;
    }
    self.bikeImageView.image = [UIImage imageNamed:imageName];
    [super viewWillAppear:animated];
}
- (IBAction)btnCrossClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)getRateCardDetails{
    
    if(APP_DELEGATE.isServerReachable){
        [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
        
        ConnectionManager *requestManager = [[ConnectionManager alloc] init];
        [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:URL_GET_DRIVER_TYPES andTag:REQUEST_GET_DRIVER_TYPES completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
            
            if(object != nil){
                [self performSelectorOnMainThread:@selector(responseSucceed:) withObject:object waitUntilDone:YES];
            }
            else{
                [self performSelectorOnMainThread:@selector(responseFailed:) withObject:error waitUntilDone:YES];
            }
        }];
    }
    else{
        [APP_DELEGATE noInternetConnectionAvailable];
    }
}

-(void)responseSucceed:(id)object
{
    [DejalBezelActivityView removeViewAnimated:YES];
    
    if([[object objectForKey:RESPONSE_CODE] integerValue] == SUCCESS_STATUS_CODE_RESPONSE){
        if ([[object objectForKey:RESPONSE_MESSAGE] isKindOfClass:[NSString class]]) {
            [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:RESPONSE_MESSAGE] andDelegate:nil];
        }
        else{
            NSDictionary *dictData = [object objectForKey:RESPONSE_MESSAGE];
            NSDictionary *dictCardType = [dictData objectForKey:self.rateCardType];
            self.lblMinPrice.text = [dictCardType objectForKey:@"minimumCharges"];
            self.lblPerMile.text = [dictCardType objectForKey:@"perMileCharge"];
            self.lblPerMinute.text = [dictCardType objectForKey:@"perMinCharge"];
            self.lblPickupAmount.text = [dictCardType objectForKey:@"pickUpCharges"];
            self.lblShippingWeight.text = [dictCardType objectForKey:@"shippingWeight"];
            operationFees = [dictCardType objectForKey:@"operationFee"];
            
            self.lblOperation.text = [NSString stringWithFormat:@"%@ operations fee added to all deliveries Minute charges apply to all extended wait times",operationFees];

        }
    }
    else{
        [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:ERROR_RESPONSE_MESSAGE] andDelegate:nil];
    }
    
}

-(void)responseFailed:(NSError*)error
{
    [DejalBezelActivityView removeViewAnimated:YES];
    [self showAlertViewWithTitle:@"Error" andBody:error.localizedDescription ? error.localizedDescription : UNEXPECTED_ERROR_OCCURED andDelegate:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
