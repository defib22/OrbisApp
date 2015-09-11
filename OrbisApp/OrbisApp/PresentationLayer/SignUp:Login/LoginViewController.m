//
//  LoginViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 28/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "LoginViewController.h"
#import "Constants.h"
#import "MapDashbaordViewController.h"
#import "RearViewController.h"

@interface LoginViewController ()<SWRevealViewControllerDelegate>
{
    ConnectionManager *requestManager;
}

@end

@implementation LoginViewController
-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName
{
    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    leftvwImage.image = [UIImage imageNamed:imgName];
    leftvwImage.contentMode = UIViewContentModeCenter;
    return leftvwImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    requestManager = [[ConnectionManager alloc] init];

    self.title = @"LOGIN";

//    [self designNavigationBarWithTitle:@"LOGIN"];
//    [self designBarNavigationLeftButton:YES];
    [self.navigationController setNavigationBarHidden:NO];
    
    self.txtFldEmail.leftView = [self prepareLeftViewWithImage:@"mail_ic"];
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldPswd.leftView = [self prepareLeftViewWithImage:@"password_ic"];
    self.txtFldPswd.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClicked:(UIButton *)sender {
  
    [self doLogin];
}


-(void)doLogin{
    
    if(self.txtFldEmail.text.length && self.txtFldPswd.text.length ){
        
        if(![self checkEmailValidationForText:self.txtFldEmail.text]){
            [self showAlertViewWithTitle:nil andBody:@"Please enter valid email address." andDelegate:nil];
            return;
        }
        else if (self.txtFldPswd.text.length <6){
            [self showAlertViewWithTitle:nil andBody:@"Password should be atleast 6 characters." andDelegate:nil];
            return;
        }
        
        if(APP_DELEGATE.isServerReachable){
            [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
            
            NSString *urlLogin = [NSString stringWithFormat:URL_LOGIN,self.txtFldEmail.text,self.txtFldPswd.text];
            
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

                [self setUpMapDashboard];
                
            }
        }
        
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




-(void)setUpMapDashboard
{

    
    MapDashbaordViewController *frontViewController = [[MapDashbaordViewController alloc] init];
    RearViewController *rearViewController = [[RearViewController alloc] init];
    
    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    
    APP_DELEGATE.window.rootViewController = revealController;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

// called when 'return' key pressed. return NO to ignore.




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
