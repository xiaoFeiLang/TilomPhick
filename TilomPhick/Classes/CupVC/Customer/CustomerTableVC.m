//
//  CustomerTableVC.m
//  TilomPhick
//
//  Created by Loulou on 16/8/8.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "CustomerTableVC.h"
#import "MyCustomerView.h"
#import "MyCustomerBottomPockerView.h"
#import "MyCustomerEditTextView.h"
@interface CustomerTableVC ()
@property (nonatomic,weak)UIButton *button;
@end

@implementation CustomerTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    WEAK_SELF
    self.button = button;
    [button bk_addEventHandler:^(id sender) {
       
//        MyCustomerView
//        [wself popMyCustomerView];
        
//        [wself popPickView];
        [wself popTextView];
        
   } forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

- (void)popMyCustomerView{
   
    MyCustomerView *myView = [MyCustomerView alertViewWithTitle:@"title" content:@"content" cancel:@"cancel" sure:@"sure" cancelBtClick:^{
         NSLog(@"取消");
    } sureBtnClick:^{
         NSLog(@"sddsfsdsfd");
    }];
    [self.view addSubview:myView];
}

- (void)popPickView{
    [MyCustomerBottomPockerView showEditPickerViewWithController:self andData:@[@"早晨",@"中午",@"下午"] andBlock:^(NSString *temp) {
        [self.button setTitle:temp forState:UIControlStateNormal];
    }];
}

- (void) popTextView{
    [MyCustomerEditTextView showWithController:self andRequestDataBlock:^(NSString *text) {
        NSLog(@"这里面去实现数据的回调");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
