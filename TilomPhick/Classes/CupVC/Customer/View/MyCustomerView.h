//
//  MyCustomerView.h
//  TilomPhick
//
//  Created by Loulou on 16/8/8.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^cancelBlock)();
typedef void (^sureBlock)();

@interface MyCustomerView : UIView

@property (nonatomic, copy) cancelBlock cancel_block;
@property (nonatomic, copy) sureBlock sure_block;

+ (instancetype)alertViewWithTitle:(NSString *)title
                           content:(NSString *)content
                            cancel:(NSString *)cancel
                              sure:(NSString *)sure
                     cancelBtClick:(cancelBlock)cancelBlock
                      sureBtnClick:(sureBlock)sureBlock;
@end
