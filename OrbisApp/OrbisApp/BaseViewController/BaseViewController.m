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
#import "ProfileViewController.h"

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
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_side_menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    revealButtonItem.tintColor = APP_TEXT_COLOR;
    
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
}

-(void) setUpRightBarButtonItemWithImageName:(NSString *)imageName andActionType:(Right_Buttton_Action_Type)actionType{
    SEL selectorName = @selector(backBtnClicked);
    switch (actionType) {
        case PROFILE_ACTION:
            selectorName = @selector(openProfileViewController);
            break;
        case CROSS_ACTION:
            selectorName  = @selector(backBtnClicked);
            break;
        default:
            break;
    }
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:selectorName];
    revealButtonItem.tintColor = APP_TEXT_COLOR;
    
    
    self.navigationItem.rightBarButtonItem = revealButtonItem;
}

-(void)openProfileViewController{
    UIStoryboard *st  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProfileViewController *vwCont = [st instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self.navigationController pushViewController:vwCont animated:YES];
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
    lblTitle.textColor = APP_TEXT_COLOR;
    lblTitle.font = FONT_TitilliumWeb_Light(16.0);
    lblTitle.numberOfLines = 2;
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [imgTopNavBar addSubview:lblTitle];
    imgTopNavBar = nil;
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
