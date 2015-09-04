//
//  HintViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "HintViewController.h"

@interface HintViewController ()

@end

@implementation HintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgHintBG = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imgHintBG.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.imgHintBG];
    
    
    [self designHintScreen];
}

-(void)designHintScreen
{
    switch (self.index) {
        case 0:
            self.imgHintBG.image = [UIImage imageNamed:@"hint1.png"];
            break;
            
        case 1:
            self.imgHintBG.image = [UIImage imageNamed:@"hint2.png"];
            break;
            
        case 2:
            self.imgHintBG.image = [UIImage imageNamed:@"hint3.png"];
            break;
            
            
        default:
            break;
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
