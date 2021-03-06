//
//  ViewController.m
//  PageMenuDemoStoryboard
//
//  Created by Jin Sasaki on 2015/06/05.
//  Copyright (c) 2015年 Jin Sasaki. All rights reserved.
//

#import "ViewController.h"

#define Color_LightGreen [UIColor colorWithRed:195/255.0 green:232/255.0 blue:147/255.0 alpha:1.0]
#define Color_DarkGreen [UIColor colorWithRed:64/255.0 green:96/255.0 blue:22/255.0 alpha:1.0]
#define Color_MediumGreenLighter [UIColor colorWithRed:142/255.0 green:183/255.0 blue:88/255.0 alpha:1.0]

@interface ViewController ()
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PAGE MENU";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor]};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<-" style:UIBarButtonItemStyleDone target:self action:@selector(didTapGoToLeft)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"->" style:UIBarButtonItemStyleDone target:self action:@selector(didTapGoToRight)];
    
    TestTableViewController *controller1 = [[TestTableViewController alloc]initWithNibName:@"TestTableViewController" bundle:nil];
    controller1.title = @"Typ av anslutning";
    TestCollectionViewController *controller2 = [[TestCollectionViewController alloc]initWithNibName:@"TestCollectionViewController" bundle:nil];
    controller2.title = @"Arbete på servis";
    TestViewController *controller3 = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    controller3.title = @"Beställare";
    TestViewController *controller4 = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    controller4.title = @"Skicka in ärende";
    
    NSArray *controllerArray = @[controller1, controller2, controller3, controller4];
    
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:Color_LightGreen,
                                 CAPSPageMenuOptionViewBackgroundColor:Color_LightGreen,
                                 CAPSPageMenuOptionSelectionIndicatorColor:Color_DarkGreen,
                                 CAPSPageMenuOptionBottomMenuHairlineColor:Color_MediumGreenLighter,
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue-Medium" size:11],
                                 CAPSPageMenuOptionMenuHeight: @(42.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor:Color_DarkGreen,
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor:Color_MediumGreenLighter,
                                 CAPSPageMenuOptionSeparatorImage:[UIImage imageNamed:@"Separator_arrow"],
                                 CAPSPageMenuOptionMenuItemSeparatorColor: [UIColor clearColor],
                                 CAPSPageMenuOptionHideLastSeparator:@(YES)
                                 };
    
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    
    
    MenuItemView *menuItemView1 = [[_pageMenu menuItems] objectAtIndex:1];
    [menuItemView1 showBadgeWithTitle:@"0" backgroundColor:Color_DarkGreen];
    
    MenuItemView *menuItemView3 = [[_pageMenu menuItems] objectAtIndex:2];
    [menuItemView3 showBadgeWithTitle:@"!" backgroundColor:[UIColor redColor]];
    
    
    [self.view addSubview:_pageMenu.view];
}

- (void)didTapGoToLeft {
    NSInteger currentIndex = self.pageMenu.currentPageIndex;
    
    if (currentIndex > 0) {
        [_pageMenu moveToPage:currentIndex - 1];
    }
}

- (void)didTapGoToRight {
    NSInteger currentIndex = self.pageMenu.currentPageIndex;
    
    if (currentIndex < self.pageMenu.controllerArray.count) {
        [self.pageMenu moveToPage:currentIndex + 1];
    }
}

@end
