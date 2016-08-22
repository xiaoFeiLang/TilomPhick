//
//  MyTextVC.m
//  TilomPhick
//
//  Created by Loulou on 16/8/9.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "MyTextVC.h"

@interface MyTextVC ()<UITextViewDelegate>
{
    UITextView *textView;
}
@property (nonatomic, strong) UITextView *textView;

@end

@implementation MyTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [[UITextView alloc] init];
    self.textView.textColor = [UIColor blackColor];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.delegate = self;
    self.textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.width.mas_equalTo(RC_X(800));
        make.height.mas_equalTo(RC_Y(280));
    }];
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.cornerRadius = 5;
    self.textView.clipsToBounds = YES;
    self.textView.text = @"hhhhhh";
    self.textView.returnKeyType = UIReturnKeyDefault;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.scrollEnabled = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
