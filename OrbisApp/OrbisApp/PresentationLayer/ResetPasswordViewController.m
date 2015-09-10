//
//  ResetPasswordViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 05/09/15.
//  Copyright © 2015 bansalOrg. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "LoginViewController.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnResetPswdClicked:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
//    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LoginViewController *ctrlr = [st instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    [self.navigationController popToViewController:ctrlr animated:YES];
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
