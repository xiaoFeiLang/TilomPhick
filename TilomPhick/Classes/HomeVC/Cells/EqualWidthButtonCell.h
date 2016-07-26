//
//  EqualWidthButtonCell.h
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "UIButton+MyButton.h"
#import "CustomerButton.h"


@interface EqualWidthButtonCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet CustomerButton *ff;

@end
