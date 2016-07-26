//
//  BaseViewController.m
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseViewController.h"
#import "TestVC.h"
#import "HomeVC.h"

@interface BaseViewController ()
{
    UIImageView *_barImage;

}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = BackGround_Color;
//    
////    _isShowTabbar = YES;
//    
////    self.hidesBottomBarWhenPushed = YES;
//    
//    self.navigationController.navigationBar.translucent = NO;
//    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    [self setUpNav];
//    
//    [self createNavBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
//    [self rdv_tabBarController].navigationItem.titleView = nil;
//    if ([self isKindOfClass:[TestVC class]] || [self isKindOfClass:[HomeVC class]]  || [self isKindOfClass:[TestVC class]]  || [self isKindOfClass:[TestVC class]])
//    {
//        [self messageBar];
//    }
//    else
//    {
//        [self rdv_tabBarController].navigationItem.rightBarButtonItem = nil;
//        [self rdv_tabBarController].navigationItem.rightBarButtonItems = nil;
//    }
//    
//    [self rdv_tabBarController].navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
////    
//    if (self.rdv_tabBarController.isTabBarHidden == _isShowTabbar)
//    {//返回正常Tabbar
//        [self.rdv_tabBarController setTabBarHidden:!_isShowTabbar];
//    }

//    if ([SZUserDefault boolForKey:@"GETNotifation"])
//    {
//        [self getMessage];
//    }
//    else
//    {
//        _barImage.image = [UIImage imageNamed:@"tixing_xiaoxi"];
//    }
//    
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)messageBar
{
    _barImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tixing_xiaoxi"] ];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickMessage)];
    [_barImage addGestureRecognizer:tap];
    
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:_barImage];
    
    [self rdv_tabBarController].navigationItem.rightBarButtonItem = bar;
}

@end
