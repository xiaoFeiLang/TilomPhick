//
//  TestVC.m
//  TilomPhick
//
//  Created by Loulou on 16/7/25.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "TestVC.h"
#import "HySideScrollingImagePicker.h"
#import "SecondTestVC.h"
@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id  _Nonnull sender) {
        

//*************************************************** 弹出框start  ************************************************************

//    HyActionSheet *action = [[HyActionSheet alloc] initWithCancelStr:@"取消" otherButtonTitles:@[@"收藏",@"分享"] AttachTitle:@"收藏后可以在个人中心随时查到该条问题 \n 回答的不错,快分享给朋友吧"];
//    [action ChangeTitleColor:[UIColor redColor] AndIndex:1];
//
//    [action ButtonIndex:^(NSInteger Buttonindex) {
//        
//    }];
//***************************************************   end   ************************************************************
        
//        SecondTestVC *vc = [[SecondTestVC alloc] init];
//        [vc.rdv_tabBarController setTabBarHidden:NO animated:YES];
//        [self.navigationController pushViewController:vc animated:YES];
        [self showShouldLoginPoint];
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
