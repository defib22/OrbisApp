//
//  TutorialViewController.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 24/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "TutorialViewController.h"
#import "HintViewController.h"



@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = YELLOW_COLOR;
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.view.backgroundColor = YELLOW_COLOR;
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    HintViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.shadowImage = nil;
    self.navigationController.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:APP_TEXT_COLOR, NSForegroundColorAttributeName,
                                                           FONT_TitilliumWeb_Regular(18), NSFontAttributeName, nil]];
    
}


- (HintViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    HintViewController *childViewController = [sb instantiateViewControllerWithIdentifier:@"HintViewController"];
    childViewController.index = index;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HintViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HintViewController *)viewController index];
    
    index++;
    
    if (index == TOTAL_PAGE) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return TOTAL_PAGE;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
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
