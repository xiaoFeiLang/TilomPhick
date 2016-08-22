//
//  MyCustomerBottomPockerView.h
//  TilomPhick
//
//  Created by Loulou on 16/8/9.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomerPickerView.h"

@interface MyCustomerBottomPockerView : UIView

@property (nonatomic, strong) UIView *grayBgView;
@property (nonatomic, strong) MyCustomerPickerView *editView;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, copy) void(^bottomResultPresent)(NSString *);
@property (nonatomic, strong) UITapGestureRecognizer *recognizer;

+(instancetype)showWithController:(UIViewController *)controller andData:(NSArray *)data;
-(instancetype)initWithController:(UIViewController *)controller;

+(void)showEditPickerViewWithController:(UIViewController *)controller andData:(NSArray *)data andBlock:(void (^)(NSString *temp))bottomResultPresent;

@end
