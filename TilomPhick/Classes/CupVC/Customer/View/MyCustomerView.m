//
//  MyCustomerView.m
//  TilomPhick
//
//  Created by Loulou on 16/8/8.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "MyCustomerView.h"

@interface MyCustomerView ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *cancel;
@property (nonatomic, strong) NSString *sure;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, strong) UIButton *cancelBt;
@property (nonatomic, strong) UIButton *sureBt;

@end
@implementation MyCustomerView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //标题
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
        _titleLb.textAlignment=NSTextAlignmentCenter;
        _titleLb.textColor=[UIColor blackColor];
        [self addSubview:_titleLb];
        //内容
        _contentLb=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLb.frame), self.bounds.size.width, 50)];
        _contentLb.textAlignment=NSTextAlignmentCenter;
        _contentLb.textColor=[UIColor redColor];
        [self addSubview:_contentLb];
        //取消按钮
        _cancelBt=[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contentLb.frame), self.bounds.size.width/2, 50)];
        _cancelBt.layer.borderColor=[UIColor grayColor].CGColor;
        _cancelBt.layer.borderWidth=0.5;
        [_cancelBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBt addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBt];
        //确定按钮
        _sureBt=[[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width/2, CGRectGetMaxY(_contentLb.frame), self.bounds.size.width/2, 50)];
        _sureBt.layer.borderColor=[UIColor grayColor].CGColor;
        _sureBt.layer.borderWidth=0.5;
        [_sureBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBt addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBt];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           content:(NSString *)content
                            cancel:(NSString *)cancel
                              sure:(NSString *)sure
                     cancelBtClick:(cancelBlock)cancelBlock
                      sureBtnClick:(sureBlock)sureBlock{
    MyCustomerView *alterView=[[MyCustomerView alloc]initWithFrame:CGRectMake(0, 0, 250, 150)];
    alterView.backgroundColor=[UIColor whiteColor];
    alterView.center=CGPointMake(ScreenWidth/2, ScreenHeight/2);
    alterView.layer.cornerRadius=5;
    alterView.layer.masksToBounds=YES;
    alterView.title=title;
    alterView.content=content;
    alterView.cancel=cancel;
    alterView.sure=sure;
    alterView.cancel_block=cancelBlock;
    alterView.sure_block=sureBlock;
    return alterView;
}

#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title
{
    _titleLb.text=title;
}
-(void)setContent:(NSString *)content
{
    _contentLb.text=content;
}
-(void)setSure:(NSString *)sure
{
    [_sureBt setTitle:sure forState:UIControlStateNormal];
}
-(void)setCancel:(NSString *)cancel
{
    [_cancelBt setTitle:cancel forState:UIControlStateNormal];
}
#pragma mark----取消按钮点击事件
-(void)cancelBtClick
{
    [self removeFromSuperview];
    self.cancel_block();
}
#pragma mark----确定按钮点击事件
-(void)sureBtClick
{
    [self removeFromSuperview];
    self.sure_block();
}
@end
