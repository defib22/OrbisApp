//
//  LoginViewController.h
//  OrbisApp
//
//  Created by Defi Bansal on 28/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (strong, nonatomic) UINavigationController *navController;
@property (weak, nonatomic) IBOutlet UITextField *txtFldEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFldPswd;

@end
