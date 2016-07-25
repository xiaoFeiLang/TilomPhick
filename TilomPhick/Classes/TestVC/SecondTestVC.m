//
//  SecondTestVC.m
//  TilomPhick
//
//  Created by Loulou on 16/7/25.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "SecondTestVC.h"

@interface SecondTestVC ()

@end

@implementation SecondTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}


@end
