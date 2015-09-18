//
//  ProfileViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 05/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "ProfileViewController.h"
#import "LaunchScreenViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtFldName;
@property (weak, nonatomic) IBOutlet UITextField *txtFldEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFldMobileNo;
@property (weak, nonatomic) IBOutlet UITextField *txtFldPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFldHomeAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldDestAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldFavAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldAddFavAdrs;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController
- (IBAction)btnSignOutClicked {
    //UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //LaunchScreenViewController *vc = [st instantiateViewControllerWithIdentifier:@"LaunchScreenViewController"];
    //[self.navigationController popToViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    requestManager = [[ConnectionManager alloc] init];

    // Do any additional setup after loading the view.
    self.title = @"PROFILE";
    
    self.txtFldEmail.leftView = [self prepareLeftViewWithImage:@"mail_ic"];
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldName.leftView = [self prepareLeftViewWithImage:@"top_profile_ic"];
    self.txtFldName.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldName.background = [UIImage imageNamed:@""];
    
    self.txtFldMobileNo.leftView = [self prepareLeftViewWithImage:@"mobile_ic"];
    self.txtFldMobileNo.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldPassword.leftView = [self prepareLeftViewWithImage:@"password_ic"];
    self.txtFldPassword.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldHomeAdrs.leftView = [self prepareLeftViewWithImage:@"home_ic"];
    self.txtFldHomeAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldDestAdrs.leftView = [self prepareLeftViewWithImage:@"dest_loc_ic"];
    self.txtFldDestAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldFavAdrs.leftView = [self prepareLeftViewWithImage:@"fav_ic"];
    self.txtFldFavAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldAddFavAdrs.leftView = [self prepareLeftViewWithImage:@"add_fav_ic"];
    self.txtFldAddFavAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"edit_ic"] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked)];
    revealButtonItem.tintColor = APP_TEXT_COLOR;
    
    
    self.navigationItem.rightBarButtonItem = revealButtonItem;
    
    [self updateProfileData];
    //[self setUpRightBarButtonItemWithImageName:@"edit_ic" andActionType:PROFILE_ACTION];
}

-(void) editButtonClicked{
    
    [self updateProfileInServer];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 70)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *gray_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
    gray_image_line.backgroundColor = [UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5];
    [view addSubview:gray_image_line];
    
    UIButton *btnSignOut = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnWidth = tableView.frame.size.width - 200;
    [btnSignOut setFrame:CGRectMake(tableView.frame.size.width/2 - (tableView.frame.size.width - 200)/2 , view.frame.size.height-40, btnWidth, 40)];
    
    [btnSignOut setBackgroundImage:[UIImage imageNamed:@"gray_btn"] forState:UIControlStateNormal];
    [btnSignOut setTitle:@"SIGN OUT" forState:UIControlStateNormal];
    [btnSignOut addTarget:self action:@selector(btnSignOutClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnSignOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:btnSignOut];
    
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat rowHeight = 44.0;
    NSString *string = @"String";
    
    if (section == 0) {
        rowHeight = 79.0;
        string = @"ACCOUNT";
    }else{
        rowHeight = 44.0;
        string = @"FAVORITE PLACES";
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, rowHeight)];
    [view setBackgroundColor:[UIColor whiteColor]];
    /* Create custom view to display section header... */
    
    if (section == 0) {
        
    }
    else{
        UIImageView *gray_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
        gray_image_line.backgroundColor = [UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5];
        [view addSubview:gray_image_line];
    }

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, (section==0)? 30:0, tableView.frame.size.width, 44)];
    [label setFont:FONT_TitilliumWeb_Bold(14.0)];
    label.textColor = APP_TEXT_COLOR;
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    
    UIImageView *yellow_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, rowHeight-1, tableView.frame.size.width, 1)];
    yellow_image_line.backgroundColor = YELLOW_COLOR;
    [view addSubview:yellow_image_line];
    
    //[view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 79;
    }else
        return 44;
    //return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 1)
    {
        return 70;
    }else
        return 0;
    //return UITableViewAutomaticDimension;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 89.0;
    }else
        return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 3) {
        NSLog(@"Insidde");
    }
}

-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName
{
    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 44, 70)];
    leftvwImage.image = [UIImage imageNamed:imgName];
    leftvwImage.contentMode = UIViewContentModeCenter;
    return leftvwImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateProfileData
{
    UserProfileBO *objUser = [UserProfileBO sharedInstance];
    
    self.txtFldName.text = objUser.firstName;
    self.txtFldMobileNo.text = objUser.mobileNumber;
    self.txtFldEmail.text = objUser.emailID;
    self.txtFldPassword.text = objUser.password;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    currentTextField = textField;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    currentTextField = textField;
    [self updateValuesInObject];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self updateValuesInObject];
    [textField resignFirstResponder];
    return YES;
}

-(void)updateValuesInObject
{
    UserProfileBO *objUser = [UserProfileBO sharedInstance];
    
    if(currentTextField == self.txtFldName){
        objUser.firstName = currentTextField.text;
    }
    else if(currentTextField == self.txtFldMobileNo){
        objUser.mobileNumber = currentTextField.text;
        
    }
    else if(currentTextField == self.txtFldEmail){
        objUser.emailID = currentTextField.text;
        
    }
    else if(currentTextField == self.txtFldPassword){
        objUser.password = currentTextField.text;
        
    }
}





-(void)updateProfileInServer{
    
    if(self.txtFldEmail.text.length && self.txtFldName.text.length &&  self.txtFldMobileNo.text.length && self.txtFldPassword.text.length ){
        
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
            
            NSString *urlUpdateUser = [NSString stringWithFormat:URL_UPDATE_USER,self.txtFldName.text,self.txtFldName.text,self.txtFldEmail.text,self.txtFldPassword.text,self.txtFldMobileNo.text,@"fav place",@"home address",@"business address",[[UserProfileBO sharedInstance] userID]];
            
            [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:urlUpdateUser andTag:REQUEST_UPDATE_USER completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
                
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


-(BOOL)checkEmailValidationForText:(NSString*)emailID
{
    NSString *emailEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailEx];
    return  [emailExPredicate evaluateWithObject:emailID];
}

-(BOOL)isValidateMobileNumber:(NSString*)mobileNumber{
    
    BOOL isValidate = NO;
    
    NSString *phoneRegex = @"^[789]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    if(mobileNumber.length == 10 && [phoneTest evaluateWithObject:mobileNumber] ){
        isValidate = YES;
    }
    
    return isValidate;
}

-(void)showAlertViewWithTitle:(NSString*)title andBody:(NSString*)body andDelegate:(id)delegate
{
    UIAlertView *alertVw = [[UIAlertView alloc] initWithTitle:title message:body delegate:delegate cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertVw show];
    alertVw = nil;
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
