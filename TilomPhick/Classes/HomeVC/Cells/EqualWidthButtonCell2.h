//
//  EqualWidthButtonCell2.h
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CustomerButton.h"

typedef void(^clickButton)(UIButton *, NSInteger tag);
@interface EqualWidthButtonCell2 : BaseTableViewCell

@property (nonatomic, copy) clickButton clickButtonBlock;
@property (nonatomic, strong) CustomerButton *button;
@end
