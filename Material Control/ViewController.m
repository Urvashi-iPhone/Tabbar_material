//
//  ViewController.m
//  Material Control
//
//  Created by Tecksky Techonologies on 1/7/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "ViewController.h"
#import <MaterialControls/MDTabBarViewController.h>
#import "secViewController.h"
#import "thirdViewController.h"
@interface ViewController ()<MDTabBarViewControllerDelegate>

@end

@implementation ViewController{
    MDTabBarViewController *tabBarViewController;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initContent];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initContent];
    }
    
    return self;
}

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil
//                         bundle:(NSBundle *)nibBundleOrNil {
//  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//    [self initContent];
//  }
//
//  return self;
//}

- (void)initContent {
    tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
    NSArray *names = @[
                       @"TAB ONE",
                       @"TWO",
                       @"TAB THREE",
                       @"FOUR",
                       @"FIVE",
                       @"SIX",
                       @"SEVEN",
                       @"EIGHT",
                       @"NINE",
                       @"TEN"
                       ];
    [tabBarViewController setItems:names];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:tabBarViewController];
    [self.view addSubview:tabBarViewController.view];
    [tabBarViewController didMoveToParentViewController:self];
    UIView *controllerView = tabBarViewController.view;
    id<UILayoutSupport> rootTopLayoutGuide = self.topLayoutGuide;
    id<UILayoutSupport> rootBottomLayoutGuide = self.bottomLayoutGuide;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(
                                                                   rootTopLayoutGuide, rootBottomLayoutGuide, controllerView);
    
    [self.view
     addConstraints:[NSLayoutConstraint
                     constraintsWithVisualFormat:@"V:[rootTopLayoutGuide]["
                     @"controllerView][" @"rootBottomLayoutGuide]"
                     options:0
                     metrics:nil
                     views:viewsDictionary]];
    [self.view
     addConstraints:[NSLayoutConstraint
                     constraintsWithVisualFormat:@"H:|[controllerView]|"
                     options:0
                     metrics:nil
                     views:viewsDictionary]];
    
    //  tabBarViewController.selectedIndex = 3;
    self.title = @"MDTabBarViewController";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)tabBarViewController:
(MDTabBarViewController *)viewController
                     viewControllerAtIndex:(NSUInteger)index {
    if (index == 0)
    {
    secViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"secViewController"];
            [self.navigationController pushViewController:controller animated:YES];
            NSLog(@"%d",index);
            return controller;
    }
    else
    {
        thirdViewController *controller1 = [self.storyboard instantiateViewControllerWithIdentifier:@"thirdViewController"];
                [self.navigationController pushViewController:controller1 animated:YES];
                   NSLog(@"%d",index);
                return controller1;
 
    }
}

- (void)tabBarViewController:(MDTabBarViewController *)viewController
              didMoveToIndex:(NSUInteger)index {
}

@end
