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
  
    [self setUpMapDashboard];
 }


-(void)setUpMapDashboard
{

    
//    APP_DELEGATE.navController = (UINavigationController*) APP_DELEGATE.window.rootViewController;
    
    
    MapDashbaordViewController *frontViewController = [[MapDashbaordViewController alloc] init];
    RearViewController *rearViewController = [[RearViewController alloc] init];
    
    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    
    APP_DELEGATE.window.rootViewController = revealController;
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
