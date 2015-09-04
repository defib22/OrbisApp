//
//  MapDashbaordViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 28/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "MapDashbaordViewController.h"
#import <MapKit/MapKit.h>
#import "AddressButtonView.h"


#import "CustomAnnotation.h"
#import "CustomAnnotationView.h"

#import "InviteFriendsViewController.h"
#import "AboutViewController.h"
#import "PromotionsViewController.h"
#import "InviteFriendsViewController.h"
#import "TrackingViewController.h"
#import "PaymentViewController.h"
#import "TutorialViewController.h"
#import "HelpViewController.h"

#import "ConfirmationBookingViewController.h"
#import "LocationFinderViewController.h"

@interface MapDashbaordViewController ()<MKMapViewDelegate>
{
    MKMapView *mapView;
    AddressButtonView *vwFromAdd;
    AddressButtonView *vwToAdd;
    
    UILabel *lblEstimatedTime;
    
}
@end

@implementation MapDashbaordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ORBIS";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navigateToRespectiveController:) name:kNotificationFromLeftMenuForMerchant object:nil];

    [self designInterface];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self setUpSlideControllerOptions];

}

-(void)addTempLocations
{
 
    
    CustomAnnotation *annotCurrent = [[CustomAnnotation alloc] initWithCoordinates:APP_DELEGATE.currentLocation.coordinate title:@"My Location" subtitle:nil];
    annotCurrent.typeOfVehicle = CURRENT_LOCATION;

    CustomAnnotation *annotation1 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(12.9667, 77.5667) title:@"Robert" subtitle:nil];
    annotation1.typeOfVehicle = CAR;
    
    CustomAnnotation *ann2 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(44.518640, 11.362665) title:@"Robert" subtitle:nil];
     ann2.typeOfVehicle = CAR;
    
    CustomAnnotation *ann3 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(44.521318, 11.374080) title:@"Robert" subtitle:nil];
     ann3.typeOfVehicle = BIKE;
    
    CustomAnnotation *ann4 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(44.500746, 11.345394) title:@"Robert" subtitle:nil];
     ann4.typeOfVehicle = CAR;
    
    CustomAnnotation *ann5 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(44.490537, 11.358033) title:@"Robert" subtitle:nil];
     ann5.typeOfVehicle = CAR;
    
    CustomAnnotation *ann6 = [[CustomAnnotation alloc] initWithCoordinates:CLLocationCoordinate2DMake(44.504082, 11.354256) title:@"Robert" subtitle:nil];
     ann6.typeOfVehicle = BIKE;
    
    [mapView addAnnotation:annotCurrent];
    [mapView addAnnotation:annotation1];
    [mapView addAnnotation:ann2];
    [mapView addAnnotation:ann3];
    [mapView addAnnotation:ann4];
    [mapView addAnnotation:ann5];
    [mapView addAnnotation:ann6];

    [mapView setRegion:MKCoordinateRegionMakeWithDistance(ann2.coordinate, 10000, 10000)];

}

-(void)designInterface
{
    CGFloat heightMap = CGRectGetHeight(self.view.frame)-160;
    CGFloat yCordinate = 0;
    // Add Map view
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, yCordinate, CGRectGetWidth(self.view.frame), heightMap)];
    mapView.userInteractionEnabled = YES;
    mapView.delegate = self;
    [self.view addSubview:mapView];
 
    
    [self addTempLocations];
    
    yCordinate+=mapView.frame.size.height;
    
    
   // [self designDriverRouteInfo];
    
    [self designButtonsForSourceAndDestinationAddress];
    
    yCordinate+=100;
    
    [self addNextButtonAtBottomAtPosition:yCordinate];
    
//    [self addButtonsForTrackingAtPosition:yCordinate];
//    
    [self addSegmentBar];
    
}

-(void)designButtonsForSourceAndDestinationAddress
{
   CGFloat yCordinate = mapView.frame.size.height;

    CGFloat width = CGRectGetWidth(self.view.frame)/2;

    CGFloat xPos = 0;
    
    vwFromAdd = [[AddressButtonView alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, 70)];
    [vwFromAdd designInterfaceWithLocationFrom:@"From" andDesc:@"Tap to select source address."];
    [vwFromAdd addTarget:self action:@selector(addressButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vwFromAdd];
    
    xPos+=width;
    
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(xPos, yCordinate, 1, 70)]];
    
    UIImageView *imageYelArrow = [[UIImageView alloc] initWithFrame:CGRectMake(xPos-10, yCordinate+25, 20, 20)];
    imageYelArrow.contentMode = UIViewContentModeCenter;
    imageYelArrow.image = [UIImage imageNamed:@"yelarrow"];
    [self.view addSubview:imageYelArrow];

    
    vwToAdd = [[AddressButtonView alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, 70)];
    [vwToAdd designInterfaceWithLocationFrom:@"To" andDesc:@"Tap to select destination address."];
    [vwToAdd addTarget:self action:@selector(addressButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vwToAdd];
    
    [self.view addSubview:[self addSeparatorWithFrame:CGRectMake(0, yCordinate+70, CGRectGetWidth(self.view.frame), 1)]];
    

    
}

-(void)addNextButtonAtBottomAtPosition:(CGFloat)yPos
{
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setBackgroundImage:[UIImage imageNamed:@"yellow_btn"] forState:UIControlStateNormal];
    [btnNext setTitle:@"NEXT" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnNext.titleLabel.font = FONT_TitilliumWeb_Regular(22.0);
    [btnNext addTarget:self action:@selector(btnNextClicked:) forControlEvents:1];
    btnNext.frame = CGRectMake(20, yPos, CGRectGetWidth(self.view.frame)-40, 50);
    [self.view addSubview:btnNext];
    

}
-(void)addButtonsForTrackingAtPosition:(CGFloat)yPos
{
    CGFloat xPos = 10;
    CGFloat width = ((CGRectGetWidth(self.view.frame)-20)/2);
    CGFloat yCord = yPos;
    

    UIButton *btnCallDriver = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCallDriver addTarget:self action:@selector(btnCallDriverClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnCallDriver setTitle:@"CALL DRIVER" forState:UIControlStateNormal];
    [btnCallDriver setBackgroundImage:[UIImage imageNamed:@"blk_btn"] forState:UIControlStateNormal];
    [btnCallDriver setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCallDriver.titleLabel.font = FONT_TitilliumWeb_Regular(16.0);
    btnCallDriver.frame = CGRectMake(xPos, yCord, width, 40);
    [self.view addSubview:btnCallDriver];

    xPos+=width+5;
    
    UIButton *btnTextDriver = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTextDriver addTarget:self action:@selector(btnTextDriverClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnTextDriver setBackgroundImage:[UIImage imageNamed:@"gray_btn"] forState:UIControlStateNormal];
    [btnTextDriver setTitle:@"TEXT DRIVER" forState:UIControlStateNormal];
    [btnTextDriver setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnTextDriver.titleLabel.font = FONT_TitilliumWeb_Regular(16.0);

    btnTextDriver.frame = CGRectMake(xPos, yCord, width, 40);
    [self.view addSubview:btnTextDriver];

    
}

-(void)btnTextDriverClicked{
    
}
-(void)btnCallDriverClicked
{
    
}


-(void)btnNextClicked:(UIButton*)btnSender
{
    ConfirmationBookingViewController *vwCont = [[ConfirmationBookingViewController alloc] init];
    [self.navigationController pushViewController:vwCont animated:YES];
}


-(void)addSegmentBar
{
    CGFloat xPos = 15;
    CGFloat width = (CGRectGetWidth(self.view.frame)-30)/3;
    CGFloat yCord = mapView.frame.size.height - 60;
 
    UIImageView *imgBG = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, yCord, width*3, 35)];
    imgBG.image = [UIImage imageNamed:@"map_tab"];
    imgBG.userInteractionEnabled = YES;
    [self.view addSubview:imgBG];
    
    xPos = 0;
     for (int i = 0; i<3; i++) {
        
      UIButton *btnBackground = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBackground.tag = 200+i;
        [btnBackground setFrame:CGRectMake(xPos, 0, width, 35)];
        [btnBackground setBackgroundImage:nil forState:UIControlStateNormal];
        [btnBackground setBackgroundImage:[UIImage imageNamed:@"maptabs"] forState:UIControlStateSelected];
        [btnBackground setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnBackground.titleLabel.font = FONT_TitilliumWeb_Regular(12.0);
        
        NSMutableAttributedString *myString = nil;
        NSMutableAttributedString *myStringSelected = nil;
        
        switch (i) {
            case 0:
            {
                myString = [[NSMutableAttributedString alloc] initWithString:@"BIKENOW"];
                
                 NSDictionary *underlineAttribute = @{NSForegroundColorAttributeName: YELLOW_COLOR};
                 [myString setAttributes:underlineAttribute range:[@"BIKENOW" rangeOfString:@"BIKE"]];


                myStringSelected = [[NSMutableAttributedString alloc] initWithString:@"BIKENOW"];
                NSDictionary *underlineAttributeSel = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
                [myStringSelected setAttributes:underlineAttributeSel range:[@"BIKENOW" rangeOfString:@"BIKE"]];

            }
                break;
            case 1:
            {
                myString = [[NSMutableAttributedString alloc] initWithString:@"CARNOW"];
                NSDictionary *underlineAttribute = @{NSForegroundColorAttributeName: YELLOW_COLOR};
                [myString setAttributes:underlineAttribute range:[@"CARNOW" rangeOfString:@"CAR"]];
                
                myStringSelected = [[NSMutableAttributedString alloc] initWithString:@"CARNOW"];
                NSDictionary *underlineAttributeSel = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
                [myStringSelected setAttributes:underlineAttributeSel range:[@"CARNOW" rangeOfString:@"CAR"]];


            }
                break;
            case 2:
            {
                myString = [[NSMutableAttributedString alloc] initWithString:@"CARSHARE"];
                NSDictionary *underlineAttribute = @{NSForegroundColorAttributeName: YELLOW_COLOR};
                [myString setAttributes:underlineAttribute range:[@"CARSHARE" rangeOfString:@"CAR"]];
                
                myStringSelected = [[NSMutableAttributedString alloc] initWithString:@"CARSHARE"];
                NSDictionary *underlineAttributeSel = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
                [myStringSelected setAttributes:underlineAttributeSel range:[@"CARSHARE" rangeOfString:@"CAR"]];

            }
                break;

                
            default:
                break;
        }
        
 
        
        
        [btnBackground setAttributedTitle:myString  forState:UIControlStateNormal];
        [btnBackground setAttributedTitle:myStringSelected  forState:UIControlStateSelected];
        
        btnBackground.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        [imgBG addSubview:btnBackground];
        [btnBackground addTarget:self action:@selector(vwButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
         if(i==0){
             [self vwButtonClicked:btnBackground];
         }
         xPos+=width;
    }
    
}

-(void)vwButtonClicked:(UIButton*)sender
{
    
    if(lblEstimatedTime){
        [lblEstimatedTime removeFromSuperview];
        lblEstimatedTime = nil;
    }
    
    CGRect frame = sender.bounds;
    frame.size.width-=10;
    
    lblEstimatedTime = [[UILabel alloc] initWithFrame:frame];
    lblEstimatedTime.textAlignment = NSTextAlignmentRight;
    lblEstimatedTime.text = @"12min";
    lblEstimatedTime.font = FONT_TitilliumWeb_SemiBold(10.0);
    lblEstimatedTime.textColor = [UIColor redColor];
    [sender addSubview:lblEstimatedTime];
    
    

    UIButton *btnOne = (UIButton*)[self.view viewWithTag:200];
    UIButton *btnTwo = (UIButton*)[self.view viewWithTag:201];
    UIButton *btnThree = (UIButton*)[self.view viewWithTag:202];
    
    btnOne.selected = NO;
    btnTwo.selected = NO;
    btnThree.selected = NO;
    
    
    switch (sender.tag) {
        case 200:
            sender.selected = YES;
            
            break;
        case 201:
            sender.selected = YES;
            
            break;
        case 202:
            sender.selected = YES;
            
            break;
        default:
            break;
    }
    
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





- (MKAnnotationView *)mapView:(MKMapView *)mapView1 viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    if ([annotation isKindOfClass:[CustomAnnotation class]]) {
        
        CustomAnnotation *currentAnnot = (CustomAnnotation*)annotation;
        
        static NSString * const kPinAnnotationIdentifier = @"PinIdentifier";
        
        CustomAnnotationView *annotView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:kPinAnnotationIdentifier];
        
        if(!annotView){
            annotView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kPinAnnotationIdentifier];
            annotView.canShowCallout = YES;
        }
        
 
        if(currentAnnot.typeOfVehicle == CAR){
            annotView.image = [UIImage imageNamed:@"map_car_pin"];
        }
        else if (currentAnnot.typeOfVehicle == BIKE){
            annotView.image = [UIImage imageNamed:@"map_bike_pin"];
        }
        else{
            annotView.image = [UIImage imageNamed:@"map_pin_CurrentLoc"];
        }
        
        return annotView;
    }
    return nil;
    
}



-(void)navigateToRespectiveController:(NSNotification*)notification
{
    NSNumber *temp = (NSNumber*)notification.object;
    
    NSInteger selectedRow = [temp integerValue];
    
    switch (selectedRow) {
        case 0:
        {
        }
            break;
        case 1:
        {
            PaymentViewController *vwCont = [[PaymentViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];
            
        }
            
            break;
        case 2:
        {
            TrackingViewController *vwCont = [[TrackingViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];
        }
            
            break;
            
        case 3:
            
            break;
        case 4:
        {
            PromotionsViewController *vwCont = [[PromotionsViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
            
            break;
        case 5:
        {
            HelpViewController *vwCont = [[HelpViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];
        }

            break;
        case 6:
        {
            InviteFriendsViewController *vwCont = [[InviteFriendsViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
            break;
        case 7:
        {
            AboutViewController *vwCont = [[AboutViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
            
            break;
            
            
        default:
            break;
    }
    
    
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
