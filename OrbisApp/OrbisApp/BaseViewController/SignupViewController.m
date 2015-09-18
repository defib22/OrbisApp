//
//  SignupViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()
{
    ConnectionManager *requestManager;

}
@end

@implementation SignupViewController


-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName
{
    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    leftvwImage.image = [UIImage imageNamed:imgName];
    leftvwImage.contentMode = UIViewContentModeCenter;
    return leftvwImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    requestManager = [[ConnectionManager alloc] init];

    // Do any additional setup after loading the view.
    self.title = @"SIGN UP";
    [self.navigationController setNavigationBarHidden:NO];

//    [self designNavigationBarWithTitle:@"SIGN UP"];
//    [self designBarNavigationLeftButton:YES];
//    [self.navigationController setNavigationBarHidden:YES];
    
    
    
    self.txtFldEmail.leftView = [self prepareLeftViewWithImage:@"mail_ic"];
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldFullName.leftView = [self prepareLeftViewWithImage:@"top_profile_ic"];
    self.txtFldFullName.leftViewMode = UITextFieldViewModeAlways;

    self.txtFldMobile.leftView = [self prepareLeftViewWithImage:@"mobile_ic"];
    self.txtFldMobile.leftViewMode = UITextFieldViewModeAlways;

    self.txtFldPassword.leftView = [self prepareLeftViewWithImage:@"password_ic"];
    self.txtFldPassword.leftViewMode = UITextFieldViewModeAlways;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


-(void)doSignup{
    
    if(self.txtFldEmail.text.length && self.txtFldFullName.text.length &&  self.txtFldMobile.text.length && self.txtFldPassword.text.length ){
        
        if(![self checkEmailValidationForText:self.txtFldEmail.text]){
            [self showAlertViewWithTitle:nil andBody:@"Please enter valid email address." andDelegate:nil];
            return;
        }
        
        else if (self.txtFldPassword.text.length <6){
            [self showAlertViewWithTitle:nil andBody:@"Password should be atleast 6 characters." andDelegate:nil];
            return;
        }
        
        

        if(APP_DELEGATE.isServerReachable){
            
            [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
            
            NSString *urlSignup = [NSString stringWithFormat:URL_SIGNUP,self.txtFldFullName.text,self.txtFldFullName.text,self.txtFldEmail.text,self.txtFldPassword.text,self.txtFldMobile.text,@"fav place",@"home address",@"business address"];
            
            [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:urlSignup andTag:REQUEST_SIGNUP completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
                
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
        [self showAlertViewWithTitle:nil andBody:@"Please enter all required fields" andDelegate:nil];
        
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
                UserProfileBO *profileObj = [UserProfileBO sharedInstance];

                profileObj.userID =[dictResponse objectForKey:@"user_id"];
                profileObj.emailID =[dictResponse objectForKey:@"email"];
                profileObj.firstName =[dictResponse objectForKey:@"first_name"];
                profileObj.lastName =[dictResponse objectForKey:@"second_name"];
                profileObj.mobileNumber =[dictResponse objectForKey:@"mobile"];
                profileObj.home_address =[dictResponse objectForKey:@"home_address"];
                profileObj.work_address =[dictResponse objectForKey:@"work_address"];
                profileObj.profileImageURL =[dictResponse objectForKey:@"profile_image"];
             
                [self showAlertViewWithTitle:@"ORBIS" andBody:[object objectForKey:ERROR_RESPONSE_MESSAGE] andDelegate:self];
//                [self showAlertViewWithTitle:@"Success" andBody:@"You have successfully registered in the app.Please do login with your credentials to book the service." andDelegate:self];

            }
        }
        
    }
    else{
        [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:ERROR_RESPONSE_MESSAGE] andDelegate:nil];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)responseFailed:(NSError*)error
{
    [DejalBezelActivityView removeViewAnimated:YES];
    [self showAlertViewWithTitle:@"Error" andBody:error.localizedDescription ? error.localizedDescription : UNEXPECTED_ERROR_OCCURED andDelegate:nil];
}

- (IBAction)btnNextClicked:(id)sender {
    [self doSignup];
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
