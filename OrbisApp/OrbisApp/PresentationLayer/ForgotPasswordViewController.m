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

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FORGOT PASSWORD";
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
