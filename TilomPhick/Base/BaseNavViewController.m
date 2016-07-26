//
//  BaseNavViewController.m
//  TilomPhick
//
//  Created by Loulou on 16/7/25.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

//- (instancetype)init{
//
//    self = [super init];
//    if (self) {
////         self =
//        UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self];
//        navc.navigationBar.barTintColor = Main_Color;
//        
//        navc.navigationBar.shadowImage = [[UIImage alloc] init];
//        [navc.navigationBar setTranslucent:NO];
//        
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//        
//        [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        navc.navigationBar.tintColor = [UIColor whiteColor];
//        self = navc;
//    }
//    return self;
//}

+ (void)initialize {
    // 1.appearance方法返回一个导航栏的外观对象
    //修改了这个外观对象，相当于修改了整个项目中的外观
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBarTintColor:Main_Color];
    [navigationBar setTintColor:[UIColor whiteColor]];// iOS7的情况下,设置NavigationBarItem文字的颜色
    // 3.设置导航栏文字的主题
    NSShadow *shadow = [[NSShadow alloc]init];
    [shadow setShadowOffset:CGSizeZero];
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                            NSShadowAttributeName : shadow}];
    //    [navigationBar setBackgroundImage:[UIImage imageNamed:@"ic_cell_bg_selected"] forBarMetrics:UIBarMetricsDefault];
    // 4.修改所有UIBarButtonItem的外观
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    if (IOS7_OR_LATER) {
        [barButtonItem setTintColor:[UIColor whiteColor]];
    }else {
        // 修改item的背景图片
        //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        // 修改item上面的文字样式
        NSDictionary *dict =@{NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSShadowAttributeName : shadow};
        [barButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
        [barButtonItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    }
    //修改返回按钮样式
    //    [barButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
    // 5.设置状态栏样式
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
