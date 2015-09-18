
/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
 
*/

#import "RearViewController.h"

#import "SWRevealViewController.h"
#import "AppDelegate.h"


@interface RearViewController()
{
    NSInteger _presentedRow;
    NSArray *arrShareIcons;
}

@end

@implementation RearViewController

@synthesize rearTableView = _rearTableView;


#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImageView *imgBg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgBg.image = [UIImage imageNamed:@"side_bar"];
    imgBg.userInteractionEnabled = YES;
    self.rearTableView.backgroundView = imgBg;

    self.rearTableView.tableHeaderView = [self designTableHeaderView];
    self.navigationController.navigationBarHidden = YES;
    [self setNeedsStatusBarAppearanceUpdate];
    //    self.title = NSLocalizedString(@"Rear View", nil);
    
    arrShareIcons = [NSArray arrayWithObjects:@"SIDE_PROFILE",@"SIDE_PAYMENT",@"SIDE_TRACKING",@"SIDE_HISTORY",@"SIDE_PROMOTIONAL",@"SIDE_HELP",@"SIDE_SHARE",@"SIDE_ABOUT", nil];
    
    arrTableData = [[NSMutableArray alloc] initWithObjects:@"PROFILE",@"PAYMENT",@"TRACKING",@"HISTORY",@"PROMOTIONS",@"HELP",@"SHARE",@"ABOUT",nil];
}



-(UIView*)designTableHeaderView{
    UIImageView *vwHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 128)];
    vwHeader.backgroundColor = [UIColor clearColor];
//    vwHeader.image = [UIImage imageNamed:@"navBar.png"];
    
    UIImageView *imgLogo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 50, 50)];
    imgLogo.backgroundColor = [UIColor clearColor];
    imgLogo.layer.cornerRadius = 25.0;
    imgLogo.image = [UIImage imageNamed:@"receipt_img"];
    imgLogo.clipsToBounds = YES;
    [vwHeader addSubview:imgLogo];
    
    CGFloat yCord = 40;
    CGFloat lblHeight = 50.0;
    
    UILabel *lblHello = [[UILabel alloc] initWithFrame:CGRectMake(70, yCord, CGRectGetWidth(vwHeader.frame) , lblHeight)];
    lblHello.text = [[[UserProfileBO sharedInstance] firstName] uppercaseString];
    lblHello.textColor = [UIColor whiteColor];
    lblHello.font = FONT_TitilliumWeb_SemiBold(16.0);
    [vwHeader addSubview:lblHello];

    yCord+=lblHeight;
    
    return vwHeader;
    }
    




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
            return 44.0;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        tableView.separatorColor = [UIColor clearColor];
    }
    
    cell.imageView.backgroundColor = [UIColor clearColor];
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2;
    cell.imageView.image = [UIImage imageNamed:arrShareIcons[indexPath.row]];
    cell.imageView.clipsToBounds = YES;

    cell.textLabel.text = arrTableData[indexPath.row];
    cell.textLabel.font = FONT_TitilliumWeb_Regular(14.0);
    cell.textLabel.textColor = [UIColor whiteColor];

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    SWRevealViewController *revealController = self.revealViewController;
    
    // selecting row
    NSInteger row = indexPath.row;
    
    // if we are trying to push the same row or perform an operation that does not imply frontViewController replacement
    // we'll just set position and return
    
    // otherwise we'll create a new frontViewController and push it with animation

    UIViewController *newFrontController = nil;

    if (row == 0)
    {
         [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        
        _presentedRow = row;  // <- store the presented row

        [revealController _handleTapGesture:nil];
        return;
    }
    
    else if (row == 1)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];

        _presentedRow = row;  // <- store the presented row
        
        [revealController _handleTapGesture:nil];
        return;
    }
    else if (row == 2)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        
        _presentedRow = row;  // <- store the presented row
        
        [revealController _handleTapGesture:nil];
        return;
    }
    else if (row ==3)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        
        _presentedRow = row;  // <- store the presented row
        
        [revealController _handleTapGesture:nil];
        return;
    }

    
    else if (row == 4)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        _presentedRow = row;  // <- store the presented row
        
        
        [revealController _handleTapGesture:nil];
        return;
    }
    else if (row == 5)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        _presentedRow = row;  // <- store the presented row
        
        
        [revealController _handleTapGesture:nil];
        return;
    }
    else if (row ==6)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        
        _presentedRow = row;  // <- store the presented row
        
        [revealController _handleTapGesture:nil];
        return;
    }
    
    else if (row ==7)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationFromLeftMenuForMerchant object:[NSNumber numberWithInteger:row]];
        
        _presentedRow = row;  // <- store the presented row
        
        [revealController _handleTapGesture:nil];
        return;
    }
    

    
    else{
        return;
    }
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newFrontController];
    [revealController pushFrontViewController:navigationController animated:YES];
    
    _presentedRow = row;  // <- store the presented row
}



@end