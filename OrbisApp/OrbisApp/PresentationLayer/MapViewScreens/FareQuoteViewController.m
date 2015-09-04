//
//  FareQuoteViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "FareQuoteViewController.h"
#import "AddressButtonView.h"

@interface FareQuoteViewController ()
{
    AddressButtonView *vwFromAdd;
    AddressButtonView *vwToAdd;
    
    UILabel *lblEstimatedTime;
    UILabel *lblEstimatedPrice;

}

@end

@implementation FareQuoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FARE QUOTE";
    
    // Do any additional setup after loading the view.
    [self designButtonsForSourceAndDestinationAddress];

}
-(void)designButtonsForSourceAndDestinationAddress
{
    CGFloat yCordinate = 64;
    
    CGFloat width = CGRectGetWidth(self.view.frame)/2;
    
    CGFloat xPos = 0;
    
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
    
    
    lblEstimatedTime = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)/2-100), yCordinate, 200, 30)];
    lblEstimatedTime.textColor = APP_TEXT_COLOR;
    lblEstimatedTime.text = @"Estimated 11.4 miles";
    lblEstimatedTime.font = FONT_TitilliumWeb_Light(13.0);
    lblEstimatedTime.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblEstimatedTime];
    
    yCordinate+=lblEstimatedTime.frame.size.height+10;
    
    
    UIImageView *imageCar = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)/2-100), yCordinate, 200, 50)];
    imageCar.contentMode = UIViewContentModeCenter;
    imageCar.image = [UIImage imageNamed:@"car_quaot.png"];
    [self.view addSubview:imageCar];
    
    yCordinate+=imageCar.frame.size.height+10;
    
    lblEstimatedPrice = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)/2-100), yCordinate, 200, 50)];
    lblEstimatedPrice.textColor = APP_TEXT_COLOR;
    lblEstimatedPrice.text = @"$35-$47";
    lblEstimatedPrice.font = FONT_TitilliumWeb_SemiBold(30.0);
    lblEstimatedPrice.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblEstimatedPrice];

    yCordinate+=lblEstimatedPrice.frame.size.height+10;
    
   UILabel *lblMesage = [[UILabel alloc] initWithFrame:CGRectMake(40, yCordinate, CGRectGetWidth(self.view.frame)-80, 60)];
    lblMesage.textColor = APP_TEXT_COLOR;
    lblMesage.text = @"Quotes may vary due to weather,traffic conditions etc.\nEstimate does not include promotions";
    lblMesage.font = FONT_TitilliumWeb_Light(10.0);
    lblMesage.numberOfLines = 0;
    lblMesage.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblMesage];
    
    yCordinate+=lblEstimatedPrice.frame.size.height+10;


}

-(void)addressButtonClicked:(AddressButtonView*)sender
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
