//
//  ForgotPasswordViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "Constants.h"
#import "ResetPasswordViewController.h"

@interface ForgotPasswordViewController (){
ConnectionManager *requestManager;
}
@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FORGOT PASSWORD";
    
    requestManager = [[ConnectionManager alloc] init];

    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    leftvwImage.image = [UIImage imageNamed:@"mail_ic"];
    leftvwImage.contentMode = UIViewContentModeCenter;
    self.txtFldEmail.leftView = leftvwImage;
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getForgotPasswordLink{
    
    if(self.txtFldEmail.text.length ){
        
        if(![self checkEmailValidationForText:self.txtFldEmail.text]){
            [self showAlertViewWithTitle:nil andBody:@"Please enter valid email address." andDelegate:nil];
            return;
        }
        
        if(APP_DELEGATE.isServerReachable){
            
            [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
            
            NSString *urlLogin = [NSString stringWithFormat:URL_FORGOT_PASSWORD,self.txtFldEmail.text];
            
            [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:urlLogin andTag:REQUEST_LOGIN completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
                
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
    else{
        [self showAlertViewWithTitle:nil andBody:@"Please enter valid credentials" andDelegate:nil];
        
    }
}

-(void)responseSucceed:(id)object
{
    [DejalBezelActivityView removeViewAnimated:YES];
    
    if([[object objectForKey:RESPONSE_CODE] integerValue] == SUCCESS_STATUS_CODE_RESPONSE){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ResetPasswordViewController *vwController = [sb instantiateViewControllerWithIdentifier:@"ResetPassword"];
        [self.navigationController pushViewController:vwController animated:YES];

    }
    else{
        [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:RESPONSE_MESSAGE] andDelegate:nil];
    }
}


-(void)responseFailed:(NSError*)error
{
    [DejalBezelActivityView removeViewAnimated:YES];
    [self showAlertViewWithTitle:@"Error" andBody:error.localizedDescription ? error.localizedDescription : UNEXPECTED_ERROR_OCCURED andDelegate:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnResetPasswordClicked:(id)sender {
    
    [self getForgotPasswordLink];
}
@end
