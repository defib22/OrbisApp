//
//  BaseViewController.h
//  OrbisApp
//
//  Created by Defi Bansal on 23/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ImageBackButton.h"
#import "SWRevealViewController.h"

@interface BaseViewController : UIViewController

//-(void)designNavigationBarWithTitle:(NSString *)title;
//-(void)designBarNavigationLeftButton:(BOOL)isBackButton;

-(void)setUpSlideControllerOptions;

-(void)showAlertViewWithTitle:(NSString*)title andBody:(NSString*)body andDelegate:(id)delegate;
-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName;
-(UIImageView*)addSeparatorWithFrame:(CGRect)frame;

-(void) setUpRightBarButtonItemWithImageName:(NSString *)imageName andActionType:(Right_Buttton_Action_Type)actionType;

@end
