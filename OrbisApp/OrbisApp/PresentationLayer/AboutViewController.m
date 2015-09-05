//
//  AboutViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "AboutViewController.h"
#import "CopyRightViewController.h"
#import "LiceneceViewController.h"
#import "TermsAndCondViewController.h"
#import "PrivacyViewController.h"

@interface AboutViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrTableData;
    UITableView *tblAboutUS;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ABOUT";
    
    // Do any additional setup after loading the view.
    [self designTableView];
}

-(UIView*)designHeaderView
{
    UIView *vwHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300)];
    
    UITextView *txtVw = [[UITextView alloc] initWithFrame:CGRectMake(20, 23, CGRectGetWidth(self.view.frame)-40, 250)];
    txtVw.text = DUMMY_TEXT;
    txtVw.scrollEnabled = NO;
    txtVw.font = FONT_TitilliumWeb_Regular(14.0);
    txtVw.editable = NO;
    [vwHeader addSubview:txtVw];
    
    
    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, txtVw.frame.size.height+20, txtVw.frame.size.width, 20)];
    lblHeader.text = @"LEGAL";
    lblHeader.textColor = APP_TEXT_COLOR;
    lblHeader.font = FONT_TitilliumWeb_SemiBold(14.0);
    [vwHeader addSubview:lblHeader];
    
    
    CALayer *borderLayer = [CALayer layer];
    CGFloat borderWidth = 1;
    borderLayer.borderColor = YELLOW_COLOR.CGColor;
    borderLayer.frame = CGRectMake(0, vwHeader.frame.size.height - borderWidth, vwHeader.frame.size.width, vwHeader.frame.size.height);
    borderLayer.borderWidth = borderWidth;
    [vwHeader.layer addSublayer:borderLayer];
    vwHeader.layer.masksToBounds = YES;

    return vwHeader;
}

-(UIView*)designTableFooterView
{
    UIView *vwHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50)];

    UILabel *lblFooter = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, CGRectGetWidth(self.view.frame)-80, 50)];
    lblFooter.numberOfLines = 0;
    lblFooter.textColor = APP_TEXT_COLOR;
    lblFooter.font = FONT_TitilliumWeb_Regular(12.0);
    lblFooter.text = @"2012-2014 Orbis Software Solutions, Inc. All Rights Reserved.";
    [vwHeader addSubview:lblFooter];
    return vwHeader;
}

-(void)designTableView{
    
    arrTableData = [[NSMutableArray alloc] initWithObjects:@"Copyright",@"Privacy Policy",@"Terms & Conditions",@"Licences" ,nil];
    
    tblAboutUS = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tblAboutUS];
    tblAboutUS.backgroundColor = [UIColor clearColor];
    tblAboutUS.tableHeaderView = [self designHeaderView];
    tblAboutUS.tableFooterView = [self designTableFooterView];

    tblAboutUS.delegate  =self;
    tblAboutUS.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return arrTableData.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.font = FONT_TitilliumWeb_Regular(14.0);
    cell.textLabel.text = arrTableData[indexPath.row];
    cell.textLabel.textColor = APP_TEXT_COLOR;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            CopyRightViewController *vwCont = [[CopyRightViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];
        }
            break;
        case 1:
        {
            PrivacyViewController *vwCont = [[PrivacyViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];
            
        }
            break;
        case 2:
        {
            TermsAndCondViewController *vwCont = [[TermsAndCondViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
            break;
        case 3:
        {
            LiceneceViewController *vwCont = [[LiceneceViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
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
