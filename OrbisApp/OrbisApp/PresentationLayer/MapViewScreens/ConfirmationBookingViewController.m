//
//  ConfirmationBookingViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "ConfirmationBookingViewController.h"
#import <MapKit/MapKit.h>
#import "AddressButtonView.h"
#import "PromotionsViewController.h"
#import "FareQuoteViewController.h"
#import "DriverOnRouteViewController.h"
#import "LocationFinderViewController.h"

@interface ConfirmationBookingViewController ()<MKMapViewDelegate>
{
    MKMapView *mapView;
    AddressButtonView *vwFromAdd;
    AddressButtonView *vwToAdd;
    
    
    UIButton *btnPromo;
    UIButton *btnFareQuote;
    
    UILabel *lblEstimatedTime;
}
@end

@implementation ConfirmationBookingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CONFIRMATION";
    // Do any additional setup after loading the view.
    [self designInterface];

}

-(void)designInterface
{
    CGFloat heightMap = CGRectGetHeight(self.view.frame)-250;
    CGFloat yCordinate = 0;
    // Add Map view
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, yCordinate, CGRectGetWidth(self.view.frame), heightMap)];
    mapView.userInteractionEnabled = YES;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
    yCordinate+=mapView.frame.size.height;

    [self designButtonsForSourceAndDestinationAddress];

 
 
}



-(void)btnReqNowClicked:(UIButton*)btnSender
{
    DriverOnRouteViewController *vwCont =[[DriverOnRouteViewController alloc] init];
    [self.navigationController pushViewController:vwCont animated:YES];
}

-(void)btnPromoClicked
{
    PromotionsViewController *vwCont = [[PromotionsViewController alloc] init];
    [self.navigationController pushViewController:vwCont animated:YES];
}
-(void)btnFareQuoteClicked
{
    FareQuoteViewController *vwCont = [[FareQuoteViewController alloc] init];
    [self.navigationController pushViewController:vwCont animated:YES];
}
-(void)designButtonsForSourceAndDestinationAddress
{
    CGFloat yCordinate = mapView.frame.size.height;
    
    CGFloat width = CGRectGetWidth(self.view.frame)/2;
    
    CGFloat xPos = 0;

    btnPromo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPromo.frame = CGRectMake(xPos, yCordinate, width, 50);
    [btnPromo setImage:[UIImage imageNamed:@"tag_icon"] forState:UIControlStateNormal];
    btnPromo.titleLabel.font = FONT_TitilliumWeb_Regular(14.0);
    [btnPromo setTitle:@"PROMO CODE" forState:UIControlStateNormal];
    btnPromo.titleEdgeInsets = UIEdgeInsetsMake(20, -10, 0, 0);
    btnPromo.imageEdgeInsets = UIEdgeInsetsMake(0, width/2 - 5, 15, 0);


    [btnPromo setTitleColor:APP_TEXT_COLOR forState:UIControlStateNormal];
    [btnPromo addTarget:self action:@selector(btnPromoClicked) forControlEvents:1];
    [self.view addSubview:btnPromo];
    
    xPos+=width;
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(xPos, yCordinate, 1, 50)]];

    btnFareQuote = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFareQuote.frame = CGRectMake(xPos, yCordinate, width, 50);
    [btnFareQuote setTitle:@"FARE QUOTE" forState:UIControlStateNormal];
    btnFareQuote.titleEdgeInsets = UIEdgeInsetsMake(20, -10, 0, 0);
    btnFareQuote.imageEdgeInsets = UIEdgeInsetsMake(0, width/2 - 5, 15, 0);

    btnFareQuote.titleLabel.font = FONT_TitilliumWeb_Regular(14.0);
    [btnFareQuote setTitleColor:APP_TEXT_COLOR forState:UIControlStateNormal];
    [btnFareQuote setImage:[UIImage imageNamed:@"payment_icon"] forState:UIControlStateNormal];
     [btnFareQuote addTarget:self action:@selector(btnFareQuoteClicked) forControlEvents:1];
    [self.view addSubview:btnFareQuote];

    
    UIImageView *imgCircle = [[UIImageView alloc] initWithFrame:CGRectMake(mapView.frame.size.width/2 - 25, yCordinate-25, 50 , 50)];
    
    imgCircle.backgroundColor = NAV_BG_COLOR;
    imgCircle.contentMode = UIViewContentModeCenter;
//    imgCircle.image = [UIImage imageNamed:@"car_search"];
    imgCircle.layer.cornerRadius = 25;
    imgCircle.layer.borderWidth = 1.0;
    imgCircle.layer.borderColor = YELLOW_COLOR.CGColor;
    imgCircle.clipsToBounds = YES;
    [self.view addSubview:imgCircle];
    
    UILabel *lblTime = [[UILabel alloc] initWithFrame:imgCircle.bounds];
    lblTime.text = @"ETA\n12\nMIN";
    lblTime.textAlignment = NSTextAlignmentCenter;
    lblTime.numberOfLines = 0;
    lblTime.backgroundColor = [UIColor clearColor];
    lblTime.textColor = APP_TEXT_COLOR;
    lblTime.font = FONT_TitilliumWeb_Light(10.0);
    [imgCircle addSubview:lblTime];

    
    xPos = 0;
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(0, yCordinate+50, CGRectGetWidth(self.view.frame), 1)]];

    yCordinate+=50;
    
    UIImageView *imgVisa = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, yCordinate, 50 , 50)];
    imgVisa.backgroundColor = [UIColor clearColor];
    imgVisa.contentMode = UIViewContentModeCenter;
    imgVisa.image = [UIImage imageNamed:@"pay2"];
    [self.view addSubview:imgVisa];
    
    UILabel *lblAccount = [[UILabel alloc] initWithFrame:CGRectMake(xPos+60, yCordinate, 300 , 50)];
    lblAccount.text = @"PERSONAL************6590";
    lblAccount.textAlignment = NSTextAlignmentLeft;
    lblAccount.backgroundColor = [UIColor clearColor];
    lblAccount.textColor = APP_TEXT_COLOR;
    lblAccount.font = FONT_TitilliumWeb_Regular(14.0);
    [self.view addSubview:lblAccount];


    
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(0, yCordinate+50, CGRectGetWidth(self.view.frame), 1)]];

    yCordinate+=50;

    
    vwFromAdd = [[AddressButtonView alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, 70)];
    [vwFromAdd designInterfaceWithLocationFrom:@"From" andDesc:@"1120 San Fernando Rd. lendale, CA"];
    vwFromAdd.lblHeader.text = @"Fantasy Flowers";
    [vwFromAdd addTarget:self action:@selector(addressButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vwFromAdd];
    
    xPos+=width;
    
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(xPos, yCordinate, 1, 70)]];
    UIImageView *imageYelArrow = [[UIImageView alloc] initWithFrame:CGRectMake(xPos-10, yCordinate+25, 20, 20)];
    imageYelArrow.contentMode = UIViewContentModeCenter;
    imageYelArrow.image = [UIImage imageNamed:@"yelarrow"];
    [self.view addSubview:imageYelArrow];

    
    vwToAdd = [[AddressButtonView alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, 70)];
    [vwToAdd designInterfaceWithLocationFrom:@"To" andDesc:@"12133 Ventura Blvd, Sherman Oaks, CA"];
    [vwToAdd addTarget:self action:@selector(addressButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vwToAdd];
    
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(0, yCordinate+70, CGRectGetWidth(self.view.frame), 1)]];
    
    yCordinate+=80;

    
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setBackgroundImage:[UIImage imageNamed:@"yellow_btn"] forState:UIControlStateNormal];
    [btnNext setTitle:@"REQUEST CARNOW" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnNext.titleLabel.font = FONT_TitilliumWeb_Regular(22.0);
    [btnNext addTarget:self action:@selector(btnReqNowClicked:) forControlEvents:1];
    btnNext.frame = CGRectMake(20, yCordinate, CGRectGetWidth(self.view.frame)-40, 50);
    [self.view addSubview:btnNext];
    
}


-(void)addressButtonClicked:(AddressButtonView*)sender
{
    if (sender == vwFromAdd) {
        LocationFinderViewController *vwCont = [[LocationFinderViewController alloc] init];
        vwCont.isForDropOff = NO;
        [self.navigationController pushViewController:vwCont animated:YES];
    }
    else{
        LocationFinderViewController *vwCont = [[LocationFinderViewController alloc] init];
        vwCont.isForDropOff = YES;
        [self.navigationController pushViewController:vwCont animated:YES];
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
