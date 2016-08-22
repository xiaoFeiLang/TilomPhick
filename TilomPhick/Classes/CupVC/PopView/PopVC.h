//
//  PopVC.h
//  TilomPhick
//
//  Created by Loulou on 16/8/16.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^InputText)(NSString *);
@interface PopVC : BaseViewController
@property (nonatomic, copy) void(^ClickBlock)(NSInteger);
@property(copy, nonatomic) InputText didInputText;
@end
