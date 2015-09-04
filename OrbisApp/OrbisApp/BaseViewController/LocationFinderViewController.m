//
//  LocationFinderViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "LocationFinderViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>

@interface LocationFinderViewController ()<UITextFieldDelegate>
{
    CLGeocoder *geocoder;
    CLCircularRegion *region;
}


@end

@implementation LocationFinderViewController
@synthesize txtFldSearchBar,tblLocation;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = self.isForDropOff ? @"DROP OFF LOCATION" : @"PICKUP LOCATION";
    
    CGFloat yPos = 70;
    
    txtFldSearchBar = [[UITextField alloc] initWithFrame:CGRectMake(20, yPos, CGRectGetWidth(self.view.frame)-40, 40)];
    txtFldSearchBar.borderStyle = UITextBorderStyleRoundedRect;
    txtFldSearchBar.delegate = self;
    txtFldSearchBar.placeholder = @"Enter address or place";
    txtFldSearchBar.font = FONT_TitilliumWeb_Regular(14.0);
    txtFldSearchBar.rightView =  [self prepareLeftViewWithImage:@""];
    txtFldSearchBar.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:txtFldSearchBar];
    
    yPos+=txtFldSearchBar.frame.size.height+10;
    
    tblLocation = [[UITableView alloc] initWithFrame:CGRectMake(0, yPos, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-yPos) style:UITableViewStyleGrouped];
    tblLocation.delegate = self;
    tblLocation.dataSource = self;
    tblLocation.backgroundColor = CLEAR_COLOR;
    [self.view addSubview:tblLocation];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addressTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    arrPlaceMarks = [NSMutableArray new];
    
    [self enableLocationMethods];
}

-(void)enableLocationMethods
{
    geocoder = [[CLGeocoder alloc] init];
    //    region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(37.7577, -122.4376) radius:10000 identifier:@"region"];
    
}



-(void)addressTextDidChange:(NSNotification*)notification
{
    // Check if it is empty
    if(self.txtFldSearchBar.text.length == 0){
        [arrPlaceMarks removeAllObjects];
        [self.tblLocation reloadData];
        return;
    }
    
    [geocoder geocodeAddressString:self.txtFldSearchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(error != nil){
            NSLog(@"Error Occured While fetching location %@",error.localizedDescription);
        }
        else{
            [arrPlaceMarks removeAllObjects];
            [arrPlaceMarks addObjectsFromArray:placemarks];
            [self.tblLocation reloadData];
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return arrPlaceMarks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self formateedFullAddress:arrPlaceMarks[indexPath.row]];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(NSString*)formateedFullAddress:(CLPlacemark*) place{
    
    NSString *line = ABCreateStringWithAddressDictionary(place.addressDictionary, NO);
    NSString *addressLine = [line stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return addressLine;
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
