//
//  TutorialViewController.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "BaseViewController.h"

#define TOTAL_PAGE 3
@interface TutorialViewController : BaseViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;


@end
