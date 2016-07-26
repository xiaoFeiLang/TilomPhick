//
//  TestVC.m
//  TilomPhick
//
//  Created by Loulou on 16/7/25.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "TestVC.h"
#import "HySideScrollingImagePicker.h"
#import "SecondTestVC.h"
#import "LXNetworking.h"
@interface TestVC ()

@property (nonatomic,strong)LXURLSessionTask *task;

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id  _Nonnull sender) {


// 弹出框
//    HyActionSheet *action = [[HyActionSheet alloc] initWithCancelStr:@"取消" otherButtonTitles:@[@"收藏",@"分享"] AttachTitle:@"收藏后可以在个人中心随时查到该条问题 \n 回答的不错,快分享给朋友吧"];
//    [action ChangeTitleColor:[UIColor redColor] AndIndex:1];
//
//    [action ButtonIndex:^(NSInteger Buttonindex) {
//        
//    }];

        
//        SecondTestVC *vc = [[SecondTestVC alloc] init];
//        [vc.rdv_tabBarController setTabBarHidden:NO animated:YES];
//        [self.navigationController pushViewController:vc animated:YES];
        
        
//弹出登录框
        
//        [self showShouldLoginPoint];
        

// 网络请求(下载)
//        [self showLoadingAnimation];
//        NSString *path=[NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/image.jpg"]];
//        _task = [LXNetworking downloadWithUrl:@"http://www.aomy.com/attach/2012-09/1347583576vgC6.jpg" saveToPath:path progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
//            //封装方法里已经回到主线程，所有这里不用再调主线程了
//            NSLog(@"%@", [NSString stringWithFormat:@"进度==%.2f",1.0 * bytesProgress/totalBytesProgress]);
//        
//        } success:^(id response) {
//            NSLog(@"---------%@",response);
//            [self stopLoadingAnimation];
//
//        } failure:^(NSError *error) {
//            
//        } showHUD:NO];
        
// 网络请求(get)
//        _task = [LXNetworking getWithUrl:@"http://192.168.0.10/qxb/api/PublicAttr/areaList/pid/0" params:nil success:^(id response) {
//            
//        } fail:^(NSError *error) {
//            
//        } showHUD:NO];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
