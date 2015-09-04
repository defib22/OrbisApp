//
//  LocationFinderViewController.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseViewController.h"

@interface LocationFinderViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrPlaceMarks;
    UITextField *txtFldSearchBar;
    UITableView *tblLocation;
}

@property(nonatomic,assign)BOOL isForDropOff;

@property (strong, nonatomic) UITextField *txtFldSearchBar;

@property (strong, nonatomic) UITableView *tblLocation;


@end
