//
//  BaseViewController.m
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseViewController.h"
#import "TestVC.h"
#import "HomeVC.h"

@interface BaseViewController ()
{
    UIImageView *_barImage;

    RTSpinKitView *_spintView;

}
@property (nonatomic,strong) UIImageView* noDataView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

/**
 *  显示没有数据状态
 */
- (void)showNoMoreData{

    _noDataView = [[UIImageView alloc] init];
    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [_noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:_noDataView];
        }
    }];
}

-(void)removeNoDataImage{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
    }
}

/**
 *  显示加载动画
 */
- (void)showLoadingAnimation
{
    
    RTSpinKitView *spinner = [[RTSpinKitView alloc]initWithStyle:RTSpinKitViewStyleWave color:[UIColor colorWithRed:0.102 green:0.737 blue:0.612 alpha:1.0]];
    [self.view addSubview:spinner];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    spinner.center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    [spinner startAnimating];
    _spintView = spinner;
    
//    RTSpinKitView *spinner = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStylePulse color:[UIColor whiteColor]];
//    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.square = YES;
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.customView = spinner;
//    hud.labelText = NSLocalizedString(@"Loading", @"Loading");
//    
//    [spinner startAnimating];

}

/**
 *  停止加载动画
 */
- (void)stopLoadingAnimation
{
    [_spintView stopAnimating];
    [_spintView removeFromSuperview];
}

/**
 *  登录提示窗
 */
- (void)showShouldLoginPoint
{
    if (!self.actionSheet) {
        self.actionSheet = [MSAlertController alertControllerWithTitle:@"温馨提示" message:@"只有登录账户才能做此操作" preferredStyle:MSAlertControllerStyleAlert];
        self.actionSheet.titleFont = [UIFont systemFontOfSize:16];
        self.actionSheet.titleColor = [VTGeneralTool colorWithHex:@"#666666"];
        self.actionSheet.messageColor = [VTGeneralTool colorWithHex:@"#999999"];
        
        MSAlertAction *action1 = [MSAlertAction actionWithTitle:@"已有账号，立即登录" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            
//            [self goLogin];
        }];
        action1.titleColor = [VTGeneralTool colorWithHex:@"#275996"];
        action1.font = [UIFont systemFontOfSize:14];
        [self.actionSheet addAction:action1];
        
        MSAlertAction *action2 = [MSAlertAction actionWithTitle:@"没有账号？立即注册" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            
//            SZRegisterViewController *reg = [[SZRegisterViewController alloc]init];
//            reg.navigationItem.title = @"注册";
//            [[HHAppDelegate rootNavigationController] pushViewController:reg animated:YES];
            
        }];
        action2.font = [UIFont systemFontOfSize:14];
        action2.titleColor = [VTGeneralTool colorWithHex:@"#275996"];
        [self.actionSheet addAction:action2];
        
        MSAlertAction *action = [MSAlertAction actionWithTitle:@"暂不登录" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            return ;
        }];
        action.font = [UIFont systemFontOfSize:14];
        action.titleColor = [VTGeneralTool colorWithHex:@"#275996"];
        [self.actionSheet addAction:action];
    }
    
    
    
    [self presentViewController:self.actionSheet animated:YES completion:^{
        
        //        [self.actionSheet dismissViewControllerAnimated:YES completion:^{
        //
        //        }];
    }];
}

/**
 *  状态栏设置
 */
- (void)initStatusBar
{
    self.statusNotifation = [CWStatusBarNotification new];
    
    self.statusNotifation.notificationLabelBackgroundColor = Main_Color;
    self.statusNotifation.notificationLabelTextColor = [UIColor whiteColor];
}

- (void)showStatusBarWithTitle:(NSString *)title
{
    [self.statusNotifation displayNotificationWithMessage:@"正在发送中..." completion:^{
        
    }];
}

- (void)changeStatusBarTitle:(NSString *)title
{
    self.statusNotifation.notificationLabel.text = title;
}

- (void)hiddenStatusBar
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.statusNotifation dismissNotification];
    });
    
}

@end
