//
//  PromotionsViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "PromotionsViewController.h"

@interface PromotionsViewController ()<UITextFieldDelegate>
{
    UITextField *txtFldPromotions;
}
@end

@implementation PromotionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"PROMOTIONS";
    
    txtFldPromotions = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, CGRectGetWidth(self.view.frame)-40, 40)];
    txtFldPromotions.borderStyle = UITextBorderStyleRoundedRect;
    txtFldPromotions.delegate = self;
    txtFldPromotions.placeholder = @"Promo Code";
    txtFldPromotions.font = FONT_TitilliumWeb_Regular(14.0);
     txtFldPromotions.leftView = [self prepareLeftViewWithImage:@"tag_icon"];
    txtFldPromotions.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:txtFldPromotions];
    
    UIButton *btnApply = [UIButton buttonWithType:UIButtonTypeCustom];
    btnApply.frame = CGRectMake((CGRectGetWidth(self.view.frame)/2)-75, 130, 150, 40);
    [btnApply setTitleColor:APP_TEXT_COLOR forState:UIControlStateNormal];
    [btnApply setTitle:@"APPLY" forState:UIControlStateNormal];
    btnApply.titleLabel.font = FONT_TitilliumWeb_SemiBold(15.0);
    [btnApply addTarget:self action:@selector(btnApplyClicked) forControlEvents:1];
    [btnApply setBackgroundImage:[UIImage imageNamed:@"sing_in"] forState:UIControlStateNormal];
    [self.view addSubview:btnApply];
    
}

-(void)btnApplyClicked
{
    
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
