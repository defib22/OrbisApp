//
//  DriverOnRouteViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "DriverOnRouteViewController.h"
#import <MapKit/MapKit.h>

@interface DriverOnRouteViewController ()<MKMapViewDelegate>
{
    MKMapView *mapView;
    
    UILabel *lblEstimatedTime;
}

@end

@implementation DriverOnRouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
    
    self.title = @"DRIVER EN ROUTE";
    [self designInterface];
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
    
    yCordinate+=mapView.frame.size.height;
    
    [self designDriverRouteInfo];
    
    
}


-(void)designDriverRouteInfo
{
    CGFloat yCordinate = mapView.frame.size.height + 10;;
    
    CGFloat height = CGRectGetHeight(self.view.frame) - yCordinate-10;
    
    CGFloat width = CGRectGetWidth(self.view.frame)-20;
    
    CGFloat xPos = 10;
    
    
    UIImageView *imgBackground = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, height)];
    imgBackground.image = [UIImage imageNamed:@"detail_bg_route"];
    imgBackground.userInteractionEnabled = YES;
    [self.view addSubview:imgBackground];
    
    
    UIImageView *imgDriverPic = [[UIImageView alloc] initWithFrame:CGRectMake(width/2 - 28, yCordinate-30, 60 , 60)];
    imgDriverPic.backgroundColor = [UIColor clearColor];
    imgDriverPic.contentMode = UIViewContentModeCenter;
    imgDriverPic.image = [UIImage imageNamed:@"receipt_img"];
    [self.view addSubview:imgDriverPic];
    
    
    
    
    
    xPos = 10;
    width = (imgBackground.frame.size.width/2)-10;
    
    
    yCordinate = 50;
    
    UILabel *lblDriverName = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yCordinate, width, 30)];
    lblDriverName.text = @"ROBERT";
    lblDriverName.textAlignment = NSTextAlignmentCenter;
    lblDriverName.font = FONT_TitilliumWeb_Regular(14.0);
    lblDriverName.textColor =APP_TEXT_COLOR;
    [imgBackground addSubview:lblDriverName];
    
    
    [imgBackground addSubview:[self addSeparatorWithFrame:CGRectMake(xPos+width, yCordinate, 1.0, 40.0)]];
    
    UILabel *lblStatus = [[UILabel alloc] initWithFrame:CGRectMake(xPos+width+5, yCordinate, width, 30)];
    lblStatus.text = @"ARRIVING NOW";
    lblStatus.font = FONT_TitilliumWeb_Regular(14.0);
    lblStatus.textAlignment = NSTextAlignmentCenter;
    lblStatus.textColor =APP_TEXT_COLOR;
    [imgBackground addSubview:lblStatus];
    
    
    
    yCordinate = imgBackground.frame.size.height-50;
    
    
    UIButton *btnCallDriver = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCallDriver addTarget:self action:@selector(btnCallDriverClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnCallDriver setTitle:@"CONTACT DRIVER" forState:UIControlStateNormal];
    [btnCallDriver setBackgroundImage:[UIImage imageNamed:@"blk_btn"] forState:UIControlStateNormal];
    [btnCallDriver setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCallDriver.titleLabel.font = FONT_TitilliumWeb_Regular(16.0);
    btnCallDriver.frame = CGRectMake(xPos-3, yCordinate, width, 40);
    [imgBackground addSubview:btnCallDriver];
    
    xPos+=width+5;
    
    UIButton *btnTextDriver = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTextDriver addTarget:self action:@selector(btnTextDriverClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnTextDriver setBackgroundImage:[UIImage imageNamed:@"gray_btn"] forState:UIControlStateNormal];
    [btnTextDriver setTitle:@"CANCEL ORDER" forState:UIControlStateNormal];
    [btnTextDriver setTitleColor:APP_TEXT_COLOR forState:UIControlStateNormal];
    btnTextDriver.titleLabel.font = FONT_TitilliumWeb_Regular(16.0);
    
    btnTextDriver.frame = CGRectMake(xPos, yCordinate, width, 40);
    [imgBackground addSubview:btnTextDriver];
    
    
}

-(void)btnCallDriverClicked
{
    
}
-(void)btnTextDriverClicked
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
