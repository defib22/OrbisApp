//
//  ForgotPasswordViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "Constants.h"

@interface ForgotPasswordViewController ()
@property (weak, nonatomic) IBOutlet UIView *pswdResetView;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FORGOT PASSWORD";

//    [self designNavigationBarWithTitle:@"FORGOT PASSWORD"];
//    [self designBarNavigationLeftButton:YES];
//    [self.navigationController setNavigationBarHidden:YES];
    
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

- (IBAction)btnResetPswdClicked:(UIButton *)sender {
    self.pswdResetView.hidden = NO;
    UIImageView *imgVw = (UIImageView *)[self.view viewWithTag:TOP_NAV_BAR];
    [imgVw setHidden:YES];
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:NAV_BAR_LEFT_BTN_TAG];
    [btn setHidden:YES];
}
- (IBAction)btnOkClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
