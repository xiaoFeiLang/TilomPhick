//
//  BaseViewController.h
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStatusBarNotification.h"
@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isShowTabbar;
@property (nonatomic,strong) MSAlertController *actionSheet;
@property (nonatomic,strong) CWStatusBarNotification *statusNotifation;

/**
 *  显示没有数据页面
 */
- (void)showNoMoreData;

/**
 *  移除无数据页面
 */
-(void)removeNoDataImage;

/**
 *  加载视图
 */
- (void)showLoadingAnimation;

/**
 *  停止加载
 */
- (void)stopLoadingAnimation;

/**
 *  需要登录
 */
- (void)showShouldLoginPoint;

/**
 *  状态栏
 */
- (void)initStatusBar;

- (void)showStatusBarWithTitle:(NSString *)title;

- (void)changeStatusBarTitle:(NSString *)title;

- (void)hiddenStatusBar;
@end
