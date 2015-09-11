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
}
@end

@implementation InviteFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"INVITE FRIENDS";
    [self designInterface];
}

-(void)designInterface
{
    CGFloat xPos = 30;
    CGFloat width = CGRectGetWidth(self.view.frame) - 60;
    
    CGFloat yPos = 100;
    
    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, width, 50)];
    lblHeader.text = @"Invite frineds and you will each get $10 credit when they make their first order.";
    lblHeader.numberOfLines = 0;
    lblHeader.textColor = APP_TEXT_COLOR;
    lblHeader.backgroundColor = [UIColor clearColor];
    lblHeader.textAlignment = NSTextAlignmentCenter;
    lblHeader.font = FONT_TitilliumWeb_Light(16.0);
    [self.view addSubview:lblHeader];
    
    yPos+=lblHeader.frame.size.height ;
    
    
    lblCode = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, width, 30)];
    lblCode.text = @"Your Invite Code : US7348";
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
