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

@end

@implementation ProfileViewController
- (IBAction)btnSignOutClicked:(UIButton *)sender {
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LaunchScreenViewController *vc = [st instantiateViewControllerWithIdentifier:@"LaunchScreenViewController"];
    //[self.navigationController popToViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PROFILE";
    
    self.txtFldEmail.leftView = [self prepareLeftViewWithImage:@"mail_ic"];
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldName.leftView = [self prepareLeftViewWithImage:@"top_profile_ic"];
    self.txtFldName.leftViewMode = UITextFieldViewModeAlways;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
