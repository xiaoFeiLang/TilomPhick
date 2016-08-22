//
//  MyCustomerPickerView.h
//  TilomPhick
//
//  Created by Loulou on 16/8/9.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomerPickerView : UIView

@property (nonatomic,weak)UIView *blackBgView;

@property (nonatomic,weak)UIToolbar *toolBarView;

@property (nonatomic,weak)UIView *mainBgView;

@property (nonatomic,weak)UIPickerView *pickerView;

@property (nonatomic,weak)UIButton *cancelBtn;

@property (nonatomic,weak)UIButton *sureBtn;

@property (nonatomic,strong)NSArray *data;

@property (nonatomic,copy) void (^refreshUserInterface)(NSString *);

@property (nonatomic,copy) void (^dropEditPickerView)();
@end
