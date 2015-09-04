//
//  HelpViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "HelpViewController.h"
#import "TutorialViewController.h"
@interface HelpViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *arrTableData;
    UITableView *tblAboutUS;
}
@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HELP";
    
    [self designTableView];
    
    
}
-(UIView*)designHeaderView
{
    UIView *vwHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 40)];
    
    
//    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, vwHeader.frame.size.width-20, 30)];
//    lblHeader.text = @"Payment Methods";
//    lblHeader.textColor = APP_TEXT_COLOR;
//    lblHeader.font = FONT_TitilliumWeb_SemiBold(14.0);
//    [vwHeader addSubview:lblHeader];
    
    
    CALayer *borderLayer = [CALayer layer];
    CGFloat borderWidth = 1;
    borderLayer.borderColor = YELLOW_COLOR.CGColor;
    borderLayer.frame = CGRectMake(0, vwHeader.frame.size.height - borderWidth, vwHeader.frame.size.width, vwHeader.frame.size.height);
    borderLayer.borderWidth = borderWidth;
    [vwHeader.layer addSublayer:borderLayer];
    vwHeader.layer.masksToBounds = YES;
    
    return vwHeader;
}

-(void)designTableView{
    
    
    
    arrTableData = [[NSMutableArray alloc] initWithObjects:@"How ORBIS works?",@"Account FAQ",@"Service areas",@"Contact ORBIS" ,nil];
    
    tblAboutUS = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tblAboutUS];
    tblAboutUS.backgroundColor = [UIColor clearColor];
    tblAboutUS.tableHeaderView = [self designHeaderView];
    
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
            TutorialViewController *vwCont = [[TutorialViewController alloc] init];
            [self.navigationController pushViewController:vwCont animated:YES];

        }
            break;
        case 1:
        {
        }
            break;
        case 2:
        {
        }
            break;
        case 3:
        {
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
