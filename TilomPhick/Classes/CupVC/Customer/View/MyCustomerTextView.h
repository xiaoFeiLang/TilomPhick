//
//  MyCustomerTextView.h
//  TilomPhick
//
//  Created by Loulou on 16/8/9.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomerTextView : UIView
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) void(^submitBlock)(NSString *);
@property (nonatomic, copy) void(^closeBlock)();
@end
