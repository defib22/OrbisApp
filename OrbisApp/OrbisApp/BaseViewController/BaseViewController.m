//
//  BaseViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 23/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface BaseViewController ()
{
    AppDelegate *appDelegate ;
    int dashboardRowIndexSelected;
    int dashboardBtnIndexSelected;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self setUpImageBackButton];
}


-(void)setUpSlideControllerOptions
{
    
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_side_menu"]
                                                                         style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
}


-(void)showAlertViewWithTitle:(NSString*)title andBody:(NSString*)body andDelegate:(id)delegate
{
    UIAlertView *alertVw = [[UIAlertView alloc] initWithTitle:title message:body delegate:delegate cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertVw show];
    alertVw = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}


/////// NAVIGATION BAR AND ITS FUNCTIONS /////


-(void)designNavigationBarWithTitle:(NSString *)title
{
    BOOL isIOS7 = [[[UIDevice currentDevice] systemVersion] intValue] >= 7 ? YES : NO;
    CGFloat heightNavBar = isIOS7 ? 64 : 44;
    UIImageView *imgTopNavBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds) , heightNavBar)];
    imgTopNavBar.image = [UIImage imageNamed:@"nav_bar"];
    //imgTopNavBar.backgroundColor = [UIColor redColor];
    imgTopNavBar.tag = TOP_NAV_BAR;

    [self.view addSubview:imgTopNavBar];
    
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, isIOS7 ? 20 : 0, CGRectGetWidth(self.view.bounds), 44)];
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textColor = [UIColor blackColor];
    lblTitle.font = FONT_TitilliumWeb_Light(16.0);
    lblTitle.numberOfLines = 2;
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [imgTopNavBar addSubview:lblTitle];
    imgTopNavBar = nil;
    
  /*  if(isRightBtn)
    {
        UIButton *leftMenuBtn = [self designAButtonWithFrame:CGRectMake(315-70, isIOS7 ? 23:7, 64, 28) withTag:MENU_BTN_TAG withNormalImg:@"green_btn" withSelectedImage:@"gray_btn" withTitle:rightBtnTitle];
        [leftMenuBtn setBackgroundImage:NSBUNDLE_IMAGE(@"gray_btn") forState:UIControlStateHighlighted];
        leftMenuBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [leftMenuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftMenuBtn addTarget:self action:@selector(leftMenuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:leftMenuBtn];
        leftMenuBtn = nil;
    }
    
    if(isMenuBtn)
    {
        UIButton *btnMenu = [self designAButtonWithFrame:CGRectMake(15.0, isIOS7 ? 20.0:7.0, 32.0, 32.0) withTag:MENU_BTN_TAG withNormalImg:@"the_menu" withSelectedImage:@"the_menu" withTitle:@""];//mnuBtnTitle
        [btnMenu setBackgroundImage:NSBUNDLE_IMAGE(@"the_menu") forState:UIControlStateHighlighted];
        btnMenu.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [btnMenu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(menuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnMenu];
        btnMenu = nil;
    }*/
}

-(void)designBarNavigationLeftButton:(BOOL)isBackButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *imageName = isBackButton ? @"back_ic" : @"back_ic";
    [btn setFrame:CGRectMake(10, 20+14, 10, 16)];
    btn.tag = NAV_BAR_LEFT_BTN_TAG;
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (isBackButton) {
        [btn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }else
        [btn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


-(void)backBtnClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName
{
    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    leftvwImage.image = [UIImage imageNamed:imgName];
    leftvwImage.contentMode = UIViewContentModeCenter;
    return leftvwImage;
}


-(UIImageView*)addSeparatorWithFrame:(CGRect)frame
{
    UIImageView *imgSep = [[UIImageView alloc] initWithFrame:frame];
    imgSep.backgroundColor = [UIColor lightGrayColor];
    return imgSep;
}



@end
