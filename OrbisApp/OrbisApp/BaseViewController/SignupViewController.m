//
//  SignupViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

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
