//
//  EqualWidthButtonCell2.m
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "EqualWidthButtonCell2.h"

@implementation EqualWidthButtonCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i=0; i<4; i++) {
            self.button = [[CustomerButton alloc] init];
            CGFloat width = ScreenWidth / 4;
            CGFloat height = RC_Y(160);
            [self.button setTitle:[NSString stringWithFormat:@"Title%d",i] forState:UIControlStateNormal];
            self.button.frame = CGRectMake(i*width, 0, width, height);
            [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.button setImage:[UIImage imageNamed:@"btn_redPacket_close"] forState:UIControlStateNormal];
            self.button.tag = i + 100;
            self.button.titleLabel.font = FONT(11);
            [self.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:self.button];
            
        }
    }
    return self;
}

- (void)clickButton:(UIButton *)sender{
    if (self.clickButtonBlock) {
        self.clickButtonBlock(sender, sender.tag);
    }
}
@end
