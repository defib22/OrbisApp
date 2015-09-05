//
//  RateCardViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "RateCardViewController.h"

@interface RateCardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bikeImageView;

@end

@implementation RateCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) viewWillAppear:(BOOL)animated{
    NSString *imageName=  @"";
    switch (self.RATE_CARD_FOR) {
        case BIKE_NOW:
            imageName= @"bike_now";
            break;
        case CAR_SHARE:
            imageName=@"car_share";
            break;
        case CAR_NOW:
            imageName=@"car_now";
            break;
            
        default:
            break;
    }
    self.bikeImageView.image = [UIImage imageNamed:imageName];
    [super viewWillAppear:animated];
}
- (IBAction)btnCrossClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
