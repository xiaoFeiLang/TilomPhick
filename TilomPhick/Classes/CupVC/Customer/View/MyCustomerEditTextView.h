//
//  MyCustomerEditTextView.h
//  TilomPhick
//
//  Created by Loulou on 16/8/9.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomerEditTextView : UIView

@property (nonatomic, strong) UIButton *grayBgView;
@property (nonatomic, copy) void(^requestDataBlock)(NSString *text);

+(instancetype)showWithController:(UIViewController *)controller;
+(void)showWithController:(UIViewController *)controller andRequestDataBlock:(void(^)(NSString *))requestDataBlock;
@end
