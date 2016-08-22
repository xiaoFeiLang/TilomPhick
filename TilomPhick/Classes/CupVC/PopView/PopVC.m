//
//  PopVC.m
//  TilomPhick
//
//  Created by Loulou on 16/8/16.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "PopVC.h"

@interface PopVC ()

@property (nonatomic, strong) UIView *popCustomerView;

@end

@implementation PopVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.popCustomerView = [[UIView alloc] init];
    self.popCustomerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.popCustomerView];
    [self.popCustomerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(RC_Y(400));
        make.top.equalTo(self.view).offset(-400);
    }];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.popCustomerView addSubview:leftbutton];
    [leftbutton setTitle:@"click" forState:UIControlStateNormal];
    [leftbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    leftbutton.tag = 101;
    WEAK_SELF
    [leftbutton bk_addEventHandler:^(id sender) {
        
    } forControlEvents:UIControlEventTouchUpInside];
    [leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.popCustomerView);
        make.centerY.equalTo(self.popCustomerView);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button bk_addEventHandler:^(id sender) {
        
        [wself popView];
    } forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];

    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button2];
    [button2 setTitle:@"click" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 bk_addEventHandler:^(id sender) {
        
        [wself dismiss];
    } forControlEvents:UIControlEventTouchUpInside];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(40);
        make.centerX.equalTo(button);
        make.size.mas_equalTo(button);
    }];
}

- (void)popView{
    
    [UIView animateWithDuration:0.5 animations:^{

        self.popCustomerView.center = CGPointMake(ScreenWidth/2, 100);

    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.popCustomerView.center = CGPointMake(ScreenWidth/2, -100);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
