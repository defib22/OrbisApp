//
//  PaymentViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 02/09/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *arrTableData;
    NSMutableArray *arrIconImage;

    UITableView *tblAboutUS;
    UITextField *txtFldAddPay;
    UIButton *btnAddPay;
}
@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PAYMENT";
    
    [self designTableView];


}
-(UIView*)designHeaderView
{
    UIView *vwHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 60)];
    
    
     UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, vwHeader.frame.size.width-20, 30)];
    lblHeader.text = @"Payment Methods";
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

-(void)designTableView{
    
    
    arrIconImage = [[NSMutableArray alloc] initWithObjects:@"pay4",@"pay3",@"pay2",@"pay1" ,nil];

    arrTableData = [[NSMutableArray alloc] initWithObjects:@"Apple Pay",@"PayPal",@"My Comerica",@"Corporate Card" ,nil];
    
    tblAboutUS = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tblAboutUS];
    tblAboutUS.backgroundColor = [UIColor clearColor];
    tblAboutUS.tableHeaderView = [self designHeaderView];
    tblAboutUS.tableFooterView = [self designTableFooterView];
    
    tblAboutUS.delegate  =self;
    tblAboutUS.dataSource = self;
}

-(UIView*)designTableFooterView
{
    UIView *vwHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50)];
    
    btnAddPay = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAddPay.frame = CGRectMake(10, 20, CGRectGetWidth(self.view.frame)-20, 40);
    [btnAddPay setBackgroundImage:[UIImage imageNamed:@"fill"] forState:UIControlStateNormal];
    [btnAddPay setImage:[UIImage imageNamed:@"addpay"] forState:UIControlStateNormal];
    [btnAddPay setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 270)];
    [btnAddPay setTitle:@"ADD PAYMENT" forState:UIControlStateNormal];
    [btnAddPay setTitleEdgeInsets:UIEdgeInsetsMake(0, -120, 0, 70)];
    [btnAddPay setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btnAddPay.titleLabel.font = FONT_TitilliumWeb_Regular(14.0);
    [vwHeader addSubview:btnAddPay];
/*    txtFldAddPay = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, CGRectGetWidth(self.view.frame)-20, 40)];
    txtFldAddPay.borderStyle = UITextBorderStyleRoundedRect;
    txtFldAddPay.delegate = self;
    txtFldAddPay.placeholder = @"ADD PAYMENT";
    txtFldAddPay.font = FONT_TitilliumWeb_Regular(14.0);
    txtFldAddPay.leftView = [self prepareLeftViewWithImage:@"addpay"];
    txtFldAddPay.leftViewMode = UITextFieldViewModeAlways;
    [vwHeader addSubview:txtFldAddPay];*/
    
    return vwHeader;
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
    cell.imageView.image = [UIImage imageNamed:arrIconImage[indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeCenter;
    
    cell.textLabel.font = FONT_TitilliumWeb_Regular(14.0);
    cell.textLabel.text = arrTableData[indexPath.row];
    cell.textLabel.textColor = APP_TEXT_COLOR;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
