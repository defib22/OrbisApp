//
//  ProfileViewController.m
//  OrbisApp
//
//  Created by Defi Bansal on 05/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "ProfileViewController.h"
#import "LaunchScreenViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtFldName;
@property (weak, nonatomic) IBOutlet UITextField *txtFldEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFldMobileNo;
@property (weak, nonatomic) IBOutlet UITextField *txtFldPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFldHomeAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldDestAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldFavAdrs;
@property (weak, nonatomic) IBOutlet UITextField *txtFldAddFavAdrs;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController
- (IBAction)btnSignOutClicked {
    //UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //LaunchScreenViewController *vc = [st instantiateViewControllerWithIdentifier:@"LaunchScreenViewController"];
    //[self.navigationController popToViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PROFILE";
    
    self.txtFldEmail.leftView = [self prepareLeftViewWithImage:@"mail_ic"];
    self.txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldName.leftView = [self prepareLeftViewWithImage:@"top_profile_ic"];
    self.txtFldName.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldMobileNo.leftView = [self prepareLeftViewWithImage:@"mobile_ic"];
    self.txtFldMobileNo.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldPassword.leftView = [self prepareLeftViewWithImage:@"password_ic"];
    self.txtFldPassword.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldHomeAdrs.leftView = [self prepareLeftViewWithImage:@"home_ic"];
    self.txtFldHomeAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldDestAdrs.leftView = [self prepareLeftViewWithImage:@"dest_loc_ic"];
    self.txtFldDestAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldFavAdrs.leftView = [self prepareLeftViewWithImage:@"fav_ic"];
    self.txtFldFavAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtFldAddFavAdrs.leftView = [self prepareLeftViewWithImage:@"add_fav_ic"];
    self.txtFldAddFavAdrs.leftViewMode = UITextFieldViewModeAlways;
    
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"edit_ic"] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked)];
    revealButtonItem.tintColor = APP_TEXT_COLOR;
    
    
    self.navigationItem.rightBarButtonItem = revealButtonItem;
    
    //[self setUpRightBarButtonItemWithImageName:@"edit_ic" andActionType:PROFILE_ACTION];
}

-(void) editButtonClicked{
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 70)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *gray_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
    gray_image_line.backgroundColor = [UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5];
    [view addSubview:gray_image_line];
    
    UIButton *btnSignOut = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnWidth = tableView.frame.size.width - 200;
    [btnSignOut setFrame:CGRectMake(tableView.frame.size.width/2 - (tableView.frame.size.width - 200)/2 , view.frame.size.height-40, btnWidth, 40)];
    
    [btnSignOut setBackgroundImage:[UIImage imageNamed:@"gray_btn"] forState:UIControlStateNormal];
    [btnSignOut setTitle:@"SIGN OUT" forState:UIControlStateNormal];
    [btnSignOut addTarget:self action:@selector(btnSignOutClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnSignOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:btnSignOut];
    
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat rowHeight = 44.0;
    NSString *string = @"String";
    
    if (section == 0) {
        rowHeight = 79.0;
        string = @"ACCOUNT";
    }else{
        rowHeight = 44.0;
        string = @"FAVORITE PLACES";
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, rowHeight)];
    [view setBackgroundColor:[UIColor whiteColor]];
    /* Create custom view to display section header... */
    
    if (section == 0) {
        
    }
    else{
        UIImageView *gray_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
        gray_image_line.backgroundColor = [UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5];
        [view addSubview:gray_image_line];
    }

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, (section==0)? 30:0, tableView.frame.size.width, 44)];
    [label setFont:FONT_TitilliumWeb_Bold(14.0)];
    label.textColor = APP_TEXT_COLOR;
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    
    UIImageView *yellow_image_line = [[UIImageView alloc]initWithFrame:CGRectMake(0, rowHeight-1, tableView.frame.size.width, 1)];
    yellow_image_line.backgroundColor = YELLOW_COLOR;
    [view addSubview:yellow_image_line];
    
    //[view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 79;
    }else
        return 44;
    //return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 1)
    {
        return 70;
    }else
        return 0;
    //return UITableViewAutomaticDimension;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 89.0;
    }else
        return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 3) {
        NSLog(@"Insidde");
    }
}

-(UIImageView*)prepareLeftViewWithImage:(NSString*)imgName
{
    UIImageView *leftvwImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 44, 70)];
    leftvwImage.image = [UIImage imageNamed:imgName];
    leftvwImage.contentMode = UIViewContentModeCenter;
    return leftvwImage;
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
