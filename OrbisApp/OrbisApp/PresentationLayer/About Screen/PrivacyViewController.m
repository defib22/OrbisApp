//
//  PrivacyViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "PrivacyViewController.h"

@interface PrivacyViewController ()

@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"PRIVACY POLICY";
    
    UITextView *txtVw = [[UITextView alloc] initWithFrame:CGRectMake(20, 10, CGRectGetWidth(self.view.frame)-40, CGRectGetHeight(self.view.frame)-20)];
    txtVw.text = DUMMY_TEXT;
    txtVw.scrollEnabled = NO;
    txtVw.font = FONT_TitilliumWeb_Regular(14.0);
    txtVw.editable = NO;
    [self.view addSubview:txtVw];
    

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
