//
//  BaseTabBarViewController.m
//  TilomPhick
//
//  Created by Loulou on 16/7/25.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    if (self.rdv_tabBarController.isTabBarHidden == _isShowTabbar)
    {//返回正常Tabbar
        [self.rdv_tabBarController setTabBarHidden:!_isShowTabbar];
    }

}
@end
