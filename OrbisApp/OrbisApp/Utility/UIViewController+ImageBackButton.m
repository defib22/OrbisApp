//
//  UIViewController+ImageBackButton.m
//  AskMePay
//
//  Created by Kuldeep Saini on 23/07/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import "UIViewController+ImageBackButton.h"

@implementation UIViewController (ImageBackButton)

- (void)setUpImageBackButton
{
    
    UIImage *backBtnImage = [UIImage imageNamed:@"back_ic"];
    backBtnImage = [backBtnImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithImage:backBtnImage style:UIBarButtonItemStylePlain target:self action:@selector(popCurrentViewController)];
    self.navigationItem.leftBarButtonItem = barBackButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)popCurrentViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
