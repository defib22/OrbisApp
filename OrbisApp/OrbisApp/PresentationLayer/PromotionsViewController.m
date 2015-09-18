//
//  PromotionsViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "PromotionsViewController.h"

@interface PromotionsViewController ()<UITextFieldDelegate>
{
    UITextField *txtFldPromotions;
}
@end

@implementation PromotionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"PROMOTIONS";
    
    txtFldPromotions = [[UITextField alloc] initWithFrame:CGRectMake(20, 87, CGRectGetWidth(self.view.frame)-40, 40)];
    txtFldPromotions.borderStyle = UITextBorderStyleRoundedRect;
    txtFldPromotions.delegate = self;
    txtFldPromotions.placeholder = @"Promo Code";
    txtFldPromotions.font = FONT_TitilliumWeb_Regular(14.0);
     txtFldPromotions.leftView = [self prepareLeftViewWithImage:@"tag_icon"];
    txtFldPromotions.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:txtFldPromotions];
    
    UIButton *btnApply = [UIButton buttonWithType:UIButtonTypeCustom];
    btnApply.frame = CGRectMake((CGRectGetWidth(self.view.frame)/2)-75, 147, 150, 45);
    [btnApply setTitleColor:APP_TEXT_COLOR forState:UIControlStateNormal];
    [btnApply setTitle:@"APPLY" forState:UIControlStateNormal];
    btnApply.titleLabel.font = FONT_TitilliumWeb_SemiBold(15.0);
    [btnApply addTarget:self action:@selector(btnApplyClicked) forControlEvents:1];
    [btnApply setBackgroundImage:[UIImage imageNamed:@"sing_in"] forState:UIControlStateNormal];
    [self.view addSubview:btnApply];
    
}

-(void)btnApplyClicked
{
    if(txtFldPromotions.text.length>0){
    [self applyPromoCode];
    }
    else{
        [self showAlertViewWithTitle:@"Alert" andBody:@"Please enter promo code." andDelegate:nil];
    }
}


-(void)applyPromoCode{
    
    if(APP_DELEGATE.isServerReachable){
        [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
        
        NSString *urlPromo = [NSString stringWithFormat:URL_APPLY_PROMO_CODE,txtFldPromotions.text];
        
        ConnectionManager *requestManager = [[ConnectionManager alloc] init];
        [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:urlPromo andTag:REQUEST_APPLY_PROMO_CODE completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
            
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
            if ([[object objectForKey:RESPONSE_MESSAGE] isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *dictResponse = [object objectForKey:RESPONSE_MESSAGE];
                [self showAlertViewWithTitle:@"Success" andBody:[dictResponse objectForKey:@"discountAmt"] andDelegate:nil];
            }
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
