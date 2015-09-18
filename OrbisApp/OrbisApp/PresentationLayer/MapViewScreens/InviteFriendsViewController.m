//
//  InviteFriendsViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 29/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "InviteFriendsViewController.h"

@interface InviteFriendsViewController ()
{
    UILabel *lblCode;
    UILabel *lblHeader;
}
@end

@implementation InviteFriendsViewController
@synthesize inviteCode,referalAmount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"INVITE FRIENDS";
    [self designInterface];
}

-(void)designInterface
{
    self.referalAmount = @"";
    self.inviteCode = @"";
    
    CGFloat xPos = 30;
    CGFloat width = CGRectGetWidth(self.view.frame) - 60;
    
    CGFloat yPos = 100;
    
    lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, width, 50)];
    lblHeader.text = [NSString stringWithFormat:@"Invite frineds and you will each get $%@ credit when they make their first order.",self.referalAmount];
    lblHeader.numberOfLines = 0;
    lblHeader.textColor = APP_TEXT_COLOR;
    lblHeader.backgroundColor = [UIColor clearColor];
    lblHeader.textAlignment = NSTextAlignmentCenter;
    lblHeader.font = FONT_TitilliumWeb_Light(16.0);
    [self.view addSubview:lblHeader];
    
    yPos+=lblHeader.frame.size.height ;
    
    
    lblCode = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, width, 30)];
    lblCode.text = [NSString stringWithFormat:@"Your Invite Code : %@",self.inviteCode];
    lblCode.textColor = APP_TEXT_COLOR;
    lblCode.textAlignment = NSTextAlignmentCenter;
    lblCode.backgroundColor = [UIColor clearColor];
    lblCode.font = FONT_TitilliumWeb_Bold(16.0);
    [self.view addSubview:lblCode];
    
    yPos+=lblCode.frame.size.height + 10;
    
    
    NSArray *arrImage = [NSArray arrayWithObjects:@"fb_ic",@"twiter_ic",@"msg_ic",@"mail_icn_ylw", nil];

    xPos = 10;
    width = (CGRectGetWidth(self.view.frame)-20)/4;
    
    for (int i =0 ; i<arrImage.count; i++) {
        
        
        UIButton *btnShare = [UIButton buttonWithType:UIButtonTypeCustom];
        btnShare.frame = CGRectMake(xPos, yPos, width, 50);
        [btnShare setImage:[UIImage imageNamed:arrImage[i]] forState:UIControlStateNormal];
        [btnShare addTarget:self action:@selector(btnShareClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnShare];
        xPos+=width;
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [self fetchInviteCode];
}

-(void)btnShareClicked:(UIButton*)btnSender
{
    
}

-(void)fetchInviteCode{
    
    if(APP_DELEGATE.isServerReachable){
        [DejalBezelActivityView activityViewForView:APP_DELEGATE.window withLabel:LOADER_MESSAGE];
        
        NSString *urlInviteCode = [NSString stringWithFormat:URL_GET_INVITE_CODE,[[UserProfileBO sharedInstance] userID]];
        
        ConnectionManager *requestManager = [[ConnectionManager alloc] init];
        [requestManager hitWebServiceForURLWithPostBlock:NO webServiceURL:urlInviteCode andTag:REQUEST_GET_INVITE_CODE completionHandler:^(id object, REQUEST_TYPE tag, NSError *error) {
            
            if(object != nil){
                [self performSelectorOnMainThread:@selector(responseSucceed:) withObject:object waitUntilDone:YES];
            }
            else{
                [self performSelectorOnMainThread:@selector(responseFailed:) withObject:error waitUntilDone:YES];
            }
        }];
    }
        else{
            [APP_DELEGATE noInternetConnectionAvailable];
        }
}

-(void)responseSucceed:(id)object
{
    [DejalBezelActivityView removeViewAnimated:YES];
    
    if([[object objectForKey:RESPONSE_CODE] integerValue] == SUCCESS_STATUS_CODE_RESPONSE){
        if ([[object objectForKey:RESPONSE_MESSAGE] isKindOfClass:[NSString class]]) {
            [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:RESPONSE_MESSAGE] andDelegate:nil];
        }
        else{
            if ([[object objectForKey:RESPONSE_MESSAGE] isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *dictResponse = [object objectForKey:RESPONSE_MESSAGE];
                
                self.inviteCode = [dictResponse objectForKey:@"invite_code"];
                self.referalAmount = [dictResponse objectForKey:@"amount"];

                lblCode.text = [NSString stringWithFormat:@"Your Invite Code : %@",inviteCode];
                lblHeader.text = [NSString stringWithFormat:@"Invite frineds and you will each get $%@ credit when they make their first order.",self.referalAmount];

            }
        }
        
    }
    else{
        [self showAlertViewWithTitle:@"Alert" andBody:[object objectForKey:ERROR_RESPONSE_MESSAGE] andDelegate:nil];
    }
    
}

-(void)responseFailed:(NSError*)error
{
    [DejalBezelActivityView removeViewAnimated:YES];
    [self showAlertViewWithTitle:@"Error" andBody:error.localizedDescription ? error.localizedDescription : UNEXPECTED_ERROR_OCCURED andDelegate:nil];
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
