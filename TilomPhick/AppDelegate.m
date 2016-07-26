//
//  AppDelegate.m
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "AppDelegate.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "HomeVC.h"
#import "TestVC.h"
#import "CupVC.h"
#import "MySelfVC.h"
#import "BaseTabBarViewController.h"
#import "BaseNavViewController.h"
@interface AppDelegate ()<RDVTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
//    [self.window setRootViewController:self.viewController];
    [self setRoot];
    [self.window makeKeyAndVisible];
    
    [self customizeInterface];
//    [self setRoot];
    return YES;
}


- (void)setupViewControllers {
    
    TestVC *testVC = [[TestVC alloc]init];
    
    HomeVC *homeVC  = [[HomeVC alloc]init];
    
    CupVC *cupVC = [[CupVC alloc]init];
    
    MySelfVC *mySelfVC = [[MySelfVC alloc]init];
    
//    UIViewController *firstNavigationController = [[BaseNavViewController alloc]
//                                                   initWithRootViewController:testVC];
//    
//    
//    UIViewController *secondNavigationController = [[BaseNavViewController alloc]
//                                                    initWithRootViewController:homeVC];
//    
//    
//    UIViewController *thirdNavigationController = [[BaseNavViewController alloc]
//                                                   initWithRootViewController:cupVC];
//    
//    UIViewController *fourNavigationController = [[BaseNavViewController alloc]
//                                                   initWithRootViewController:mySelfVC];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
//    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
//                                           thirdNavigationController,fourNavigationController]];
    [tabBarController setViewControllers:@[testVC, homeVC, cupVC, mySelfVC]];
    tabBarController.delegate = self;
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

//- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
//    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
//    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
//    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
//    
//    NSInteger index = 0;
//    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
//        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
//        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
//                                                      [tabBarItemImages objectAtIndex:index]]];
//        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
//                                                        [tabBarItemImages objectAtIndex:index]]];
//        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
//        
//        index++;
//    }
//}

- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[TestVC class]])
    {
        tabBarController.navigationItem.title = @"Test";
    }
    if ([viewController isKindOfClass:[HomeVC class]])
    {
        tabBarController.navigationItem.title = @"Home";
    }
    if ([viewController isKindOfClass:[CupVC class]])
    {
        tabBarController.navigationItem.title = @"Cup";
    }
    if ([viewController isKindOfClass:[MySelfVC class]])
    {
        tabBarController.navigationItem.title = @"Myself";
    }
}

- (void)customizeInterface {
     
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor redColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}


- (void)setTabbarController
{
    TestVC *test = [[TestVC alloc]init];
    
    HomeVC *home  = [[HomeVC alloc]init];
    
    CupVC *cup = [[CupVC alloc]init];
    
    MySelfVC *myself = [[MySelfVC alloc]init];
    
    BaseTabBarViewController *tabBarController = [[BaseTabBarViewController alloc] init];
    [tabBarController setViewControllers:@[test,home,cup,myself]];
    self.viewController = tabBarController;
    tabBarController.delegate = self;
    [self customizeTabBarForController:tabBarController];
}

- (void)setRoot
{
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    navc.navigationBar.barTintColor = Main_Color;
    
    navc.navigationBar.shadowImage = [[UIImage alloc] init];
    [navc.navigationBar setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navc.navigationBar.tintColor = [UIColor whiteColor];
    self.window.rootViewController = navc;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    
    UIImage *finishedImage = [VTGeneralTool createImageWithColor:[UIColor whiteColor]];
    UIImage *unfinishedImage = [VTGeneralTool createImageWithColor:[UIColor whiteColor]];
    NSArray *tabBarItemImages = @[@"tpo_tab_home",@"tpo_tab_found",@"tab_children",@"tpo_tab_course",@"tpo_tab_user"];
    NSArray *selectedImages = @[@"tpo_tab_home_pre",@"tpo_tab_found_pre",@"tab_children_pre",@"tpo_tab_course_pre",@"tpo_tab_user_pre"];
    
    
    NSInteger index = 0;
    [[tabBarController tabBar] setTranslucent:YES];
    
    /**
     *  自个加的
     */
    if ([tabBarController.viewControllers[0] isKindOfClass:[TestVC class]]){
        tabBarController.navigationItem.title = @"Test";
    }
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage *unselectedimage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        //        item.imagePositionAdjustment = UIOffsetMake(0, -5);
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        NSDictionary *unseleAtrr = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:11],
                                     NSForegroundColorAttributeName: VTColor(65, 85, 129),
                                     };
        NSDictionary *seleAtrr = @{
                                   NSFontAttributeName: [UIFont systemFontOfSize:11],
                                   NSForegroundColorAttributeName: Main_Color,
                                   };
        [item setUnselectedTitleAttributes:unseleAtrr];
        [item setSelectedTitleAttributes:seleAtrr];
        
        [item setTitle:@[@"Test",@"Home",@"Cup",@"Myself"][index]];
        index++;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end


////
////  AppDelegate.m
////  TilomPhick
////
////  Created by Loulou on 16/7/22.
////  Copyright © 2016年 QXB. All rights reserved.
////
//
//#import "AppDelegate.h"
//#import "ViewController.h"
//#import "RDVTabBarController.h"
//#import "RDVTabBarItem.h"
//#import "ViewController.h"
//#import "HomeVC.h"
//#import "TestVC.h"
//#import "BaseTabBarViewController.h"
#import "BaseNavViewController.h"
#import "CupVC.h"
#import "MySelfVC.h"
//@interface AppDelegate ()<RDVTabBarControllerDelegate>
//
//@end
//
//@implementation AppDelegate
//
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//
//    [self setTabbarController];
//    [self setRoot];
//    
//    return YES;
//}
//
//- (void)setTabbarController
//{
//    TestVC *school = [[TestVC alloc]init];
//   
//    HomeVC *child  = [[HomeVC alloc]init];
//    
//
//    ViewController *edu = [[ViewController alloc]init];
//   
//    ViewController *courseList = [[ViewController alloc]init];
//
//    ViewController *about = [[ViewController alloc]init];
//    
//    BaseTabBarViewController *tabBarController = [[BaseTabBarViewController alloc] init];
//    [tabBarController setViewControllers:@[school,edu,child,courseList,about]];
//    self.viewController = tabBarController;
//    tabBarController.delegate = self;
//    [self customizeTabBarForController:tabBarController];
//}
//
//- (void)setRoot
//{
//    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
//    navc.navigationBar.barTintColor = Main_Color;
//    
//    navc.navigationBar.shadowImage = [[UIImage alloc] init];
//    [navc.navigationBar setTranslucent:NO];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    
//    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    navc.navigationBar.tintColor = [UIColor whiteColor];
//    self.window.rootViewController = navc;
//}
//
//- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
//{
//    
//    UIImage *finishedImage = [VTGeneralTool createImageWithColor:[UIColor whiteColor]];
//    UIImage *unfinishedImage = [VTGeneralTool createImageWithColor:[UIColor whiteColor]];
//    NSArray *tabBarItemImages = @[@"tpo_tab_home",@"tpo_tab_found",@"tab_children",@"tpo_tab_course",@"tpo_tab_user"];
//    NSArray *selectedImages = @[@"tpo_tab_home_pre",@"tpo_tab_found_pre",@"tab_children_pre",@"tpo_tab_course_pre",@"tpo_tab_user_pre"];
//    
//    
//    NSInteger index = 0;
//    [[tabBarController tabBar] setTranslucent:YES];
//    
//    /**
//     *  自个加的
//     */
//    if ([tabBarController.viewControllers[0] isKindOfClass:[TestVC class]]){
//        tabBarController.navigationItem.title = @"1";
//    }
//    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
//    {
//        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
//        UIImage *selectedimage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
//        UIImage *unselectedimage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
//        //        item.imagePositionAdjustment = UIOffsetMake(0, -5);
//        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
//        NSDictionary *unseleAtrr = @{
//                                     NSFontAttributeName: [UIFont systemFontOfSize:11],
//                                     NSForegroundColorAttributeName: VTColor(65, 85, 129),
//                                     };
//        NSDictionary *seleAtrr = @{
//                                   NSFontAttributeName: [UIFont systemFontOfSize:11],
//                                   NSForegroundColorAttributeName: Main_Color,
//                                   };
//        [item setUnselectedTitleAttributes:unseleAtrr];
//        [item setSelectedTitleAttributes:seleAtrr];
//
//        [item setTitle:@[@"1",@"2",@"3",@"4",@"5"][index]];
//        index++;
//    }
//}
//
//- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    if ([viewController isKindOfClass:[TestVC class]])
//    {
//        tabBarController.navigationItem.title = @"1";
//    }
//    if ([viewController isKindOfClass:[HomeVC class]])
//    {
//        tabBarController.navigationItem.title = @"2";
//    }
//    if ([viewController isKindOfClass:[ViewController class]])
//    {
//        tabBarController.navigationItem.title = @"3";
//    }
//    if ([viewController isKindOfClass:[ViewController class]])
//    {
//        tabBarController.navigationItem.title = @"4";
//    }
//    if ([viewController isKindOfClass:[ViewController class]])
//    {
//        tabBarController.navigationItem.title = @"5";
//    }
//}
//- (void)applicationWillResignActive:(UIApplication *)application {
//    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}
//
//@end
