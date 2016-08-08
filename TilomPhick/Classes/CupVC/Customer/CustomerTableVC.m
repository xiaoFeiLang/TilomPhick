//
//  CustomerTableVC.m
//  TilomPhick
//
//  Created by Loulou on 16/8/8.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "CustomerTableVC.h"
#import "MyCustomerView.h"
@interface CustomerTableVC ()

@end

@implementation CustomerTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    WEAK_SELF
    [button bk_addEventHandler:^(id sender) {
       
        [wself popView];
   } forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

- (void)popView{
   
    MyCustomerView *myView = [MyCustomerView alertViewWithTitle:@"title" content:@"content" cancel:@"cancel" sure:@"sure" cancelBtClick:^{
         NSLog(@"取消");
    } sureBtnClick:^{
         NSLog(@"sddsfsdsfd");
    }];
    [self.view addSubview:myView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
